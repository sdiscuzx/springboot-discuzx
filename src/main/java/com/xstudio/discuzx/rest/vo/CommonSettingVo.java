package com.xstudio.discuzx.rest.vo;

import com.xstudio.discuzx.ultrax.model.CommonSetting;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author xiaobiao
 * @version 2019/10/15
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class CommonSettingVo extends CommonSetting {

    private static List<String> KEYS = Arrays.asList("inviteconfig");

    private Map<Object, Object> mapValue;

    public static Map<Object, Object> phpToJava(String str, String keyPrefix) {
        str = str.substring(5, str.length() - 1);
        str = str.replaceAll("[s|i]:\\d+:", "").replaceAll("N", "\"\"");

        String[] split = str.split(";");
        HashMap<Object, Object> list = new HashMap<Object, Object>();
        for (int i = 0; i < split.length; i = i + 2) {
            if (i % 2 == 0) {
                list.put(keyPrefix + "." + split[i].replaceAll("\"", ""), split[i + 1].replaceAll("\"", ""));
            }
        }

        return list;
    }

    @Override
    public void setSvalue(String svalue) {
        super.setSvalue(svalue);

        if (svalue.startsWith("a:8:")) {
            mapValue = phpToJava(svalue, getSkey());
        }
    }
}
