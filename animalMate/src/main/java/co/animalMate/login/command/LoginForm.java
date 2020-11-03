package co.animalMate.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animalMate.common.Action;

public class LoginForm implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		return "jsp/main/loginForm.jsp";
	}

}
