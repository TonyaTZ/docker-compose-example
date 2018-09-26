package com.atolbakova.review.api.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import redis.clients.jedis.Jedis;

@Configuration
@EntityScan("com.atolbakova.review")
public class ApplicationConfig {

    @Value("${redis.host}")
    private String host;

    @Bean
    public Jedis getJedis() {
        return new Jedis(host);
    }
}
