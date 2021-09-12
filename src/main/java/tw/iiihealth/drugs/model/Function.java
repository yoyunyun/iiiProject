package tw.iiihealth.drugs.model;

import javax.servlet.http.HttpServletRequest;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Function {

    /**
     * 判断字符串是否为空
     *
     */
    public boolean StringIsNull(String str) {
        return (str == null || str.length() <= 0);
    }

    /**
     * 方法功能描述: 判断是否是IE浏览器
     *
     */
    public boolean isMSBrowser(HttpServletRequest request) {
        String[] IEBrowserSignals = {"MSIE", "Trident", "Edge"};
        String userAgent = request.getHeader("User-Agent");
        for (String signal : IEBrowserSignals) {
            if (userAgent.contains(signal)) {
                return true;
            }
        }
        return false;
    }


    /**
     * 获取浏览器请求的文件 中文编码
     *
     */
    public String getFileName(HttpServletRequest httpServletRequest, String filename) throws Exception {
        if (new Function().isMSBrowser(httpServletRequest)) {
            return URLEncoder.encode(filename, "UTF-8").replace("+", " ").toString();
        } else {
            return new String(filename.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1);
        }
    }


    /**
     * 获取当前时间
     *
     */
    public String getDateTime() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date(System.currentTimeMillis());
        return formatter.format(date);
    }

    public String sqlReplaceAll(String str) {
        str = str.replaceAll("[<>;,.'\"!()?]", "🤭").trim();
        return str;
    }
}