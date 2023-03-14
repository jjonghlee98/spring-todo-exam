package com.example.springex.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.springex.dto.PageRequestDTO;
import com.example.springex.dto.PageResponseDTO;
import com.example.springex.dto.TodoDTO;
import com.example.springex.service.TodoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/todo")
@RequiredArgsConstructor
@Log4j2
public class TodoController {

	private final TodoService todoService;
	
	@GetMapping("/list")
	public void list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, Model model) {
		
		log.info(pageRequestDTO);

		if (bindingResult.hasErrors()) {
			pageRequestDTO = PageRequestDTO.builder().build();
		}
		
		model.addAttribute("responseDTO", todoService.getList(pageRequestDTO));
		
	}
	
	@GetMapping("/register")
	public void registerGET() {
		log.info("/register.......");
	}
	
	@PostMapping("/register")
	public String registerPOST(@Valid TodoDTO todoDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		
		log.info(todoDTO);
		
		if (bindingResult.hasErrors()) {
			bindingResult.getAllErrors();
			
			return "redirect:/todo/register";
		}
		
		todoService.register(todoDTO);
		
		return "redirect:/todo/list";
	}
	
	@GetMapping({"/read", "/modify"})
	public void read(Long tno, PageRequestDTO pageRequestDTO, Model model) {
		log.info("/read.........");
		
		model.addAttribute("read", todoService.getTodo(tno));
	}
	
	@PostMapping("/modify")
	public String modify(@Valid TodoDTO todoDTO, PageRequestDTO pageRequestDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		
		log.info("/modify..........");
		
		if (bindingResult.hasErrors()) {
			redirectAttributes.addFlashAttribute("Error", bindingResult.getAllErrors());
			
			redirectAttributes.addAttribute("tno", todoDTO.getTno());
			
			return "redirect:/todo/modify";
		}
		
		todoService.modify(todoDTO);
		
		redirectAttributes.addAttribute("page", pageRequestDTO.getPage());
		redirectAttributes.addAttribute("size", pageRequestDTO.getSize());
		
		return "redirect:/todo/list";
		
	}
	
	@PostMapping("/remove")
	public String remove(TodoDTO todoDTO, RedirectAttributes redirectAttributes) {
		log.info("/remove......." + todoDTO);
		
		todoService.remove(todoDTO.getTno());
		
		return "redirect:/todo/list";
		
	}
	
}
