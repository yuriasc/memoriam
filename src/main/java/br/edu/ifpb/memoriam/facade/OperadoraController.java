package br.edu.ifpb.memoriam.facade;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import br.edu.ifpb.memoriam.dao.OperadoraDAO;
import br.edu.ifpb.memoriam.dao.PersistenceUtil;
import br.edu.ifpb.memoriam.entity.Operadora;

public class OperadoraController {
	private Operadora operadora;
	private List<String> mensagensErro;

	public List<Operadora> consultar() {
		OperadoraDAO dao = new OperadoraDAO(PersistenceUtil.getCurrentEntityManager());
		List<Operadora> operadoras = dao.findAll();
		return operadoras;
	}

	public Resultado cadastrar(Map<String, String[]> parametros) {
		Resultado resultado = new Resultado();

		if (isParametrosValidos(parametros)) {
			OperadoraDAO dao = new OperadoraDAO(PersistenceUtil.getCurrentEntityManager());
			dao.beginTransaction();
			System.out.println("OP: " + operadora.getPrefixo());
			if (this.operadora.getId() == null) {
				dao.insert(this.operadora);
			} else {
				dao.update(this.operadora);
			}
			dao.commit();

			resultado.setErro(false);
			resultado.setMensagensErro(Collections.singletonList("operadora criado com sucesso"));
		} else {
			resultado.setEntidade(this.operadora);
			resultado.setErro(true);
			resultado.setMensagensErro(this.mensagensErro);
		}
		return resultado;
	}

	private boolean isParametrosValidos(Map<String, String[]> parametros) {		
		String[] id = parametros.get("id");
		String[] nome = parametros.get("nome");
		String[] prefixo = parametros.get("prefixo");

		this.operadora = new Operadora();
		this.mensagensErro = new ArrayList<String>();

		if (id != null && id.length > 0 && !id[0].isEmpty()) {
			operadora.setId(Integer.parseInt(id[0]));
		}

		if (prefixo == null || prefixo.length == 0 || prefixo[0].isEmpty()) {
			this.mensagensErro.add("Prefixo - campo obrigat�rio!");
		} else {
			operadora.setPrefixo(Integer.parseInt(prefixo[0]));
		}

		if (nome == null || nome.length == 0 || nome[0].isEmpty()) {
			this.mensagensErro.add("Nome - campo obrigat�rio!");
		} else {
			operadora.setNome(nome[0]);
		}

		return this.mensagensErro.isEmpty();
	}

	public Operadora buscar(int id) {
		OperadoraDAO dao = new OperadoraDAO(PersistenceUtil.getCurrentEntityManager());
		return dao.find(id);
	}

	public Resultado remove(Map<String, String[]> parametros) {
		Resultado resultado = new Resultado();
		OperadoraDAO dao = new OperadoraDAO(PersistenceUtil.getCurrentEntityManager());
		dao.beginTransaction();
		String[] selecionadosform = parametros.get("del_selected");
		try {
			for (String s : selecionadosform) {
				Operadora o = dao.find(Integer.parseInt(s));
				dao.delete(o);
			}
			resultado.setErro(false);
			resultado.setMensagensErro(Collections.singletonList("Operdadora(s) removidos com sucesso"));
		} catch (Exception exc) {
			resultado.setEntidade(this.operadora);
			resultado.setErro(true);
			resultado.setMensagensErro(this.mensagensErro);
		}
		dao.commit();

		return resultado;
	}
}
