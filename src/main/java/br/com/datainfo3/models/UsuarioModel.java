package br.com.datainfo3.models;

import javax.persistence.Entity;
//import javax.persistence.EnumType;
//import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
//import javax.persistence.Transient;

//import org.hibernate.validator.constraints.NotBlank;
//import org.hibernate.validator.constraints.NotEmpty;

//import br.com.datainfo3.types.SituacaoType;
//import br.com.datainfo3.types.TipoType;

// Classe Usuário.

@Entity
@Table(name = "USUARIO")
public class UsuarioModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idUsuario;
//	@NotBlank
	private String nome;
//	@NotBlank
	private String email;

	private String senha;
	
//	@Transient
//	private String confirmacao;
	
	//	@NotEmpty
	private String ddd;

	//	@NotBlank
	private String numero;
	
//	@Enumerated(EnumType.ORDINAL)
	private String tipo;

//	@Enumerated(EnumType.ORDINAL)
//	private SituacaoType situacao;
	
	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getDdd() {
		return ddd;
	}

	public void setDdd(String ddd) {
		this.ddd = ddd;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
//	public SituacaoType getSituacao() {
//		return situacao;
//	}
//	public void setSituacao(SituacaoType situacao) {
//		this.situacao = situacao;
//	}
//	public String getConfirmacao() {
//		return confirmacao;
//	}
//	public void setConfirmacao(String confirmacao) {
//		this.confirmacao = confirmacao;
//	}
	
}
