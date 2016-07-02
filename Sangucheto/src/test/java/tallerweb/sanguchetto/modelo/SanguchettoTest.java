package tallerweb.sanguchetto.modelo;

import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import tallerweb.sangucheto.modelo.Ingrediente;
import tallerweb.sangucheto.modelo.Sanguchetto;
import tallerweb.sangucheto.modelo.TipoIngrediente;

public class SanguchettoTest {

	Sanguchetto sanguchetto = null;

	@Before
	public void init() {
		if (sanguchetto == null) {
			sanguchetto = Sanguchetto.getInstance();
		}
	}
	
	/**
	 * Construye un ingrediente para testear
	 * */
	private Ingrediente construirIngrediente(String nombre, TipoIngrediente tipoIngrediente, Double precio) {
		Ingrediente ingrediente = new Ingrediente();
		ingrediente.setNombre(nombre);
		ingrediente.setTipo(tipoIngrediente);
		ingrediente.setPrecio(precio);
		return ingrediente;
	}

	@Test
	public void testVaciar() throws Exception {
		Double precioFinalEsperado = 0d;
		sanguchetto.vaciar();
		Assert.assertEquals("El precio final obtenido no es el esperado.", precioFinalEsperado, sanguchetto.getPrecio());
	}

	@Test
	public void testAgregarIngrediente() throws Exception {
		sanguchetto.vaciar();
		Double precioFinalEsperado = 2d;
		sanguchetto.agregarIngrediente(construirIngrediente("Jamon", TipoIngrediente.INGREDIENTE, 2d));
		Double precioFinalObtenido = sanguchetto.getPrecio();
		Assert.assertEquals("El precio final esperado, no coincide con el obtenido", precioFinalEsperado, precioFinalObtenido);
	}

	@Test
	public void testVerIngredientes() throws Exception {
		Integer cantidadCondimentosEsperada = 2;
		sanguchetto.vaciar();
		sanguchetto.agregarIngrediente(construirIngrediente("Jamon", TipoIngrediente.INGREDIENTE, 2d));
		sanguchetto.agregarIngrediente(construirIngrediente("Queso", TipoIngrediente.INGREDIENTE, 2d));
		sanguchetto.agregarIngrediente(construirIngrediente("Mayonesa", TipoIngrediente.CONDIMENTO, 1.5d));
		sanguchetto.agregarIngrediente(construirIngrediente("Ketchup", TipoIngrediente.CONDIMENTO, 1.5d));
		sanguchetto.agregarIngrediente(construirIngrediente("Mostaza", TipoIngrediente.CONDIMENTO, 1.5d));
		
		List<Ingrediente> listaIngredientes = sanguchetto.verIngredientes();
		
		Assert.assertEquals("La cantidad de condimentos obtenida no coincide con la espedada.", cantidadCondimentosEsperada, (Integer)listaIngredientes.size());
		
		for(Ingrediente ingrediente : listaIngredientes){
			Assert.assertEquals("El tipo de ingrediente del ingrediente no es el correcto.", TipoIngrediente.INGREDIENTE, ingrediente.getTipo());
		}
	}

	@Test
	public void testVerCondimentos() throws Exception {
		Integer cantidadCondimentosEsperada = 3;
		sanguchetto.vaciar();
		sanguchetto.agregarIngrediente(construirIngrediente("Jamon", TipoIngrediente.INGREDIENTE, 2d));
		sanguchetto.agregarIngrediente(construirIngrediente("Queso", TipoIngrediente.INGREDIENTE, 2d));
		sanguchetto.agregarIngrediente(construirIngrediente("Mayonesa", TipoIngrediente.CONDIMENTO, 1.5d));
		sanguchetto.agregarIngrediente(construirIngrediente("Ketchup", TipoIngrediente.CONDIMENTO, 1.5d));
		sanguchetto.agregarIngrediente(construirIngrediente("Mostaza", TipoIngrediente.CONDIMENTO, 1.5d));
		
		List<Ingrediente> listaCondimentos = sanguchetto.verCondimentos();
		
		Assert.assertEquals("La cantidad de condimentos obtenida no coincide con la espedada.", cantidadCondimentosEsperada, (Integer)listaCondimentos.size());
		
		for(Ingrediente ingrediente : listaCondimentos){
			Assert.assertEquals("El tipo de ingrediente del ingrediente no es el correcto.", TipoIngrediente.CONDIMENTO, ingrediente.getTipo());
		}
	}

	@Test
	public void testGetPrecio() throws Exception {
		sanguchetto.vaciar();
		Double precioFinalEsperado = 7.5d;
		sanguchetto.agregarIngrediente(construirIngrediente("Jamon", TipoIngrediente.INGREDIENTE, 2d));
		sanguchetto.agregarIngrediente(construirIngrediente("Queso", TipoIngrediente.INGREDIENTE, 2d));
		sanguchetto.agregarIngrediente(construirIngrediente("Tomate", TipoIngrediente.INGREDIENTE, 2d));
		sanguchetto.agregarIngrediente(construirIngrediente("Lechuga", TipoIngrediente.INGREDIENTE, 1.5d));
		Double precioFinalObtenido = sanguchetto.getPrecio();
		Assert.assertEquals("El precio final esperado, no coincide con el obtenido", precioFinalEsperado, precioFinalObtenido);
	}
}
