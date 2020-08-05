package com.ruoyi.activiti.config;

import lombok.AllArgsConstructor;
import org.activiti.spring.SpringProcessEngineConfiguration;
import org.activiti.spring.boot.ProcessEngineConfigurationConfigurer;
import org.springframework.context.annotation.Configuration;

@Configuration
@AllArgsConstructor
public class ActivitiConfig implements ProcessEngineConfigurationConfigurer {

    private ICustomProcessDiagramGenerator customProcessDiagramGenerator;

    /**
     * 解決工作流生成图片乱码问题
     *
     * @param
     */
    @Override
    public void configure(SpringProcessEngineConfiguration processEngineConfiguration) {
        processEngineConfiguration.setActivityFontName("宋体");
        processEngineConfiguration.setAnnotationFontName("宋体");
        processEngineConfiguration.setLabelFontName("宋体");
        processEngineConfiguration.setProcessDiagramGenerator(customProcessDiagramGenerator);
    }
}
