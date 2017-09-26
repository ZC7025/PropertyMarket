package com.ht.filter;

import com.ht.common.Constants;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * Created by 7025 on 2017-08-24.
 */
@WebFilter(filterName = "EncodingFilter", urlPatterns = "/*")
public class EncodingFilter implements Filter {
    public void destroy() {
        System.out.println("encoding filter destroy...");
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws ServletException, IOException {
        req.setCharacterEncoding(Constants.DEFAULT_ENCODING);
        resp.setCharacterEncoding(Constants.DEFAULT_ENCODING);
        resp.setContentType(Constants.DEFAULT_CONTENT_TYPE);
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {
        System.out.println("init encoding filter...");
    }

}
