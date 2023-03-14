package com.example.springex.mapper;

import java.util.List;

import com.example.springex.domain.TodoVO;
import com.example.springex.dto.PageRequestDTO;
import com.example.springex.dto.TodoDTO;

public interface TodoMapper {
	
	List<TodoVO> selectList(PageRequestDTO pageRequestDTO);
	
	TodoVO selectTodo(Long tno);
	
	void deleteTodo(Long tno);

	int selectCount(PageRequestDTO pageRequestDTO);
	
	void insertTodo(TodoVO todoVO);
	
	void updateTodo(TodoVO todoVO);
	
}
