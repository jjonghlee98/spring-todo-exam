package com.example.springex.service;

import com.example.springex.domain.TodoVO;
import com.example.springex.dto.PageRequestDTO;
import com.example.springex.dto.PageResponseDTO;
import com.example.springex.dto.TodoDTO;

public interface TodoService {
	
	PageResponseDTO<TodoDTO> getList(PageRequestDTO pageRequestDTO); 
	
	TodoDTO getTodo(Long tno);
	
	void register(TodoDTO todoDTO);
	
	void modify(TodoDTO todoDTO);
	
	void remove(Long tno);

}
