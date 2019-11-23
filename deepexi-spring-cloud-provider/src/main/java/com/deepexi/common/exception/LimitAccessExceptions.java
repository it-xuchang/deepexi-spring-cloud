package com.deepexi.common.exception;

/**
 * 限流异常
 */
public class LimitAccessExceptions extends Exception {

    private static final long serialVersionUID = -3608667856397125671L;

    public LimitAccessExceptions(String message) {
        super(message);
    }
}
