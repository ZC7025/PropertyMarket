package com.ht.common.util;

import com.ht.common.Constants;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by 7025 on 2017-8-22.
 */
public class DateUtil {

    public static Calendar stringToCalendar(String timeStr) {
        SimpleDateFormat sdf = new SimpleDateFormat(Constants.DEFAULT_DATE_PATTERN);
        try {
            Date beginTimeDate = sdf.parse(timeStr);
            Calendar cal = Calendar.getInstance();
            cal.setTime(beginTimeDate);
            return cal;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String dateToString(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat(Constants.DEFAULT_DATE_PATTERN);
        return sdf.format(date);
    }

    public static java.sql.Date convert(Date date) {
        return new java.sql.Date(date.getTime());
    }

}