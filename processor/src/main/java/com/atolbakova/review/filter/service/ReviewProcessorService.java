package com.atolbakova.review.filter.service;

import com.atolbakova.review.dto.ReviewDto;
import com.atolbakova.review.enums.ReviewStatus;
import com.atolbakova.review.filter.repository.ReviewRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

import static java.lang.String.format;
import static org.apache.commons.lang3.StringUtils.containsIgnoreCase;

@Service
public class ReviewProcessorService {

    /**
     * Logger.
     */
    private static final Logger LOG = LoggerFactory.getLogger(RedisReceiverService.class);

    /**
     * Words to be filtered out.
     */
    @Value("#{'${bad.words}'.split(',')}")
    private List<String> badWords;

    /**
     * Repository.
     */
    private ReviewRepository reviewRepository;

    /**
     * Email sender.
     */
    private EmailSenderService emailSenderService;

    public ReviewProcessorService(ReviewRepository reviewRepository, EmailSenderService emailSenderService) {
        this.reviewRepository = reviewRepository;
        this.emailSenderService = emailSenderService;
    }

    public void process(ReviewDto reviewDto) {
        Long reviewId = reviewDto.getId();
        LOG.info(format("Processing review: %d", reviewId));
        boolean isValid = badWords.stream().noneMatch(word -> containsIgnoreCase(reviewDto.getValue(), word));
        if (isValid) {
            reviewRepository.updateStatusById(ReviewStatus.APPROVED, reviewId);
            LOG.info(format("Review %d was approved.", reviewDto.getId()));
            emailSenderService.sendEmail(reviewRepository.getOne(reviewId));
        } else {
            reviewRepository.updateStatusById(ReviewStatus.REJECTED, reviewId);
            LOG.info(format("Review %d was rejected.", reviewDto.getId()));
        }
    }
}
