package com.example.springex.service;

import com.example.springex.dto.PageRequestDTO;
import com.example.springex.dto.PageResponseDTO;
import com.example.springex.dto.TodoDTO;

public interface TodoService {
	
	PageResponseDTO<TodoDTO> getList(PageRequestDTO pageRequestDTO); 
	
	TodoVO getTodo(Page)

}
