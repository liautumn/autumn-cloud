package com.autumn.websocket.webSocket;

import com.autumn.dictionary.Dictionary;
import com.autumn.redis.RedisUtil;
import com.autumn.springConfig.StaticMethodGetBean;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Slf4j
@Component
@ServerEndpoint("/websocket/{userId}")
public class WebSocket {

    /**
     * 以用户的Id为key，WebSocket为对象保存起来
     */
    private static Map<String, WebSocket> clients = new ConcurrentHashMap();
    /**
     * 会话
     */
    private Session session;
    /**
     * 用户Id
     */
    private String userId;
    private static final String KEY = Dictionary.WEBSOCKET + ":" + "USERID" + ":";

    /**
     * OnOpen 表示有浏览器链接过来的时候被调用
     * OnClose 表示浏览器发出关闭请求的时候被调用
     * OnMessage 表示浏览器发消息的时候被调用
     * OnError 表示有错误发生，比如网络断开了等等
     */

    /**
     * 建立连接
     */
    @OnOpen
    public void onOpen(@PathParam("userId") String userId, Session session) {
        log.info("现在来连接的客户id：" + userId);
        this.session = session;
        this.userId = userId;
        //把自己的信息加入到map当中去
        clients.put(userId, this);
        //读取redis的离线用户数据发送
        getRedisMsgSend();
    }

    public void getRedisMsgSend() {
        new Thread(() -> {
            RedisUtil util = StaticMethodGetBean.getBean(RedisUtil.class);
            List<Object> data = util.lRange(KEY + userId, 0, -1);
            if (!CollectionUtils.isEmpty(data)) {
                for (Object msg : data) {
                    sendMessageTo(String.valueOf(msg), userId);
                    try {
                        Thread.sleep(500);
                    } catch (InterruptedException e) {
                        throw new RuntimeException(e);
                    }
                }
                util.remove(KEY + userId);
            }
        }).start();
    }

    @OnError
    public void onError(Throwable error) {
        log.info("服务端发生了错误" + error.getMessage());
    }

    /**
     * 连接关闭
     */
    @OnClose
    public void onClose() {
        clients.remove(userId);
        log.info(userId + "连接关闭!");
    }

    /**
     * 收到客户端的消息
     *
     * @param message 消息
     * @param session 会话
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        try {
            log.info("来自客户端消息：" + message + "客户端的id是：" + session.getId());
        } catch (Exception e) {
            log.info("发生了错误了");
        }
    }

    public void sendMessageTo(String message, String to) {
        Session session = null;
        for (WebSocket item : clients.values()) {
            if (item.userId.equals(to)) {
                session = item.session;
                break;
            }
        }
        if (session != null) {
            session.getAsyncRemote().sendText(message);
        } else {
            // 离线状态
            RedisUtil util = StaticMethodGetBean.getBean(RedisUtil.class);
            util.lPush(KEY + to, message);
        }
    }

}
