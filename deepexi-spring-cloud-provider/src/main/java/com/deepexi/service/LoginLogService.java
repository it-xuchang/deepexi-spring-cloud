package com.deepexi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.deepexi.domain.entity.LoginLog;

public interface LoginLogService extends IService<LoginLog> {

    void saveLoginLog(LoginLog loginLog);
}
