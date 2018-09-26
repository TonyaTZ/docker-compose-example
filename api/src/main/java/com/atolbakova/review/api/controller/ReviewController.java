package com.atolbakova.review.api.controller;

import com.atolbakova.review.api.request.CreateReviewRequest;
import com.atolbakova.review.api.response.CreateReviewResponse;
import com.atolbakova.review.api.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
public class ReviewController {

    private ReviewService reviewService;

    @Autowired
    public ReviewController(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    @PostMapping("/review")
    public CreateReviewResponse sendReview(@RequestBody @Valid CreateReviewRequest reviewRequest) {
        return reviewService.saveReview(reviewRequest);
    }
}
