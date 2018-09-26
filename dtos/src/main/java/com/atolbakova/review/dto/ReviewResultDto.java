package com.atolbakova.review.dto;

import com.atolbakova.review.enums.ReviewStatus;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import static com.atolbakova.review.enums.ReviewStatus.APPROVED;
import static com.atolbakova.review.enums.ReviewStatus.REJECTED;

@Data
@Getter
@Setter
public class ReviewResultDto {

    private final Long id;

    private final ReviewStatus status;

    public ReviewResultDto(Long id, boolean isApproved) {
        this.id = id;
        this.status = isApproved ? APPROVED : REJECTED;
    }
}
