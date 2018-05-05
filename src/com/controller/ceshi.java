package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ceshi {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Date dd=new Date();
		dd.setDate(dd.getDate()+1);
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(df.format(dd));
	}

}
