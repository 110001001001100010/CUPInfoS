package com.zhi.dao;

/**
 * 实用 SqlHelper
 */

import java.io.InputStream;
import java.sql.*;
import java.util.*;


public class SQLHelper {

	private static String driver;
	private static String url;
	private static String username;
	private static String psword;
	private static Properties pp;
	private static InputStream is;
	
	private static Connection ct=null;
	private static PreparedStatement ps=null;
	private static ResultSet rs=null;
	static {
		
		try {
			pp=new Properties();
			is=SQLHelper.class.getClassLoader().
			getResourceAsStream("Properties.properties");
			pp.load(is);
			driver=pp.getProperty("driver");
			url=pp.getProperty("url");
			username=pp.getProperty("username");
			psword=pp.getProperty("psword");
			//System.out.println(driver);
			Class.forName(driver);
			
			//System.out.println("驱动加载成功");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection(){
		try {
			ct=DriverManager.getConnection(url,username,psword);
			//System.out.println("数据库连接成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ct;
	}
	
	
	//查询
	public static ArrayList query(String sql,String[] parameters) {
		//得到连接
		ct=getConnection();
		ArrayList al=al=new ArrayList();
		try {
			ps=ct.prepareStatement(sql);
			
			//参数注入
			if(parameters!=null) {
				for(int i=0;i<parameters.length;i++) {
					ps.setObject(i+1, parameters[i]);
				}
			}
			rs=ps.executeQuery();
			
			ResultSetMetaData rsmd =rs.getMetaData();
			int column=rsmd.getColumnCount();
			while(rs.next()) {
				
				Object[] o=new Object[column];
				for(int i=0;i<column;i++) {
					o[i]=rs.getObject(i+1);	
				}
				al.add(o);
			}
		
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//关闭资源
			close(rs,ps,ct);
		}
		return al;
		
	}
	
	
	
	//更新
	public static void update(String sql,String[] parameters) {
		//得到连接
		ct=getConnection();
				
		try {
			ps=ct.prepareStatement(sql);
					
			//参数注入
			if(parameters!=null) {
				for(int i=0;i<parameters.length;i++) {
					//System.out.println(parameters[i]);
					ps.setString(i+1, parameters[i]);
				}
			}
			ps.executeUpdate();
					
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}finally {
			//关闭资源
			close(rs,ps,ct);
		}
	}

	
	
	//关闭资源
	public static void close(ResultSet rs,PreparedStatement ps,Connection ct) {
		if(rs!=null) {
			try {
				rs.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(ps!=null) {
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(ct!=null) {
			try {
				ct.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
/*	public static void show() {
		System.out.println(driver+" "+url+" "+username);
	}
*/

	public static Connection getCt() {
		return ct;
	}


	public static PreparedStatement getPs() {
		return ps;
	}


	public static ResultSet getRs() {
		return rs;
	}


	public static void setCt(Connection ct) {
		SQLHelper.ct = ct;
	}


	public static void setPs(PreparedStatement ps) {
		SQLHelper.ps = ps;
	}


	public static void setRs(ResultSet rs) {
		SQLHelper.rs = rs;
	}
	
}
