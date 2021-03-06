package tallerweb.sangucheto.controladores;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import tallerweb.sangucheto.modelo.Ingrediente;
import tallerweb.sangucheto.modelo.Stock;

@Controller
@RequestMapping("/stock")
public class StockController {

	private Stock stock = null;

	public StockController() {
		if (stock == null) {
			stock = Stock.getInstance();
		}
	}

	@RequestMapping(value = "/verStockIngredientes", method = RequestMethod.GET)
	public ModelAndView nuevoIngrediente() {
		ModelMap modelMap = new ModelMap();
		Map<Ingrediente, Integer> listaStockIngredientes = stock.obtenerStock();
		modelMap.put("listaStockIngredientes", listaStockIngredientes);
		return new ModelAndView("verStockIngredientes", modelMap);
	}

	@RequestMapping(value = "/agregarStockIngrediente", method = RequestMethod.POST)
	public ModelAndView agregarStockIngrediente(@RequestParam("nombre") String nombre) {

		Ingrediente ingrediente = stock.obtenerIngredientePorNombre(nombre);

		ModelMap modelMap = new ModelMap();
		modelMap.put("ingrediente", ingrediente);
		modelMap.put("stock", 0);

		return new ModelAndView("agregarStockIngrediente", modelMap);
	}

	@RequestMapping(value = "/guardarStockIngrediente", method = RequestMethod.POST)
	public ModelAndView guardarStockIngrediente(@RequestParam("nombre") String nombre,
			@RequestParam("cantidad") String cantidad) {

		Ingrediente ingrediente = stock.obtenerIngredientePorNombre(nombre);

		stock.agregarStock(ingrediente, new Integer(cantidad));

		return new ModelAndView("redirect:/stock/verStockIngredientes");
	}

	@RequestMapping(value = "/eliminarStockIngrediente", method = RequestMethod.POST)
	public ModelAndView eliminarIngrediente(@RequestParam("nombre") String nombre) {
		Ingrediente ingrediente = stock.obtenerIngredientePorNombre(nombre);
		stock.eliminaStockIngrediente(ingrediente);
		return new ModelAndView("redirect:/stock/verStockIngredientes");
	}
}
