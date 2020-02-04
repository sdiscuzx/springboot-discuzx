package com.xstudio.discuzx.rest;

import com.alibaba.fastjson.JSON;
import com.xstudio.discuzx.rest.vo.ForumVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.util.Assert;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

/**
 * @author xiaobiao
 * @version 2020/2/4
 */
@SpringBootTest
@RunWith(SpringRunner.class)
@AutoConfigureMockMvc
public class ForumRestControllerTest {
    @Autowired
    private MockMvc mockMvc;

    @Test
    public void forums() throws Exception {
        MvcResult mvcResult = mockMvc.perform(
                get("/api/action/forums"))
                .andReturn();

        Assert.notNull(mvcResult.getResponse().getContentAsString(),"无返回");
    }

    @Test
    public void forumsEdit() throws Exception {
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("fid", "1");
        params.add("name", "Discuz!!!");
        params.add("field.fid", "1");
        params.add("field.description", "1");
        MvcResult mvcResult = mockMvc.perform(
                post("/api/action/forums/edit")
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .params(params)
        )
                .andReturn();

        Assert.notNull(mvcResult.getResponse().getContentAsString(),"无返回");
    }
}