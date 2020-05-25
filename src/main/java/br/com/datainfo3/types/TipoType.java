package br.com.datainfo3.types;

// Tipos de Telefone.

public enum TipoType {
	CELULAR(1), FIXO(2), COMERCIAL(3);
	
	private final int value;
	
	TipoType(int value) {
		this.value = value;
	}
	
	public int getValue( ) {
		return this.value;
	}
}
