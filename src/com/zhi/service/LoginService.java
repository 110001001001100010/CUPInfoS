package com.zhi.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.zhi.dao.SQLHelper;

public class LoginService {

	public static int loginValidate(String user_id,String user_psword) {
		String sql="select * from accounts where stuno="+user_id+" and stupassword="+user_psword;
		ArrayList al=SQLHelper.query(sql, null);
		
		if(al.size()==0) {
			return -1;
		}
		return 1;
	}
}
