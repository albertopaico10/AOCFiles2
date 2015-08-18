package com.aoc.count.likes.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class UtilMethods {

	public String getValuesFromProperties(String value)throws IOException{
		String valueProperties="";
		Properties prop = new Properties();
		InputStream inputStream;
		try {
			inputStream = getClass().getClassLoader().getResourceAsStream(CommonConstants.Properties.PROPERTIES_VALUE_FILE);
			if (inputStream != null) {
				prop.load(inputStream);
			} else {
				throw new FileNotFoundException("property file '" + CommonConstants.Properties.PROPERTIES_VALUE_FILE + "' not found in the classpath");
			}
			valueProperties = prop.getProperty(value);
			System.out.println("Value from Prorties : "+valueProperties);
		} catch (Exception e) {
			System.out.println("Error in Controller : "+e.getMessage());
		}
		
		
		
		return valueProperties;
	}
	
}
