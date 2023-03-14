package com.example.springex.dto;

import lombok.*;

import java.util.List;


@Getter
@ToString
public class PageResponseDTO<E> {

	private int page;
	
	private int size;
	
	private int total;
	
	private int start;
	
	private int end;
	
	private int last;
	
	private boolean prev;
	
	private boolean next;
	
	private List<E> dtoList;
	
	@Builder(builderMethodName = "withAll")
	public PageResponseDTO(PageRequestDTO pageRequestDTO, List<E> dtoList, int total) {
		
		this.page = pageRequestDTO.getPage();
		this.size = pageRequestDTO.getSize();
		
		this.end = (int)(Math.ceil(page / 10.0)) * 10;
		this.start = this.end - 9;
		
		this.total = total;
		this.dtoList = dtoList;
		
		this.last = (int)(Math.ceil(total / (double)this.size));
		this.end = end > last ? last : end;
		
		this.prev = start > 1;
		this.next = total > this.end * this.size;
	}
	
}
