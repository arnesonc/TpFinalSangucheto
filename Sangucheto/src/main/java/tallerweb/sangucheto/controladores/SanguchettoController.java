package tallerweb.sangucheto.controladores;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import tallerweb.sangucheto.modelo.Ingrediente;
import tallerweb.sangucheto.modelo.Sanguchetto;
import tallerweb.sangucheto.modelo.Stock;
import tallerweb.sangucheto.modelo.TipoIngrediente;

@Controller
@RequestMapping("/sanguchetto")
public class SanguchettoController {

	private Stock stock = null;
	private Sanguchetto sanguchetto = null;
	private Map<Ingrediente, Integer> ingredientesAgregados = new HashMap<Ingrediente, Integer>();
	private Map<Ingrediente, Integer> condimentosAgregados = new HashMap<Ingrediente, Integer>();

	public SanguchettoController() {
		if (stock == null) {
			stock = Stock.getInstance();
		}

		if (sanguchetto == null) {
			sanguchetto = Sanguchetto.getInstance();
		}
	}

	@RequestMapping(value = "/armarSanguchetto", method = RequestMethod.GET)
	public ModelAndView armarSanguchetto() {
		ModelMap modelMap = new ModelMap();
		modelMap.put("ingredientesAgregados", this.ingredientesAgregados);
		modelMap.put("condimentosAgregados", this.condimentosAgregados);		
		modelMap.put("total", String.format( "%.2f", sanguchetto.obtenerPrecio()));
		return new ModelAndView("armarSanguchetto", modelMap);
	}

	@RequestMapping(value = "/nuevoIngredienteSanguchetto", method = RequestMethod.POST)
	public ModelAndView nuevoIngredienteSanguchetto(@RequestParam("tipo") String tipo) {
		TipoIngrediente tipoIngrediente = tipo.equalsIgnoreCase(TipoIngrediente.INGREDIENTE.name())
				? TipoIngrediente.INGREDIENTE : TipoIngrediente.CONDIMENTO;

		Map<Ingrediente, Integer> ingredientesDisponibles = tipoIngrediente == TipoIngrediente.INGREDIENTE
				? stock.obtenerIngredientesTipoIngredienteDisponibles()
				: stock.obtenerIngredientesTipoCondimentoDisponibles();

		ModelMap modelMap = new ModelMap();
		modelMap.put("ingredientesDisponibles", ingredientesDisponibles);
		modelMap.put("tipoIngrediente", tipoIngrediente);
		return new ModelAndView("ingredientesDisponiblesSanguchetto", modelMap);
	}

	@RequestMapping(value = "/agregarCantidadIngrediente", method = RequestMethod.POST)
	public ModelAndView agregarCantidadIngrediente(@RequestParam("nombre") String nombre) {

		Ingrediente ingrediente = stock.obtenerIngredientePorNombre(nombre);
		ModelMap modelMap = new ModelMap();
		modelMap.put("ingrediente", ingrediente);
		modelMap.put("cantidad", 0);
		return new ModelAndView("agregarIngredienteSanguchetto", modelMap);
	}

	@RequestMapping(value = "/guardarIngredienteSanguchetto", method = RequestMethod.POST)
	public ModelAndView guardarIngredienteSanguchetto(@RequestParam("nombre") String nombre,
			@RequestParam("cantidad") String cantidad, @RequestParam("tipo") String tipo) throws Exception {

		Ingrediente ingrediente = stock.obtenerIngredientePorNombre(nombre);
		Integer stockIngrediente = stock.obtenerStockDisponible(ingrediente);
		ModelMap modelMap = new ModelMap();
		Integer cantidadIngrediente = new Integer(cantidad);
		Integer nuevaCantidad = 0;
		Integer contador = 0;
		TipoIngrediente tipoIngrediente = tipo.equalsIgnoreCase(TipoIngrediente.INGREDIENTE.name())
				? TipoIngrediente.INGREDIENTE : TipoIngrediente.CONDIMENTO;

		if (cantidadIngrediente > stockIngrediente) {
			String mensaje = "No hay stock suficiente del " + ingrediente.getTipo().name().toLowerCase() + "'"
					+ ingrediente.getNombre() + "' para agregar al Sanguchetto. El stock disponible es de: "
					+ stockIngrediente.toString()
					+ " unidades. Por favor indique una cantidad acorde al stock disponible del ingrediente.";
			modelMap.put("mensaje", mensaje);
			modelMap.put("mostrarVolver", true);
			return new ModelAndView("mensaje", modelMap);
		} else {

			if (tipoIngrediente == TipoIngrediente.INGREDIENTE) {
				if (this.ingredientesAgregados.containsKey(ingrediente)) {
					nuevaCantidad = this.ingredientesAgregados.get(ingrediente) + cantidadIngrediente;
					this.ingredientesAgregados.put(ingrediente, nuevaCantidad);
				} else {
					this.ingredientesAgregados.put(ingrediente, cantidadIngrediente);
				}
				
				contador = 0;
				while(contador < cantidadIngrediente){
					sanguchetto.agregarIngrediente(ingrediente);
					contador ++;
				}
			} else {
				if (this.condimentosAgregados.containsKey(ingrediente)) {
					nuevaCantidad = this.condimentosAgregados.get(ingrediente) + cantidadIngrediente;
					this.condimentosAgregados.put(ingrediente, nuevaCantidad);
				} else {
					this.condimentosAgregados.put(ingrediente, cantidadIngrediente);
				}
				
				contador = 0;
				while(contador < cantidadIngrediente){
					sanguchetto.agregarIngrediente(ingrediente);
					contador ++;
				}
			}

			// Descuenta el stock de ingrediente
			stock.comprarIngrediente(ingrediente, cantidadIngrediente);
			
			return new ModelAndView("redirect:/sanguchetto/armarSanguchetto");
		}
	}

	@RequestMapping(value = "/cancelarSanguchetto", method = RequestMethod.GET)
	public ModelAndView agregarCantidadIngrediente() throws Exception {
		
		devolverStock(ingredientesAgregados);
		devolverStock(condimentosAgregados);
		
		sanguchetto.vaciar();
		ingredientesAgregados.clear();
		condimentosAgregados.clear();
		return new ModelAndView("redirect:/sanguchetto/armarSanguchetto");
	}

	private void devolverStock(Map<Ingrediente, Integer> ingredientes) {
		
		for (Map.Entry<Ingrediente, Integer> entry : ingredientes.entrySet()) {
			
			stock.agregarStock(entry.getKey(), entry.getValue());
		}
	}
	
	@RequestMapping(value = "/comprarSanguchetto", method = RequestMethod.GET)
	public ModelAndView comprarSanguchetto() throws Exception {
		
		if(ingredientesAgregados.isEmpty() && condimentosAgregados.isEmpty()){
			String mensaje = "Debe agregar al menos un ingrediente o condimento a su Sanguchetto.";
			ModelMap modelMap = new ModelMap();
			modelMap.put("mensaje", mensaje);
			modelMap.put("mostrarVolver", false);
			return new ModelAndView("mensaje", modelMap);
		}else{
			return new ModelAndView("redirect:/sanguchetto/resumenSanguchetto");
		}		
	}
	
	@RequestMapping(value = "/resumenSanguchetto", method = RequestMethod.GET)
	public ModelAndView resumenSanguchetto() throws Exception {
		ModelMap modelMap = new ModelMap();
		
		if(ingredientesAgregados.isEmpty() && condimentosAgregados.isEmpty()){
			String mensaje = "Gracias por comprar en Sanguchetto. Para comprar otro sanguche, elija la opción 'Armar sanguche en el menú superior.'";
			modelMap.put("mensaje", mensaje);
			modelMap.put("mostrarVolver", false);
			return new ModelAndView("mensaje", modelMap);
		}else{
			modelMap.put("listaIngredientes", sanguchetto.verIngredientes());
			modelMap.put("listaCondimentos", sanguchetto.verCondimentos());
			modelMap.put("total", String.format("%.2f", sanguchetto.obtenerPrecio()));
			sanguchetto.vaciar();
			ingredientesAgregados.clear();
			condimentosAgregados.clear();
			return new ModelAndView("resumenSanguchetto", modelMap);
		}
	}
}
