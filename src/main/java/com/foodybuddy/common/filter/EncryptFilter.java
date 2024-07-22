package com.foodybuddy.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
// 회원가입 시 / 로그인 시 / 회원정보 변경 시에 암호화 진행하는 필터!
@WebFilter(servletNames= {"userCreateEnd","userLoginEnd","userEditEnd"})
public class EncryptFilter extends HttpFilter implements Filter {

    public EncryptFilter() {
        super();
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		PasswordEncodingWrapper pew = new PasswordEncodingWrapper((HttpServletRequest)request);
		chain.doFilter(pew, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
