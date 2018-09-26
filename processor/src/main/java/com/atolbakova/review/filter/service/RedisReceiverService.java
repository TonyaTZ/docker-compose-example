package com.atolbakova.review.filter.service;

import com.atolbakova.review.dto.ReviewDto;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPubSub;

import javax.annotation.PostConstruct;
import java.io.IOException;

import static java.util.concurrent.CompletableFuture.runAsync;

@Service
public class RedisReceiverService {

    /**
     * Logger.
     */
    private static final Logger LOG = LoggerFactory.getLogger(RedisReceiverService.class);

    /**
     * Redis queue.
     */
    @Value("${redis.queue.name}")
    private String queue;

    /**
     * Redis server.
     */
    private final Jedis jedis;

    /**
     * Review processor.
     */
    private final ReviewProcessorService reviewProcessorService;

    /**
     * Json mapper.
     */
    private final ObjectMapper objectMapper;

    @Autowired
    public RedisReceiverService(Jedis jedis, ReviewProcessorService reviewProcessorService, ObjectMapper objectMapper) {
        this.jedis = jedis;
        this.reviewProcessorService = reviewProcessorService;
        this.objectMapper = objectMapper;
    }

    /**
     * Consumes messages from the queue and sends them to processor.
     */
    @PostConstruct
    public void start() {
        LOG.info("Consumer successfully started");
        jedis.subscribe(new JedisPubSub() {
            @Override
            public void onMessage(String channel, String message) {
                runAsync(() -> {
                    try {
                        reviewProcessorService.process(objectMapper.readValue(message, ReviewDto.class));
                    } catch (IOException e) {
                        LOG.error("Couldn't read Json value", e);
                    }
                });
            }
        }, queue);
    }
}
