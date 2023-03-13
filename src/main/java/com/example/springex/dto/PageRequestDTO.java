package com.example.springex.dto;

import lombok.*;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Positive;


@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageRequestDTO {
	
	@Builder.Default
	@Min(value = 1)
	@Positive
	private int page = 1;
	
	@Builder.Default
	@Min(value = 10)
	@Max(value = 100)
	@Positive
	private int size = 10;
	
	public int getSkip() {
		return (page - 1) * 10;
	}
	
}
