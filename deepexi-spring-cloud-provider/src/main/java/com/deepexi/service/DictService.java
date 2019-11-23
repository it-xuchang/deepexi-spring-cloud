package com.deepexi.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.deepexi.domain.entity.Dict;
import com.deepexi.domain.vo.QueryRequest;


public interface DictService extends IService<Dict> {

    IPage<Dict> findDicts(QueryRequest request, Dict dict);

    void createDict(Dict dict);

    void updateDict(Dict dicdt);

    void deleteDicts(String[] dictIds);

}
