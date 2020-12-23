package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/test.do") // localhost:8888/.../test.do
public class FirstServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet()에 의해서 실행된 코드입니다.");
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		// test.do?mid=hong&phone=010-1111-1111
		System.out.println(req.getParameter("mid"));
		System.out.println(req.getParameter("phone"));
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost()에 의해서 실행된 코드입니다.");
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");

		// <form method='post'/> 에서 받아오는 데이터..
		System.out.println(req.getParameter("name"));
		System.out.println(req.getParameter("address"));
	}
}
