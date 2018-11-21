package AeroportSpringMvcWeb.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.Vol;
import repositories.AeroportRepository;
import repositories.VolRepository;
import service.VolService;

@Controller
@RequestMapping("/vol")
public class VolController {

	@Autowired
	VolRepository volRepo;

	@Autowired
	AeroportRepository aeroRepo;

@Autowired
VolService volservice;
	
	
	@RequestMapping("")
	public ModelAndView home() {
		return new ModelAndView("redirect:/vol/");
		
	}

	@GetMapping("/")
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("vol/listVol", "volsaeroport", volRepo.findAll());
		return modelAndView;
	}

	@GetMapping("/delete")
	public ModelAndView delete(@RequestParam(name = "id", required = true) Integer id) {
		volservice.deleteVolById(id);	
		return new ModelAndView("redirect:/vol/");
	}

	@GetMapping("/edit")
	public ModelAndView edit(@RequestParam(name = "id", required = true) Integer id) {
		Vol vol = volservice.findById(id); 
			return goEdit(vol); 
	} 
	 

	@GetMapping("/addVol")
	public ModelAndView addVol() {
		return goEdit(new Vol());
	}
 

	private ModelAndView goEdit(Vol vol) {
		ModelAndView modelAndView = new ModelAndView("vol/editVol", "vol", vol);
//		modelAndView.addObject("aeroports", aeroRepo.findAll());
		modelAndView.addObject("reservations", volservice.showReservationByVol(vol.getIdVol()));
		return modelAndView;
	} 
	

	@GetMapping("/saveVol")
	public ModelAndView saveVol(@Valid @ModelAttribute("vol") Vol vol, BindingResult br) {
		return save(vol, br);
	}
 

	private ModelAndView save(Vol vol, BindingResult br) {
		if (br.hasErrors()) {
			return goEdit(vol);
		}
		if  (vol.getAeroportArrivee() != null && vol.getAeroportArrivee().getNom() == null )    {
			vol.setAeroportArrivee(null);
		}
		if ( vol.getAeroportDepart() != null && vol.getAeroportDepart().getNom() == null) { 
			vol.setAeroportDepart(null);
		}
				 

		volservice.saveVol(vol); 
		return new ModelAndView("redirect:/vol/");
	}

}
