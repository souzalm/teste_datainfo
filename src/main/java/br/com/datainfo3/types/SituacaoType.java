package br.com.datainfo3.types;

// Situações de Usuário - Ativo, Inativo ou Bloqueado.

public enum SituacaoType {
	ATIVO(1), INATIVO(2), BLOQUEADO(3);
	
	private final int value;
	
	SituacaoType(int value) {
		this.value = value;
	}
	
	public int getValue( ) {
		return this.value;
	}
}
