package com.zhi.service;

import java.util.ArrayList;
import java.util.Stack;

import com.zhi.dao.SQLHelper;
import com.zhi.domain.Message;


public class MessageService {
	
	public static ArrayList getMessagesByPage(int pageNow, int pageSize) {
		String sql = "select stuno,stuname,message from liuyan order by _id desc limit " + ((pageNow - 1) * pageSize ) + "," + pageSize;
		ArrayList<Object[]> al = SQLHelper.query(sql, null);
		Message r = null;
		ArrayList<Message> arrayList = new ArrayList();
		for (Object[] str : al) {
			r = new Message();
			r.setStuno(str[0].toString());
			r.setStuname(str[1].toString());
			r.setMessage(str[2].toString());
			arrayList.add(r);
			r = null;
		}
		return arrayList;
	}

	
	
	public static int getPageCount(int pageSize) {
		String sql = "select count(*) from liuyan";
		ArrayList<Object[]> al = SQLHelper.query(sql, null);
		int rowNum = 0;
		Object[] obj = al.get(0);
		rowNum = Integer.parseInt(obj[0].toString());
		return rowNum % pageSize == 0 ? rowNum / pageSize : rowNum / pageSize + 1;
	
	}

}
