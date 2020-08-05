package com.ruoyi.activiti.service;

import com.github.pagehelper.Page;
import com.ruoyi.activiti.domain.ProcessDefinition;

public interface IProcessDefinitionService {

    Page<ProcessDefinition> listProcessDefinition(com.ruoyi.activiti.domain.ProcessDefinition processDefinition);
    void deployProcessDefinition(String filePath);
    int deleteProcessDeploymentByIds(String deploymentIds);
    void suspendOrActiveApply(String id, String suspendState);

}
