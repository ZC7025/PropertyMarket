package com.ht.common;

/**
 * Created by 7025 on 2017-8-22.
 */
public final class Constants {

    public static final String ISO_ENCODING = "ISO8859-1";
    public static final String DEFAULT_ENCODING = "UTF-8";
    public static final String DEFAULT_CONTENT_TYPE = "text/html;charset=UTF-8";

    /**
     * 默认时间格式 yyyy-MM-dd HH:mm:ss
     */
    public static final String DEFAULT_DATE_PATTERN = "yyyy-MM-dd HH:mm:ss";

    /**
     * 分页常量 默认为5
     */
    public static final int PAGESIZE = 5;

    /**
     * 文件上传文件夹
     */
    public static final String UPLOADS = "uploads";

    /**
     * 激活
     */
    public static final int ACTIVATION = 1;

    /**
     * 冻结
     */
    public static final int FREEZE = 0;

    /**
     * 房屋销售状态：销售中
     */
    public static final int SELL = 1;

    /**
     * 房屋销售状态：保留
     */
    public static final int KEEP = 0;

    /**
     * 房屋销售状态：已售
     */
    public static final int SOLD = 3;

    /**
     * 房屋销售状态：预订
     */
    public static final int BOOKING = 2;
}
