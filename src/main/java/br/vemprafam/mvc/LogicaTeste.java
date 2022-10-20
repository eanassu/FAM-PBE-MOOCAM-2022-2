package br.vemprafam.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogicaTeste implements Logica {

	@Override
	public String executar(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("executando lógica");
		return "testeLogica.jsp";
	}

}
