package com.ht.common.util;

import java.io.*;
import java.util.Properties;

/**
 * Created by 7025 on 2017-8-22.
 */
public class Config {

    public Properties properties;

    public Config() {

    }

    public void build(String location) {
        properties = new Properties();
        try {
            properties.load(new BufferedReader(
                    new InputStreamReader(
                            new BufferedInputStream(
                                    new FileInputStream(PathUtil.getResourcePath(location))))));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public int getInt(String key) {
        return Integer.valueOf(properties.getProperty(key));
    }

    public String getString(String key) {
        return properties.getProperty(key);
    }

    public double getDouble(String key) {
        return Double.valueOf(properties.getProperty(key));
    }

    public long getLong(String key) {
        return Long.valueOf(properties.getProperty(key));
    }

}
