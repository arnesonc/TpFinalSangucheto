package tallerweb.sangucheto.modelo;

import java.util.LinkedList;
import java.util.List;

public class Sanguchetto {

	private static Sanguchetto instance = new Sanguchetto();
	private List<Ingrediente> ingredientes = new LinkedList<Ingrediente>();

	private Sanguchetto() {
	}

	public static Sanguchetto getInstance() {
		return instance;
	}

	/**
	 * Elimina todos los ingredientes del sanguchetto.<br>
	 * 
	 * @throws Exception
	 */
	public void vaciar() throws Exception {
		ingredientes.clear();
	}

	/**
	 * Agrega un ingrediente al carrito.<br>
	 * 
	 * @param ingrediente
	 * @throws Exception
	 */
	public void agregarIngrediente(Ingrediente ingrediente) throws Exception {

		boolean agregado = ingredientes.add(ingrediente);

		if (!agregado) {
			throw new Exception("No se pudo agregar el ingrediente.");
		}
	}

	/**
	 * Lista todos los ingredientes que forman parte del sanguchetto.<br>
	 * 
	 * @return
	 */
	public List<Ingrediente> verIngredientes() {

		List<Ingrediente> listaIngredientes = new LinkedList<Ingrediente>();

		for (Ingrediente ingrediente : ingredientes) {
			if (ingrediente.getTipo() == TipoIngrediente.INGREDIENTE) {
				listaIngredientes.add(ingrediente);
			}
		}

		return listaIngredientes;
	}

	/**
	 * Lista todos los condimentos que forman parte del sanguchetto.<br>
	 * 
	 * @return
	 */
	public List<Ingrediente> verCondimentos() {

		List<Ingrediente> listaCondimentos = new LinkedList<Ingrediente>();

		for (Ingrediente ingrediente : ingredientes) {

			if (ingrediente.getTipo() == TipoIngrediente.CONDIMENTO) {
				listaCondimentos.add(ingrediente);
			}
		}

		return listaCondimentos;
	}

	/**
	 * Devuelve el precio total del sanguchetto.<br>
	 * 
	 * @return
	 */
	public Double obtenerPrecio() {
		Double precioTotal = 0d;

		for (Ingrediente ingrediente : ingredientes) {
			precioTotal += ingrediente.getPrecio();
		}

		return precioTotal;
	}
}
