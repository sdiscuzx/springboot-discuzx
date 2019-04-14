package com.xstudio.utils;

import com.alibaba.fastjson.JSON;
import com.sun.deploy.net.HttpResponse;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import sun.net.www.http.HttpClient;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.UnknownHostException;
import java.util.Enumeration;
import java.util.List;

/**
 * http请求工具类
 * <p>
 *
 * @author xiaobiao on 2017/3/15.
 */
public class HttpClientUtil {

    /**
     * 默认content 类型
     */
    private static final String DEFAULT_CONTENT_TYPE = "application/json";
    /**
     * form
     */
    private static final String X_WWW_FORM_URLENCODED = "application/x-www-form-urlencoded";
    /**
     * 默认请求超时时间30s
     */
    private static final int DEFAUL_TTIME_OUT = 15000;

    private static final String LOCALHOST = "127.0.0.1";

    private static final String USER_AGENT = "User-Agent";
    /**
     * logger
     */
    private static Logger logger = LoggerFactory.getLogger(HttpClientUtil.class);

    private static HttpClient client = null;

    private HttpClientUtil() {
        throw new IllegalAccessError("HttpClientUtil");
    }

    /**
     * 是否是IE
     *
     * @param request {@link HttpServletRequest}
     * @return
     */
    public static boolean isIE(HttpServletRequest request) {
        return request.getHeader(USER_AGENT).contains("MSIE");
    }

    public static int getStatus(HttpServletResponse response) {
        return response.getStatus();
    }

    /**
     * 获取请求服务客户端的IP
     *
     * @param request {@link HttpServletRequest}
     * @return IP
     */
    public static String getIp(HttpServletRequest request) {
        String serverIp = "unknown";
        try {
            String ip = request.getHeader("X-Forwarded-For");
            if (StringUtils.isEmpty(ip) || serverIp.equalsIgnoreCase(ip)) {
                ip = request.getHeader("X-Real-IP");
            }
            if (StringUtils.isEmpty(ip) || serverIp.equalsIgnoreCase(ip)) {
                ip = request.getHeader("Proxy-Client-IP");
            }
            if (StringUtils.isEmpty(ip) || serverIp.equalsIgnoreCase(ip)) {
                ip = request.getHeader("WL-Proxy-Client-IP");
            }
            if (StringUtils.isEmpty(ip) || serverIp.equalsIgnoreCase(ip)) {
                ip = request.getRemoteAddr();
            }
            int index = ip.indexOf(',');
            if (index != -1) {
                ip = ip.substring(0, index);
            }
            serverIp = "0:0:0:0:0:0:0:1".equals(ip) ? LOCALHOST : ip;
        } catch (Exception e) {
            RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
            if (requestAttributes == null) {
                try {
                    Enumeration netInterfaces = NetworkInterface.getNetworkInterfaces();
                    InetAddress ip;
                    while (netInterfaces.hasMoreElements()) {
                        NetworkInterface ni = (NetworkInterface) netInterfaces.nextElement();
                        ip = ni.getInetAddresses().nextElement();
                        serverIp = ip.getHostAddress();
                        if (!ip.isSiteLocalAddress() && !ip.isLoopbackAddress()
                                && !ip.getHostAddress().contains(":")) {
                            serverIp = ip.getHostAddress();
                            break;
                        } else {
                            ip = null;
                        }
                    }
                } catch (Exception e1) {
                    logger.trace("InternetAddress has no more elements: {}", e1);
                }
            }
        }
        return serverIp;
    }

    /**
     * 获取服务器信息
     */
    public static String getServerInfo() {
        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        if (ra == null) {
            try {
                InetAddress inetAddress = InetAddress.getLocalHost();
                return inetAddress.getHostName();
            } catch (UnknownHostException e) {
                logger.trace("get server name failed: {}", e);
            }
            return "";
        }
        ServletRequestAttributes sra = (ServletRequestAttributes) ra;
        HttpServletRequest request = sra.getRequest();
        StringBuilder sb = new StringBuilder();
        sb.append("服务器名称：");
        sb.append(getServerName(request));
        sb.append(";");
        sb.append("服务器端口号：");
        sb.append(getServerPort(request));
        sb.append(";");
        sb.append("客户端IP：");
        String ip = getIp(request);
        sb.append(ip);
        sb.append("；");
        sb.append("host：");
        String host = request.getRemoteHost();
        sb.append(host);
        sb.append(";");
        sb.append("UserAgent：");
        sb.append(request.getHeader(USER_AGENT));
        return sb.toString();
    }

    /**
     * get User Agent
     *
     * @param request {@link HttpServletRequest}
     * @return user Agent
     */
    public static String getUserAgent(HttpServletRequest request) {
        String userAgent = "";
        try {
            userAgent = request.getHeader(USER_AGENT);
        } catch (Exception e) {
            logger.trace("header获取失败");
        }
        return userAgent;
    }

    /**
     * get server name
     *
     * @param request {@link HttpServletRequest}
     * @return
     */
    public static String getServerName(HttpServletRequest request) {

        String serverName = "";
        try {
            serverName = request.getHeader(USER_AGENT);
        } catch (Exception e) {
            RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
            if (requestAttributes == null) {
                try {
                    InetAddress inetAddress = InetAddress.getLocalHost();
                    serverName = inetAddress.getHostName();
                } catch (Exception e1) {
                    logger.trace("get server name failed: {}", e1);
                }
            }
        }
        return serverName;
    }

    /**
     * @param request {@link HttpServletRequest}
     * @return
     */
    public static Integer getServerPort(HttpServletRequest request) {
        Integer port = 0;
        try {
            port = request.getServerPort();
        } catch (Exception e) {
            logger.trace("", e);
        }
        return port;
    }

    /**
     * 获取请求的Body内容
     *
     * @param request {@link HttpServletRequest}
     * @return body
     * @throws IOException
     */
    public static String getBody(HttpServletRequest request) throws IOException {
        BufferedReader br = request.getReader();
        String str;
        StringBuilder sb = new StringBuilder();
        while ((str = br.readLine()) != null) {
            sb.append(str);
        }
        return sb.toString();
    }

    /**
     * json输出
     *
     * @param response {@link HttpServletResponse}
     * @param object   输出对象
     */
    public static void writeJson(HttpServletResponse response, Object object) {
        write(response, object, "application/json");
    }

    /**
     * 输出
     *
     * @param response {@link HttpServletResponse}
     * @param object   输出对象
     */
    public static void write(HttpServletResponse response, Object object, String contentType) {
        response.setCharacterEncoding("UTF-8");
        response.setContentType(contentType);
        PrintWriter out;
        try {
            out = response.getWriter();
            out.println(JSON.toJSONString(object));
        } catch (IOException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
