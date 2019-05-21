package com.zhi.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.zhi.dao.SQLHelper;
import com.zhi.domain.Estimate;

public class EstimateService {

	public static void update(String sql,String[] parameters) {
		SQLHelper.update(sql, parameters);
	}
	
	public static ArrayList query(String sql,String []parameters) {
		ArrayList<Object []> al= SQLHelper.query(sql, parameters);
		Estimate r;
		ArrayList<Estimate> arrayList=new ArrayList();
		for(Object []str:al) {
			r=new Estimate();
			r.setDepartment(str[0].toString());
			r.setProfession(str[1].toString());
			r.setCourse(str[2].toString());
			r.setTeacher(str[3].toString());
			r.setTopic(str[4].toString());
			r.setDescription(str[5].toString());;
			r.setStuno(str[6].toString());
			r.setStuname(str[7].toString());
			r.setAll(str[8].toString());
			arrayList.add(r);
			r=null;
		}
		return arrayList;
	}
	
	//得到分页结果
	public static ArrayList getEstimatesByPage(int pageNow,int pageSize) {
		String sql="select * from kcpj limit "+((pageNow-1)*pageSize)+","+pageSize;
		ArrayList<Object []> al=SQLHelper.query(sql, null);
		Estimate r=null;
		ArrayList<Estimate> arrayList=new ArrayList();
		for(Object []str:al) {
			r=new Estimate();
			r.setDepartment(str[0].toString());
			r.setProfession(str[1].toString());
			r.setCourse(str[2].toString());
			r.setTeacher(str[3].toString());
			r.setTopic(str[4].toString());
			r.setDescription(str[5].toString());;
			r.setStuno(str[6].toString());
			r.setStuname(str[7].toString());
			r.setAll(str[8].toString());
			arrayList.add(r);
			r=null;
		}
		return arrayList;
	}
	
	public static int getPageCount(int pageSize) {
		String sql="select count(*) from kcpj";
		ArrayList<Object []> al=SQLHelper.query(sql, null);
		int rowNum=0;
		Object []obj=al.get(0);
		rowNum=Integer.parseInt(obj[0].toString());
		return rowNum%pageSize==0?rowNum/pageSize:rowNum/pageSize+1;
	}
}