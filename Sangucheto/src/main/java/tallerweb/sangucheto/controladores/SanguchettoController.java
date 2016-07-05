package tallerweb.sangucheto.controladores;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tallerweb.sangucheto.modelo.Ingrediente;
import tallerweb.sangucheto.modelo.Stock;

@Controller
@RequestMapping("/sanguchetto")
public class SanguchettoController {

	private Stock stock = null;

	public SanguchettoController() {
		if (stock == null) {
			stock = Stock.getInstance();
		}
	}

	@RequestMapping(value = "/armarSanguchetto", method = RequestMethod.GET)
	public ModelAndView armarSanguchetto() {
		ModelMap modelMap = new ModelMap();
		modelMap.put("mensaje", "Aun no implementado");
		return new ModelAndView("armarSanguchetto", modelMap);
	}

}
