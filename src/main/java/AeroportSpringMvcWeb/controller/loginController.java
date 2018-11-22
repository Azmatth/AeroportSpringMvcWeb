package AeroportSpringMvcWeb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.Client;
import service.ClientService;

@Controller
@RequestMapping("/connexion")
public class loginController {

	@Autowired
	ClientService clientService;
	
		

	@RequestMapping("")
	public ModelAndView home() {
		return new ModelAndView("redirect:/connexion/");
	}

	@GetMapping("/")
	public ModelAndView listClients() {
		ModelAndView modelAndView = new ModelAndView("/connexion/connexion", "client", new Client());
		return modelAndView;
	}

	private boolean verification(String clientName, String mail) {
		// Verifier si les infos existent dans la base
		Client c = clientService.findByName(clientName);
		if ( c.getClientId() != null && c.getMail()== mail  && c.equals(true) ) {
			return true;
		} else {
			return false;
		} 	 
	}
	
 @PostMapping
 	public ModelAndView connexion(@RequestParam(name = "clientName", required = true) String clientName, @RequestParam(name = "mail", required = true) String mail) { 
	 // Passer le client en méthodes post pour différencier des non connectés ? 
	 if(verification(clientName, mail)) {
//		 client.setState= 1; 
		 return new ModelAndView("redirect:./reservation");
	 }	else {
		 return new ModelAndView("redirect:/connexion/"); 
	 } 
 }   

}
