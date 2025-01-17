package com.jspider.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.jspider.springmvc.pojo.AdminPojo;
import com.jspider.springmvc.pojo.StudentPojo;
import com.jspider.springmvc.service.StudentService;

@Controller
public class StudentControler {

	@Autowired
	StudentService service;

	@GetMapping("/home")
	public String getHome(@SessionAttribute(name = "login", required = false) AdminPojo login, ModelMap map) {
		if (login == null) {
			map.addAttribute("msg", "Please Login First..!!");
			return "StudentLogin";
		}
		return "Home";
	}

	@GetMapping("/add")
	public String getAdd(@SessionAttribute(name = "login", required = false) AdminPojo login, ModelMap map) {
		if (login == null) {
			map.addAttribute("msg", "Please Login First..!!");
			return "StudentLogin";
		}
		return "StudentRegistration";
	}

	@PostMapping("/add")
	public String getAddStudent(@SessionAttribute(name = "login", required = false) AdminPojo login,
			@RequestParam String name, @RequestParam String email, @RequestParam long mobile, @RequestParam String city,
			@RequestParam String username, @RequestParam String password, ModelMap map) {
		if (login == null) {
			map.addAttribute("msg", "Please Login First..!!");
			return "StudentLogin";
		}
		StudentPojo student = service.addStudent(name, email, mobile, city, username, password);
		if (student != null) {
			map.addAttribute("student", student);
		} else {
			map.addAttribute("msg", "Data not added in Database!");
		}
		return "StudentRegistration";
	}

	@GetMapping("/search")
	public String getSearch(@SessionAttribute(name = "login", required = false) AdminPojo login, ModelMap map) {
		if (login == null) {
			map.addAttribute("msg", "Please Login First..!!");
			return "StudentLogin";
		}
		return "Search";
	}

	@PostMapping("/search")
	public String searchData(@SessionAttribute(name = "login", required = false) AdminPojo login, @RequestParam int id,
			ModelMap map) {
		if (login == null) {
			map.addAttribute("msg", "Please Login First..!!");
			return "StudentLogin";
		}
		StudentPojo student = service.search(id);
		if (student != null) {
			map.addAttribute("student", student);
		} else {
			map.addAttribute("msg", "Data not found..!!");
		}
		return "Search";
	}

	@GetMapping("/view")
	public String viewRecords(@SessionAttribute(name = "login", required = false) AdminPojo login, ModelMap map) {
		if (login == null) {
			map.addAttribute("msg", "Please Login First..!!");
			return "StudentLogin";
		}
		List<StudentPojo> student = service.searchAll();
		if (student != null) {
			map.addAttribute("students", student);
		} else {
			map.addAttribute("msg", "Data Not Found!");
		}

		return "ViewRecords";
	}

	@GetMapping("/remove")
	public String getRemove(@SessionAttribute(name = "login", required = false) AdminPojo login, ModelMap map) {
		if (login == null) {
			map.addAttribute("msg", "Please Login First..!!");
			return "StudentLogin";
		}
		List<StudentPojo> student = service.searchAll();
		if (student != null) {
			map.addAttribute("students", student);
		} else {
			map.addAttribute("msg", "Data Not Found!");
		}

		return "Remove";
	}

	@PostMapping("/remove")
	public String removeStudent(@SessionAttribute(name = "login", required = false) AdminPojo login,
			@RequestParam int id, ModelMap map) {
		if (login == null) {
			map.addAttribute("msg", "Please Login First..!!");
			return "StudentLogin";
		}
		StudentPojo student = service.removeStudent(id);
		if (student != null) {
			map.addAttribute("msg", "Data Removed Successfully.");
		} else {
			map.addAttribute("msg", "Data Not Found!");
		}

		List<StudentPojo> students = service.searchAll();
		map.addAttribute("students", students);
		return "Remove";

	}

	@GetMapping("/update")
	public String getUpdate(@SessionAttribute(name = "login", required = false) AdminPojo login, ModelMap map) {
		if (login == null) {
			map.addAttribute("msg", "Please Login First..!!");
			return "StudentLogin";
		}
		List<StudentPojo> students = service.searchAll();
		map.addAttribute("students", students);
		return "Update";
	}

	@PostMapping("/update")
	public String updateStudent(@SessionAttribute(name = "login", required = false) AdminPojo login,
			@RequestParam int id, ModelMap map) {
		if (login == null) {
			map.addAttribute("msg", "Please Login First..!!");
			return "StudentLogin";
		}
		StudentPojo student = service.search(id);

		if (student != null) {
			map.addAttribute("student", student);

			return "UpdateDetails";
		} else {
			List<StudentPojo> students = service.searchAll();
			map.addAttribute("students", students);
			map.addAttribute("msg", "Data not found..!!");
			return "Update";
		}

	}

	@PostMapping("/updatedetails")
	public String getUpdateDetails(@SessionAttribute(name = "login", required = false) AdminPojo login,
			@RequestParam int id, @RequestParam String name, @RequestParam String email, @RequestParam long mobile,
			@RequestParam String city, @RequestParam String username, @RequestParam String password, ModelMap map) {
		if (login == null) {
			map.addAttribute("msg", "Please Login First..!!");
			return "StudentLogin";
		}
		StudentPojo student = service.search(id);
		if (student != null) {
			service.updateDeatails(id, name, email, mobile, city, username, password);

			map.addAttribute("msg", name + " Data Successfully Updated");
			List<StudentPojo> students = service.searchAll();
			map.addAttribute("students", students);

		}
		return "Update";
	}

	@GetMapping("/login")
	public String geLogin() {
		return "StudentLogin";
	}

//	@PostMapping("/login")
//	public String login(HttpServletRequest request,@RequestParam String username, @RequestParam String password, ModelMap map) {
//		StudentPojo student = service.login(username, password);
//		if (student != null) {
//			HttpSession session = request.getSession();
//			session.setAttribute("login", student);
//			session.setMaxInactiveInterval(60);
//			return "Home";
//		}
//		map.addAttribute("msg", "Inavlid username or password..!!");
//		return "StudentLogin";
//	}

//*************************************************************************

	@GetMapping("/adminhome")
	public String adminHome() {
		return "AdminHome";
	}

	@GetMapping("/adminlogin")
	public String geAdminLogin() {
		return "AdminLogin";
	}

	@PostMapping("/adminlogin")
	public String Adminlogin(HttpServletRequest request, @RequestParam String username, @RequestParam String password,
			ModelMap map) {
		AdminPojo admin = service.adminLogin(username, password);
		if (admin != null) {
			HttpSession session = request.getSession();
			session.setAttribute("login", admin);
//			session.setMaxInactiveInterval(60);
			return "Home";
		}
		map.addAttribute("msg", "Inavlid username or password..!!");
		return "AdminLogin";
	}

	@GetMapping("/logout")
	public String geLogout(HttpSession session, ModelMap map) {
		session.invalidate();
		map.addAttribute("msg", "Successfully Logout...!");

		return "AdminLogin";
	}

	// Add Admin

	@PostMapping("/addadmin")
	public String addAdmin(@RequestParam String name, @RequestParam String username, @RequestParam String password,
			ModelMap map) {

		AdminPojo admin = service.addAdmin(name, username, password);
		if (admin != null) {
			map.addAttribute("admin", admin);
		} else {
			map.addAttribute("msg", "Data not added in Database!");
		}
		return "AdminRegistration";
	}

	@GetMapping("/addadmin")
	public String getAdd() {

		return "AdminRegistration";
	}

	// ********************************

	@GetMapping("/hello")
	public String getVishal() {
		
		return "VishalForm";
	}
	
	@PostMapping("/vishal")
	public String getAddStudent( @RequestParam String msg, ModelMap map) {
		
		map.addAttribute("msg", msg);		
		return "VishalDetails";
	}

}
