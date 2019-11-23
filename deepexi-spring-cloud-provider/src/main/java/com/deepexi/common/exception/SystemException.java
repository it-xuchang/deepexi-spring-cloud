package com.deepexi.common.exception;

/**
 * 系统内部异常
 */
public class SystemException extends Exception {

    private static final long serialVersionUID = -994962710559017255L;

    public SystemException(String message) {
        super(message);
    }
}
