package AeroportSpringMvcWeb.controller;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.Reservation;
import service.ReservationService;


@Controller
@RequestMapping("/reservation")
public class ReservationController {

		@Autowired
		private ReservationService reservationService;

		@RequestMapping("")
		public ModelAndView home() {
			return new ModelAndView("redirect:/reservation/");
		}
		
		@GetMapping("/")
		public ModelAndView listReservation() {
			ModelAndView modelAndView= new ModelAndView("/reservation/listReservation", "reservations", reservationService.showAll());
			return modelAndView;
		}
		
		@GetMapping("/delete")
		public ModelAndView delete(@RequestParam(name = "numeroReservation", required = true) Integer numeroReservation) {
			reservationService.deleteReservation(numeroReservation);
			return new ModelAndView("redirect:/reservation/");
		}

		@GetMapping("/editReservation")
		public ModelAndView edit(@RequestParam(name = "numeroReservation", required = true) Integer numeroReservation) {
			Reservation reservation = reservationService.showReservation(numeroReservation);
			return new ModelAndView("reservation/editReservation", "reservation", reservation);
		}

		@GetMapping("/addReservation")
		public ModelAndView addReservation() {
			return goEditReservation(new Reservation());
		}

		private ModelAndView goEditReservation(Reservation reservation) {
			ModelAndView modelAndView = new ModelAndView("reservation/editReservation", "reservation", reservation);
			return modelAndView;
		}
		
		@PostMapping("/saveReservation")
		public ModelAndView saveReservation(@Valid @ModelAttribute("reservation") Reservation reservation, BindingResult result) {
			if (result.hasErrors()) {
				return goEditReservation(reservation);
			}
			if (reservation.getNumeroReservation() == null) {
				addReservation();
			} else {
				reservationService.modifyReservation(reservation.getNumeroReservation());
			}
			return new ModelAndView("redirect:/reservation/");
		}
}
