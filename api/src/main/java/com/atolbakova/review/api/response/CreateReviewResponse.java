package com.atolbakova.review.api.response;

import lombok.Data;

@Data
public class CreateReviewResponse {

    /**
     * Message in case of error.
     */
    private String errorMessage;

    /**
     * Review Id to track it later.
     */
    private long reviewID;

    /**
     * Means if request was processed successfully.
     */
    private boolean success;


    /**
     * Creates successful response.
     *
     * @param reviewID of created review.
     */
    public CreateReviewResponse(long reviewID) {
        this.setSuccess(true);
        this.reviewID = reviewID;
    }

    /**
     * Creates failure response.
     *
     * @param exception cause of failure.
     */
    public CreateReviewResponse(Exception exception) {
        this.setSuccess(false);
        this.errorMessage = exception.getMessage();
    }
}
