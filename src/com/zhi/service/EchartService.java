package com.zhi.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.zhi.dao.SQLHelper;

/**
 * Servlet implementation class EchartService
 */
@WebServlet("/EchartService")
public class EchartService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	public EchartService() {
        super();
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		System.out.println("OK");
		String sql="select teacher,count(*) from kcpj where department=? and profession=? and course=? and judge='好' group by teacher";
		String department=request.getParameter("department");
		String profession=request.getParameter("profession");
		String course=request.getParameter("course");
		
		String[] parameters= {department,profession,course};
		ArrayList<Object []> al=SQLHelper.query(sql, parameters);
		String teachers[]=new String[al.size()];
		int []goods=new int[al.size()];

		for(int i=0;i<al.size();i++) {
			Object []obj=al.get(i);
			teachers[i]=obj[0].toString();
			goods[i]=Integer.parseInt(obj[1].toString());
		}
		
		Map<String, Object> map = new HashMap<>();
		//map.put("salesVolume", salesVolume);
		map.put("teachers",teachers);
		map.put("goods", goods);
		//request.setAttribute("flag", map);
		response.getWriter().println(JSON.toJSONString(map));
		
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
