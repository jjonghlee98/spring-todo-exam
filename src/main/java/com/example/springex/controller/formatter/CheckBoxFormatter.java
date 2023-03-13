package com.example.springex.controller.formatter;

import java.text.ParseException;
import java.util.Locale;

import org.springframework.format.Formatter;

public class CheckBoxFormatter implements Formatter<Boolean> {

	@Override
	public Boolean parse(String text, Locale locale) throws ParseException {
		// TODO Auto-generated method stub
		if (text == null) {
			return false;
		}
		return text.equals("on");
	}

	@Override
	public String print(Boolean object, Locale locale) {
		// TODO Auto-generated method stub
		return object.toString();
	}


}
