import java.util.List;

import br.vemprafam.dao.DaoFuncionario;
import br.vemprafam.pojo.Funcionario;

public class TesteDao {

	public static void main(String[] args) {
		DaoFuncionario dao = new DaoFuncionario();
		
		List<Funcionario> lista = dao.getLista();
		for( Funcionario funcionario: lista ) {
			System.out.println(funcionario);
		}
	}

}
