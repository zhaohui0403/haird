package com.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.io.IOException;

/**
 * Created by Administrator on 2019/4/23.
 */
//@Component
public class MyCommandRunner implements CommandLineRunner{
    Logger logger = LoggerFactory.getLogger(MyCommandRunner.class);

    private static String loginurl = "http://localhost:8080";

    private static String googleexcute = "E:\\搜狗浏览器\\SogouExplorer\\SogouExplorer.exe";

    @Override
    public void run(String... args) throws Exception {
        String cmd = googleexcute + " " + loginurl;
        Runtime runtime = Runtime.getRuntime();
        try {
            runtime.exec(cmd);
            logger.info("浏览器打开成功！");
        } catch (IOException e) {
            e.printStackTrace();
            logger.info(e.getMessage());
        }
    }
}
