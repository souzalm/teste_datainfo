package br.com.datainfo3.security;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.I18nMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.datainfo3.business.UsuarioBO;
import br.com.datainfo3.controllers.UsuarioController;
import br.com.datainfo3.models.UsuarioModel;

@Controller
public class LoginController {

	@Inject
	private EntityManager entityManager;
	
//	@Inject
//	private Result result;
	
	@Inject
	private Validator validator;
	
//	@Inject
//	private AuxSession auxSession;
	
	public void formLogin() {
	}

	public void check(String login, String senha) throws Exception {
		UsuarioBO usuarioBO = new UsuarioBO();
		
		senha = usuarioBO.encryptPassword(senha);
		
		// Método para pesquisar email e senha.
		
		UsuarioModel usuario = usuarioBO.getUsuario(login, senha, entityManager);
		
		if (usuario == null || !usuario.getSenha().equals(senha)) {
			validator.add(new I18nMessage("login", "login.invalid"));
		}
		
		validator.onErrorForwardTo(LoginController.class).formLogin();
		
//		auxSession.setUsuario(usuario);

	}	
	
//	public void logout() {
//		auxSession.endSession();
//		result.forwardTo(LoginController.class).formLogin();
//	}
	
}