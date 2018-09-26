package com.atolbakova.review.filter.repository;

import com.atolbakova.review.enums.ReviewStatus;
import com.atolbakova.review.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface ReviewRepository extends JpaRepository<Review, Long> {

    @Modifying
    @Query("update Review rev set rev.status = ?1 where rev.id = ?2")
    void updateStatusById(ReviewStatus status, Long id);
}
