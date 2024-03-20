package com.playground.ecommerce21.util;

import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.datasource.init.ScriptUtils;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;

@Component
public class SQLRunner {

    @Autowired
    private DataSource dataSource;

    @PostConstruct
    public void runScript() {
        executeScript("data.sql");
    }

    private void executeScript(String fileName) {
        try {
            Resource resource = new ClassPathResource(fileName);
            ScriptUtils.executeSqlScript(dataSource.getConnection(), resource);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

