package com.xstudio.discuzx.service.impl;

import com.xstudio.common.service.BaseServiceImpl;
import com.xstudio.common.service.IBaseDao;
import com.xstudio.discuzx.mapper.CommonCreditRuleLogMapper;
import com.xstudio.discuzx.model.CommonCreditRuleLog;
import com.xstudio.discuzx.service.IPreCommonCreditRuleLogService;
import com.xstudio.utils.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service implements for table pre_common_credit_rule_log
 * 
 * @author mybatis generator
 * @version Sat Apr 13 17:11:40 CST 2019
 */
@Service
public class PreCommonCreditRuleLogServiceImpl extends BaseServiceImpl<CommonCreditRuleLog> implements IPreCommonCreditRuleLogService {
    @Autowired
    private CommonCreditRuleLogMapper commonCreditRuleLogMapper;

    @Override
    public IBaseDao<CommonCreditRuleLog> getRepositoryDao() {
        return this.commonCreditRuleLogMapper;
    }

    @Override
    public void setDefaults(CommonCreditRuleLog record) {
        if(record.getClid() == null ) {
            record.setClid(IdWorker.getId());
        }
    }
}