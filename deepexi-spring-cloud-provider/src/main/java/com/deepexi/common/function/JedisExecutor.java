package com.deepexi.common.function;


import com.deepexi.common.exception.RedisConnectExceptions;

@FunctionalInterface
public interface JedisExecutor<T, R> {
    R excute(T t) throws RedisConnectExceptions;
}
