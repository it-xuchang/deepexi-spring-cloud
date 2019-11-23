package com.deepexi.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.deepexi.domain.entity.Role;

import java.util.List;

public interface RoleMapper extends BaseMapper<Role> {

	List<Role> findUserRole(String userName);

}
