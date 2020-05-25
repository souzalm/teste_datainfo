package br.com.datainfo3.business;

import java.math.BigInteger;
import java.security.MessageDigest;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;

import br.com.datainfo3.models.UsuarioModel;

public class UsuarioBO {
	
	// Método destinado a realizar a criptografia de Senha. Usa o MD5.
	
	public String encryptPassword(String senha) throws Exception {
		MessageDigest messageDigest = MessageDigest.getInstance("MD5");
		BigInteger hash = new BigInteger(1, messageDigest.digest(senha.getBytes()));
		return hash.toString(16);
	}

	// Método para checar se o email é único no sistema.
	
	public boolean checkEmailUnico(int idUsuario, String email, EntityManager entityManager) {
		
		//Dessa forma evita-se SQL Injection.
		
		String query = "";
		
		query += " from ";
		query += "	UsuarioModel u	";
		query += " where ";
		query += "	u.email = :email ";
		query += "	and u.idUsuario <> :idUsuario ";
		
		UsuarioModel usuario = null;
		
		//Query para buscar o primeiro email encontrado e apenas um resultado simples.
		//Retorna true se o email for único.
		
		try {
			usuario = (UsuarioModel) entityManager
					.createQuery(query)
					.setParameter("email",email)
					.setParameter("idUsuario", idUsuario)
					.setFirstResult(0)
					.setMaxResults(1)
					.getSingleResult();
		} catch (NoResultException noResult) {
			return true;
		} catch (NonUniqueResultException noUnique) {
			return false;
		}
		
		if (usuario != null)
			return false;
			return true;
	}
	
	// Método utilizado para o login do usuário.
	
	public UsuarioModel getUsuario(String login, String senha, EntityManager entityManager) {
		
		//Dessa forma evita-se SQL Injection.
		
		String query = "";
		
		query += " from ";
		query += "	UsuarioModel u	";
		query += " where ";
		query += "	u.email = :email ";
		query += "	and u.senha = :senha ";
		
		UsuarioModel usuario = null;
		
		//Query para buscar o primeiro email encontrado e apenas um resultado simples.
		
		try {
			usuario = (UsuarioModel) entityManager
					.createQuery(query)
					.setParameter("email", login)
					.setParameter("senha", senha)
					.setFirstResult(0)
					.setMaxResults(1)
					.getSingleResult();
		} catch (NoResultException noResult) {
		
		} catch (NonUniqueResultException noUnique) {
			noUnique.printStackTrace();
		}
		
		return usuario;
	}
}
