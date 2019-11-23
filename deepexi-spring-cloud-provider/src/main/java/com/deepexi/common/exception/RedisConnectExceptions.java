package com.deepexi.common.exception;

/**
 * Redis 连接异常
 */
public class RedisConnectExceptions extends Exception {

    private static final long serialVersionUID = 1639374111871115063L;

    public RedisConnectExceptions(String message) {
        super(message);
    }
}
