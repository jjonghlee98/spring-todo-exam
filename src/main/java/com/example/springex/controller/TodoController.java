package com.example.springex.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
}
