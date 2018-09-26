package com.atolbakova.review.api.service;

import com.atolbakova.review.api.repository.ReviewRepository;
import com.atolbakova.review.model.Review;
import com.atolbakova.review.api.request.CreateReviewRequest;
import com.atolbakova.review.api.response.CreateReviewResponse;
import org.apache.commons.validator.ValidatorException;
import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.atolbakova.review.enums.ReviewStatus.PENDING;
import static java.util.concurrent.CompletableFuture.runAsync;
import static org.apache.commons.lang3.StringUtils.isBlank;

@Service
public class ReviewService {

    /**
     * Redis sender service.
     */
    private RedisSenderService redisSenderService;

    /**
     * Review repository.
     */
    private ReviewRepository reviewRepository;

    @Autowired
    public ReviewService(RedisSenderService redisSenderService, ReviewRepository reviewRepository) {
        this.redisSenderService = redisSenderService;
        this.reviewRepository = reviewRepository;
    }

    /**
     * Saves review to database and sends it for validation to queue.
     *
     * @param reviewRequest for new review
     * @return generated response
     */
    public CreateReviewResponse saveReview(CreateReviewRequest reviewRequest) {
        try {
            validate(reviewRequest);
            Review saved = reviewRepository.save(convertToReview(reviewRequest));
            runAsync(() -> redisSenderService.send(saved));
            return new CreateReviewResponse(saved.getId());
        } catch (ValidatorException e) {
            return new CreateReviewResponse(e);
        }
    }

    /**
     * Converts CreateReviewRequest object to Review
     *
     * @param reviewRequest to convert to Review entity.
     * @return Review entity.
     * @see CreateReviewRequest
     * @see Review
     */
    private Review convertToReview(CreateReviewRequest reviewRequest) {
        Review review = new Review();
        review.setName(reviewRequest.getName());
        review.setEmail(reviewRequest.getEmail());
        review.setProductId(reviewRequest.getProductId());
        review.setValue(reviewRequest.getReview());
        review.setStatus(PENDING);
        return review;
    }

    /**
     * Validates passed review.
     *
     * @param review to validate.
     * @throws ValidatorException in case on any validation errors.
     */
    private void validate(CreateReviewRequest review) throws ValidatorException {
        if (!EmailValidator.getInstance().isValid(review.getEmail())) {
            throw new ValidatorException("Specify valid email, please.");
        }
        if (isBlank(review.getName())) {
            throw new ValidatorException("Specify your name, please.");
        }
        if (0 == review.getProductId()) {
            throw new ValidatorException("Specify product id, please.");
        }
        //TODO check if product id exists
        if (isBlank(review.getReview())) {
            throw new ValidatorException("Specify the review, please.");
        }
    }
}
