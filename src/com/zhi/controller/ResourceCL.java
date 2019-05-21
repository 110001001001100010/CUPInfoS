package com.zhi.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhi.service.ResourceService;

/**
 * Servlet implementation class ResourceCL
 */
@WebServlet(description = "for handle resource submit and query", urlPatterns = { "/ResourceCL" })
public class ResourceCL extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ResourceCL() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String type = request.getParameter("type");
		if ("add".equals(type)) {
			// add resource
			String department = "";
			String profession = "";
			String course = "";
			String teacher = "";
			String location = "";
			String lockey = "";
			String stuno = "";
			String stuname = "";
			String topic = "";
			String description = "";
			department = request.getParameter("department");
			profession = request.getParameter("profession");
			course = request.getParameter("course");
			teacher = request.getParameter("teacher");
			location = request.getParameter("location");
			lockey = request.getParameter("lockey");
			stuno = request.getParameter("stuno");
			stuname = request.getParameter("stuname");
			topic = request.getParameter("topic");
			description = request.getParameter("description");
			String[] parameters = { department, profession, course, teacher, topic, description, location, lockey,
					stuno, stuname };
			String sql = "insert into kczl values(?,?,?,?,?,?,?,?,?,?)";
			ResourceService.update(sql, parameters);
			request.getRequestDispatcher("iframe/right1.jsp").forward(request, response);
		} else if ("query".equals(type)) {
			// query resource
			String department = "";
			String profession = "";
			String course = "";
			String stuno = "";
			int pageNow = Integer.parseInt(request.getParameter("pageNow"));
			int pageSize = Integer.parseInt(request.getParameter("pageSize"));

			department = request.getParameter("department");
			profession = request.getParameter("profession");
			course = request.getParameter("course");
			stuno = request.getParameter("stuno");
			List<String> list = new ArrayList();
			String sql = "select * from kczl where 1=1 ";
			if (!"-----------------------------".equals(department)) {
				list.add(department);
				sql += " and department=? ";
			}
			if (!"-----------------------------".equals(profession)) {
				list.add(profession);
				sql += " and profession=? ";
			}
			if (!"-----------------------------".equals(course)) {
				list.add(course);
				sql += " and course=? ";
			}
			if (!"".equals(stuno)) {
				list.add(stuno);
				sql += " and stuno=? ";
			}
			String parameters[] = new String[list.size()];
			for (int i = 0; i < list.size(); i++) {
				parameters[i] = list.get(i);
			}
			sql += " limit " + ((pageNow - 1) * pageSize) + "," + pageSize;
			list = null;
			list = ResourceService.query(sql, parameters);
			request.setAttribute("rows", list);

			request.getRequestDispatcher("iframe/right1.jsp").forward(request, response);

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
