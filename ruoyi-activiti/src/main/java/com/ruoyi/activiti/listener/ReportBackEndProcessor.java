package com.ruoyi.activiti.listener;

import com.ruoyi.activiti.domain.BizLeaveVo;
import com.ruoyi.activiti.service.IBizLeaveService;
import lombok.AllArgsConstructor;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * <b>监听器使用范例</b>：销假后处理器
 * <p>
 * 设置销假时间
 * </p>
 * <p>
 * 使用Spring代理，可以注入Bean，管理事物
 * </p>
 *
 * @author HenryYan
 */
@Component
@AllArgsConstructor
public class ReportBackEndProcessor implements TaskListener {

    private static final long serialVersionUID = 1L;

    IBizLeaveService bizLeaveService;

    /*
     * (non-Javadoc)
     *
     * @see
     * org.activiti.engine.delegate.TaskListener#notify(org.activiti.engine.delegate
     * .DelegateTask)
     */
    @Transactional(rollbackFor = Exception.class)
    public void notify(DelegateTask delegateTask) {
        BizLeaveVo leave = bizLeaveService.selectBizLeaveById(new Long(delegateTask.getExecution().getProcessInstanceBusinessKey()));
        Object realityStartTime = delegateTask.getVariable("realityStartTime");
        leave.setRealityStartTime((Date) realityStartTime);
        Object realityEndTime = delegateTask.getVariable("realityEndTime");
        leave.setRealityEndTime((Date) realityEndTime);
        bizLeaveService.updateBizLeave(leave);
    }

}
