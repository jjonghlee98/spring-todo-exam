package com.example.springex.mapper;

import java.util.List;

import com.example.springex.domain.TodoVO;
import com.example.springex.dto.PageRequestDTO;
import com.example.springex.dto.TodoDTO;

public interface TodoMapper {
	
	List<TodoVO> selectList(PageRequestDTO pageRequestDTO);
	
	TodoVO selectTodo(TodoDTO todoDTO);
	
	int selectCount(PageRequestDTO pageRequestDTO);
	
	void insertTodo(TodoDTO todoDTO);
	
	void updateTodo(TodoDTO todoDTO);
	
	void deleteTodo(Long tno);
	
}
