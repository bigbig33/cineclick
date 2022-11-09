package DTO;

import java.util.ArrayList;

public class ClienteDTO {
	private int idCliente;
	private String nome;
	private String sobrenome;
	private String email;
	private String senha;
	private String cpf;
	private String telefone;
	private boolean confirmaEmail;
	
	public boolean getConfirmaEmail() {
		return confirmaEmail;
	}
	public void setConfirmaEmail(boolean confirmaEmail) {
		this.confirmaEmail = confirmaEmail;
	}
	private ArrayList<SessaoDTO> sessaoDTO;
	
	public ArrayList<SessaoDTO> getSessaoDTO() {
		return sessaoDTO;
	}
	public void setSessaoDTO(ArrayList<SessaoDTO> sessaoDTO) {
		this.sessaoDTO = sessaoDTO;
	}
	public int getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getSobrenome() {
		return sobrenome;
	}
	public void setSobrenome(String sobrenome) {
		this.sobrenome = sobrenome;
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
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
	
	
}
