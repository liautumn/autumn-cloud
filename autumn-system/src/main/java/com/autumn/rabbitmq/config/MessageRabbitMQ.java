package com.autumn.rabbitmq.config;

import com.autumn.saToken.LoginInfoData;
import com.rabbitmq.client.Channel;
import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Exchange;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.rabbit.connection.Connection;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitAdmin;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

//@Configuration
@Component
public class MessageRabbitMQ {

//    //声明direct交换机
//    @Bean
//    public DirectExchange directExchange() { // name:交换机名称   durable:是否持久化  autoDelete:是否自动清除
//        return new DirectExchange("direct_message_exchange", true, false);
//    }
//
//    //direct声明队列
//    @Bean
//    public Queue messageQueueDirect() {
//        return new Queue("message.direct.queue", true);
//    }
//
//    @Bean
//    public Binding messageBindingDirect() {
//        return BindingBuilder.bind(messageQueueDirect()).to(directExchange()).with("sysMsg");
//    }

    /**
     * 获取工厂配置类
     */
    @Resource
    private ConnectionFactory connectionFactory;

    public void createMQ() {
        String userId = LoginInfoData.getUserInfo().getId();
        RabbitAdmin rabbitAdmin = new RabbitAdmin(connectionFactory);
        String queueName = "message.direct.queue." + userId;
        String exchangeName = "direct_message_exchange";
        //创建交换机
        Exchange exchange = new DirectExchange(exchangeName, true, false);
        rabbitAdmin.declareExchange(exchange);
        //新增队列
        rabbitAdmin.declareQueue(new Queue(queueName, true));
        //新增绑定关系
        rabbitAdmin.declareBinding(new Binding(queueName, Binding.DestinationType.QUEUE, exchangeName, userId, null));
        //关闭连接
        close();
    }

    /**
     * 关闭连接
     */
    public void close() {
        try (Connection connection = connectionFactory.createConnection()) {
            try (Channel channel = connection.createChannel(true)) {
                com.rabbitmq.client.Connection connection1 = channel.getConnection();
                connection1.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
