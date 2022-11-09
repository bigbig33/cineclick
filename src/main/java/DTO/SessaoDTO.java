package DTO;

public class SessaoDTO {
	private int idSessao;
	private String nomeFilme;
	private String dataFilme;
	private String horaFilme;
	private String tipoIngresso;
	private int quantidade;
	private double preco;
	private String tipoPagamento;
	private int idCliente;
	
	public int getIdSessao() {
		return idSessao;
	}
	public void setIdSessao(int idSessao) {
		this.idSessao = idSessao;
	}
	public String getNomeFilme() {
		return nomeFilme;
	}
	public void setNomeFilme(String nomeFilme) {
		this.nomeFilme = nomeFilme;
	}
	public String getDataFilme() {
		return dataFilme;
	}
	public void setDataFilme(String dataFilme) {
		this.dataFilme = dataFilme;
	}
	public String getHoraFilme() {
		return horaFilme;
	}
	public void setHoraFilme(String horaFilme) {
		this.horaFilme = horaFilme;
	}
	public String getTipoIngresso() {
		return tipoIngresso;
	}
	public void setTipoIngresso(String tipoIngresso) {
		this.tipoIngresso = tipoIngresso;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	public double getPreco() {
		return preco;
	}
	public void setPreco(double preco) {
		this.preco = preco;
	}
	public String getTipoPagamento() {
		return tipoPagamento;
	}
	public void setTipoPagamento(String tipoPagamento) {
		this.tipoPagamento = tipoPagamento;
	}
	public int getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}
}
