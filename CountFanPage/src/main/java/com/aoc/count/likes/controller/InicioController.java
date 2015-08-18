package com.aoc.count.likes.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aoc.count.likes.util.CommonConstants;
import com.aoc.count.likes.util.UtilMethods;

@Controller
public class InicioController {

	@RequestMapping("inicio.htm")
    public String show(final HttpServletRequest request,final ModelMap model) {
		System.out.println("inside inicio htm in Repository");
		String fanPage = String.valueOf(request.getParameter("val"));
		System.out.println("Value from Web : "+fanPage);
		UtilMethods util=new UtilMethods();
		String valueProperties="";
		try {
			valueProperties=util.getValuesFromProperties(CommonConstants.Properties.PROPERTIES_VALUE_FREQUENCY);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("fanPageValues", fanPage);
		request.setAttribute("frequencySecond", valueProperties);
		return CommonConstants.Page.REDIRECT_COUNT_LIKES; 
	}
	
}
