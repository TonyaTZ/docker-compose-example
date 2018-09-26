package com.atolbakova.review.api.service;

import com.atolbakova.review.dto.ReviewDto;
import com.atolbakova.review.model.Review;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.exceptions.JedisException;

import java.util.concurrent.TimeUnit;

import static java.lang.String.format;

/**
 * Sends new messages to review.
 */
@Service
public class RedisSenderService {

    /**
     * Logger.
     */
    private static final Logger LOG = LoggerFactory.getLogger(RedisSenderService.class);

    /**
     * Name of the queue to
     */
    @Value("${redis.queue.name}")
    private String queue;

    /**
     * Enables retry sending messages.
     */
    @Value("${redis.retry.enabled:false}")
    private Boolean isRetryEnabled;

    /**
     * Number of seconds to wait before retry push.
     */
    @Value("${redis.retry.second:60}")
    private Integer secondsToWaitBeforeRetry;

    /**
     * Redis server.
     */
    private Jedis jedis;

    /**
     * Json mapper.
     */
    private ObjectMapper objectMapper;


    @Autowired
    public RedisSenderService(Jedis jedis, ObjectMapper objectMapper) {
        this.jedis = jedis;
        this.objectMapper = objectMapper;
    }

    /**
     * Sending message for review.
     *
     * @param review to send.
     */
    public void send(Review review) {
        try {
            jedis.publish(queue, objectMapper.writeValueAsString(new ReviewDto(review.getId(), review.getValue())));
        } catch (JsonProcessingException e) {
            LOG.error(format("Couldn't create Json from object: %s", review.toString()));
        } catch (JedisException e) {
            LOG.error("Couldn't send review to redis queue", e);
            if (isRetryEnabled) {
                waitBeforeRetry();
                send(review);
            }
        }
    }


    /**
     * Pauses execution for {@link #secondsToWaitBeforeRetry} seconds.
     */
    private void waitBeforeRetry() {
        try {
            TimeUnit.MINUTES.sleep(secondsToWaitBeforeRetry);
        } catch (InterruptedException ignored) {
        }
    }
}
