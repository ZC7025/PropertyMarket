package com.ht.common.util;

/**
 * Created by 7025 on 2017-8-22.
 */
public class SingletonConfig extends Config {

    private static SingletonConfig config;

    private SingletonConfig() {

    }

    public static SingletonConfig getInstance() {
        synchronized (SingletonConfig.class) {
            if (config == null) {
                System.out.println("First time to get a SingletonConfig instance, and only once!");
                config = new SingletonConfig();
            }
        }
        return config;
    }

}
