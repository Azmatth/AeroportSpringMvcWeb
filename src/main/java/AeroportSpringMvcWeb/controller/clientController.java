package AeroportSpringMvcWeb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import repositories.ClientRepository;
import service.ClientService;

@Controller
@RequestMapping("/client")
public class clientController {

	@Autowired
	private ClientService clientService;

	
	@RequestMapping("")
	public ModelAndView home() {
		return new ModelAndView("redirect:/client/");
	}
	
	@GetMapping("/")
		public ModelAndView listClients() {
			ModelAndView modelAndView= new ModelAndView("/client/listClients","clients",clientService.findAllClients());
			return modelAndView;
	
		}
	
	@GetMapping("/editClient")
	public ModelAndView edit(@RequestParam(name = "id", required = true) Integer id){
		clientService.
		ModelAndView modelAndView=new ModelAndView("/client/editClient","client",clientService.findClientById(id));
		return modelAndView;
		
	}
	
	@GetMapping("/deleteClient")
	public ModelAndView delete(@RequestParam(name="id", required=true) Integer id) {
		ModelAndView modelAndView=new ModelAndView("/client/",)
	}
	}
