package com.zhi.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhi.service.EstimateService;

/**
 * Servlet implementation class EstimateCL
 */
@WebServlet("/EstimateCL")
public class EstimateCL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EstimateCL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String type=request.getParameter("type");
		if("add".equals(type)) {
			//add resource
			String department;
			String profession;
			String course;
			String teacher;
			String topic;
			String description;
			String stuno;
			String stuname;
			String all;
			department=request.getParameter("department");
			profession=request.getParameter("profession");
			course=request.getParameter("course");
			teacher=request.getParameter("teacher");
			topic=request.getParameter("topic");
			description=request.getParameter("description");
			stuno=request.getParameter("stuno");
			stuname=request.getParameter("stuname");
			all=request.getParameter("all");
			String []parameters= {department,
					profession,
					course,
					teacher,
					topic,
					description,
					stuno,
					stuname,
					all
				};
			String sql="insert into kcpj values(?,?,?,?,?,?,?,?,?)";
			EstimateService.update(sql, parameters);
			request.getRequestDispatcher("iframe/right3.jsp").forward(request, response);
		}else if("query".equals(type)) {
			//query resource
			String department="";
			String profession="";
			String course="";
			int pageNow=Integer.parseInt(request.getParameter("pageNow"));
			int pageSize=Integer.parseInt(request.getParameter("pageSize"));
			
			department=request.getParameter("department");
			profession=request.getParameter("profession");
			course=request.getParameter("course");
			List<String> list=new ArrayList();
			String sql="select * from kcpj where 1=1 ";
			if(!"-----------------------------".equals(department)) {
				list.add(department);
				sql+=" and department=? ";
			}
			if(!"-----------------------------".equals(profession)) {
				list.add(profession);
				sql+=" and profession=? ";
			}
			if(!"-----------------------------".equals(course)) {
				list.add(course);
				sql+=" and course=? ";
			}
			String parameters[]=new String[list.size()];
			for(int i=0;i<list.size();i++) {
				parameters[i]=list.get(i);
			}
			sql+= " limit "+((pageNow-1)*pageSize+1)+","+pageSize;
			list=null;
			list=EstimateService.query(sql,parameters);
			request.setAttribute("rows", list);
			request.getRequestDispatcher("iframe/right3.jsp").forward(request, response);	
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
