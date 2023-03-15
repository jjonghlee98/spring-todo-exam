package com.example.springex.service;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import com.example.springex.domain.TodoVO;
import com.example.springex.dto.PageRequestDTO;
import com.example.springex.dto.PageResponseDTO;
import com.example.springex.dto.TodoDTO;
import com.example.springex.mapper.TodoMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TodoServiceImpl implements TodoService {

	private final TodoMapper todoMapper;

	private final ModelMapper modelMapper;

	@Override
	public PageResponseDTO<TodoDTO> getList(PageRequestDTO pageRequestDTO) {
		List<TodoVO> voList = todoMapper.selectList(pageRequestDTO);
		List<TodoDTO> dtoList = voList.stream().map(vo -> modelMapper.map(vo, TodoDTO.class)).collect(Collectors.toList());

		int total = todoMapper.selectCount(pageRequestDTO);

		PageResponseDTO<TodoDTO> pageResponseDTO = PageResponseDTO.<TodoDTO>withAll().pageRequestDTO(pageRequestDTO).total(total).dtoList(dtoList).build();

		return pageResponseDTO;
	}

	@Override
	public void register(TodoDTO todoDTO) {
		TodoVO vo = modelMapper.map(todoDTO, TodoVO.class);

		todoMapper.insertTodo(vo);

	}

	@Override
	public TodoDTO getTodo(Long tno) {

		TodoVO vo = todoMapper.selectTodo(tno);
		TodoDTO dto = modelMapper.map(vo, TodoDTO.class);

		return dto;
	}

	@Override
	public void modify(TodoDTO todoDTO) {
		TodoVO vo = modelMapper.map(todoDTO, TodoVO.class);

		todoMapper.updateTodo(vo);

	}

	@Override
	public void remove(Long tno) {

		todoMapper.deleteTodo(tno);

	}

}
