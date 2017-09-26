package com.ht.common.util;

import java.math.BigDecimal;

/**
 * Created by 7025 on 2017-8-22.
 */
public class DecimalUtil {

    public static double centToYuan(int src) {
        BigDecimal decimal = new BigDecimal(src);
        return decimal.divide(new BigDecimal(100), 2, BigDecimal.ROUND_UP).doubleValue();
    }
}
