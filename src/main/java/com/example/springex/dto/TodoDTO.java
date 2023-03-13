package com.example.springex.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class TodoDTO {

	private Long tno;
	
	private String title;
	
	private LocalDate dueDate;
	
	private String writer;
	
	private boolean finished;
	
}
