package com.atolbakova.review.api.request;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;

@Data
@Getter
@Setter
public class CreateReviewRequest {

    @NotNull
    private String name;

    @NotNull
    private String email;

    @NotNull
    private Long productId;

    @NotNull
    private String review;
}
