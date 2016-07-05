package tallerweb.sangucheto.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import tallerweb.sangucheto.modelo.Ingrediente;
import tallerweb.sangucheto.modelo.Stock;
import tallerweb.sangucheto.modelo.TipoIngrediente;

@Controller
@RequestMapping("/ingredientes")
public class IngredienteController {

	private Stock stock = null;

	public IngredienteController() {
		if (stock == null) {
			stock = Stock.getInstance();
		}
	}

	@RequestMapping(value = "/nuevoIngrediente", method = RequestMethod.GET)
	public ModelAndView nuevoIngrediente() {
		ModelMap modelMap = new ModelMap();
		Ingrediente ingrediente = new Ingrediente();
		modelMap.put("ingrediente", ingrediente);
		return new ModelAndView("nuevoIngrediente", modelMap);
	}

	@RequestMapping(value = "/guardarIngrediente", method = RequestMethod.POST)
	public ModelAndView guardarPersona(@RequestParam("nombre") String nombre, @RequestParam("precio") String precio,
			@RequestParam("tipo") String tipo) {

		Ingrediente ingrediente = new Ingrediente();
		ingrediente.setNombre(nombre);
		ingrediente.setPrecio(new Double(precio));
		ingrediente.setTipo(tipo.equals(TipoIngrediente.INGREDIENTE.name()) ? TipoIngrediente.INGREDIENTE
				: TipoIngrediente.CONDIMENTO);
		
		String mensaje = "";
		
		boolean existe = stock.existeIngrediente(ingrediente); 
		
		if(!existe){
			boolean agregado = stock.agregarIngrediente(ingrediente);

			mensaje = agregado ? "El ingrediente se agregó correctamente." : "No se pudo agregar el ingrediente";

			
		}else{
			mensaje = "El ingrediente ya existe. Por favor ingrese uno distinto.";
		}
		
		ModelMap modelMap = new ModelMap();
		modelMap.put("mensaje", mensaje);

		return new ModelAndView("mensaje", modelMap);
	}
}
