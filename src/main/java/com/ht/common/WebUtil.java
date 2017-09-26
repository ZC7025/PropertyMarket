package com.ht.common;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by 7025 on 2017-8-22.
 */
public class WebUtil {

    public static String getReqMethod(HttpServletRequest req) {
        String uri = req.getRequestURI();
        return req.getRequestURI().substring(uri.lastIndexOf("/") + 1);
    }

    public static String getRootPath(HttpServletRequest request) {
        return request.getServletContext().getRealPath("/");
    }

}
