package br.com.datainfo3.controllers;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.I18nMessage;
import br.com.caelum.vraptor.validator.Severity;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.datainfo3.business.UsuarioBO;
import br.com.datainfo3.models.UsuarioModel;
//import br.com.datainfo3.types.SituacaoType;
//import br.com.datainfo3.types.TipoType;

// Classe para realizar o CRUD.

@Controller
public class UsuarioController {

	@Inject
	private EntityManager entityManager;
	
	@Inject
	private Result result;
	
	@Inject
	private Validator validator;

	private UsuarioBO usuarioBO;
	
	public void edit(UsuarioModel usuario) {
		result.include("usuario", usuario);
	}
	
	public void clear() {
		result.forwardTo(this).edit(null);
	}
	
	public void list() {
		Query query = this.entityManager.createQuery("from UsuarioModel");
		List<UsuarioModel> usuarios = query.getResultList();
		result.include("usuarios", usuarios);
//		result.include("situacoes", SituacaoType.values());
//		result.include("tipos", TipoType.values());
	}
	
	public void save(UsuarioModel usuario) throws Exception {
//		validator.validate(usuario);
//		validator.onErrorForwardTo(this).edit(usuario);
//		
//		if(!validator.hasErrors()) {
//			if (usuario.getSenha().equals("")) {
//				if (!usuario.getSenha().equals(usuario.getConfirmacao())) {
//							validator.add(new 
//				}
//			}
//		}
		
		usuarioBO = new UsuarioBO();

		if (!usuarioBO.checkEmailUnico(usuario.getIdUsuario(), usuario.getEmail(), entityManager)) {
			validator.add(new I18nMessage("email", "email.nao.unico"));
		}
		
		validator.onErrorForwardTo(this).edit(usuario);
		
		usuarioBO = new UsuarioBO();
		
		String senha = usuarioBO.encryptPassword(usuario.getSenha());
		
		usuario.setSenha(senha);
		
		if (usuario.getIdUsuario() == 0) {
			create(usuario);
		} else {
			update(usuario);
		}
	}
	
	public void create(UsuarioModel usuario) {
		this.entityManager.persist(usuario);
		validator.add(new SimpleMessage("usuario", "success.create", Severity.SUCCESS));
		result.forwardTo(this).edit(null);
	}
	
	public void read(UsuarioModel usuario) {
		UsuarioModel usuarioBD = this.entityManager.find(UsuarioModel.class, usuario.getIdUsuario());
		result.forwardTo(this).edit(usuarioBD);		
	}
	
	public void update(UsuarioModel usuario) {
		this.entityManager.merge(usuario);
		validator.add(new SimpleMessage("usuario", "success.update", Severity.SUCCESS));
		result.forwardTo(this).edit(null);
	}
	
	public void delete(UsuarioModel usuario) {
		if (usuario.getIdUsuario() == 0) {
			validator.add(new I18nMessage("idUsuario", "not.blank"));
		}
		
		validator.onErrorForwardTo(this).edit(usuario);
		
		UsuarioModel usuarioBD = this.entityManager.find(UsuarioModel.class, usuario.getIdUsuario());
		this.entityManager.remove(usuarioBD);
		
		validator.add(new SimpleMessage("usuario", "success.delete", Severity.SUCCESS));
		result.forwardTo(this).edit(null);
	}
}
