package com.autumn.redis;

import org.redisson.api.RLock;
import org.redisson.api.RReadWriteLock;
import org.redisson.api.RedissonClient;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.UUID;

/**
 * Redisson 加锁
 */
@Component
public class RedissonUtil {

    @Resource
    private RedissonClient redissonClient;

    public String getKey() {
        return UUID.randomUUID().toString();
    }

    public String getKey(Class<?> tClass, Thread thread) {
        return tClass.toString() + "_" + thread.getStackTrace()[2].getMethodName();
    }

    public RLock getClint(String key) {
        RReadWriteLock lock = redissonClient.getReadWriteLock(key);
        return lock.writeLock();
    }

    public void lock(String key) {
        this.getClint(key).lock();
    }

    public void unLock(String key) {
        this.getClint(key).unlock();
    }

}
