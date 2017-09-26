package com.ht.controller;

import com.ht.common.util.CreateImageCode;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by 7025 on 2017-08-11.
 * 生成随机验证图片
 */
public class CheckCodeController extends ActionSupport implements ServletResponseAware,ServletRequestAware {

    private HttpServletResponse response;
    private HttpServletRequest request;

    public String code() throws IOException {
        HttpSession session = request.getSession();
        response.setContentType("image/jpeg");
        //禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        CreateImageCode vCode = new CreateImageCode(100,30,5,10);
        if(vCode!=null){
            session.setAttribute("code", vCode.getCode());
            vCode.write(response.getOutputStream());
            return null;
        }
        return "code";
    }


    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        this.response = httpServletResponse;
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }

}
