package com.atolbakova.review.dto;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class ReviewDto {

    private final Long id;

    private final String value;

    public ReviewDto(Long id, String value) {
        this.id = id;
        this.value = value;
    }
}