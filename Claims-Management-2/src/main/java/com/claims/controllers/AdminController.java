package com.claims.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.claims.models.Admin;
import com.claims.models.Member;
import com.claims.services.AdminUserService;
import com.claims.services.ClaimsService;
import com.claims.services.MemberService;

@Controller
public class AdminController {
	
	@Autowired AdminUserService userService;
	@Autowired HttpSession session;
	@Autowired MemberService memberService;
	@Autowired ClaimsService claimsService;

	@GetMapping("/")
	private String home() {
		return "index";
	}
	
	@PostMapping("/")
	public String Validate(String userid,String pwd,String role,RedirectAttributes redirAttrs) {
		if(role.equals("Admin")) {
			Admin user=userService.validate(userid, pwd);
			if(user==null) {
				redirAttrs.addFlashAttribute("error", "Invalid username or password..!!");
				return "redirect:/";
			}else {
				session.setAttribute("userid", user.getUserid());
				session.setAttribute("uname", user.getUname());
				session.setAttribute("role", role);
				return "redirect:/dashboard";
			}
		}
		else if(role.equals("User")) {
			Member user = memberService.validate(userid, pwd);
			if(user==null) {
				redirAttrs.addFlashAttribute("error", "Invalid username or password..!!");
				return "redirect:/";
			}else {
				session.setAttribute("userid", user.getMemberid());
				session.setAttribute("role", role);
				session.setAttribute("uname", user.getFname()+" "+user.getLname());
				return "redirect:/profile";
			}
		}
		return null;
		
	}
	
	@GetMapping("/dashboard")
	public String dashboard(Model model) {
		model.addAttribute("members", memberService.totalMembers());
		model.addAttribute("claims", claimsService.totalClaims());
		model.addAttribute("pendings", claimsService.totalPending());
		model.addAttribute("approved", claimsService.totalApproved());
		return "dashboard";
	}
	
	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}
}
