package com.cognizant.truyum.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
    public Date convertToDate(String date) {
        try {
            SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
            format.setLenient(false);
            return format.parse(date); // String to Date
        } catch (ParseException e) {
            System.out.println("Date/Format Went Wrong");
        }
        return null; // will not be executed/never executed
    }
}
