package com.deepexi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.deepexi.domain.entity.RoleMenu;

import java.util.List;

public interface RoleMenuServie extends IService<RoleMenu> {

    void deleteRoleMenusByRoleId(String[] roleIds);

    void deleteRoleMenusByMenuId(String[] menuIds);

    List<RoleMenu> getRoleMenusByRoleId(String roleId);
}
