package com.xstudio.discuzx;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DiscuzxApplicationTests {

    public static Map<Object, Object> phpToJava(String str) {
        str = str.substring(5, str.length() - 1);
        str = str.replaceAll("[s|i]:\\d+:", "").replaceAll("N", "\"\"");

        String[] split = str.split(";");
        HashMap<Object, Object> list = new HashMap<Object, Object>();
        for (int i = 0; i < split.length; i = i + 2) {
            if (i % 2 == 0) {
                list.put(split[i].replaceAll("\"", ""), split[i + 1].replaceAll("\"", ""));
            }
        }
        for (Map.Entry<Object, Object> map : list.entrySet()) {
            System.out.print(map.getKey() + "=");
            System.out.println(map.getValue());
        }
        return list;
    }

    @Test
    public void contextLoads() {
        Map<Object, Object> objectObjectMap = phpToJava("a:9:{s:16:\"invitecodeprompt\";s:12:\"谢谢谢谢\";s:13:\"buyinvitecode\";s:1:\"0\";s:15:\"invitecodeprice\";s:0:\"\";s:18:\"inviterewardcredit\";s:1:\"1\";s:15:\"inviteaddcredit\";s:0:\"\";s:16:\"invitedaddcredit\";s:0:\"\";s:13:\"invitegroupid\";s:1:\"0\";s:15:\"inviteareawhite\";s:0:\"\";s:13:\"inviteipwhite\";s:0:\"\";}");
        objectObjectMap.entrySet();
    }
}
