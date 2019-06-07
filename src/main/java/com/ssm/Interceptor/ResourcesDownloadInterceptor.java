package com.ssm.Interceptor;

import com.ssm.tool.Shuru;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ResourcesDownloadInterceptor implements HandlerInterceptor{

         String prePath;
         String path;
        public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
            prePath = request.getServletPath();
            path=request.getServletContext().getContextPath();
            HttpSession session = request.getSession();
            session.setAttribute("preLink",prePath);
            if (session.getAttribute("userName") == null) {
                // 没有登录信息，则：重转发到登录页
                response.sendRedirect(path+"/login");
                // 执行拦截
                return false;
            } else {
                // 有登录信息，则：允许正常访问，直接放行
                return true;
            }
        }

        public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                ModelAndView modelAndView) throws Exception {

        }

        public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
            System.out.println("LoginInterceptor.afterCompletion()");
        }

}
