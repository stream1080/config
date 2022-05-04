package ;

import ;

@Configuration
public class RedisConfig {

    @Bean
    public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory redisConnectionFactory) {
        RedisTemplate<String, Object> redisTemplate = new RedisTemplate<>();

        //key序列化
        redisTemplate.setKeySerializer(new StringRedisSerializer());

        //value序列化
        redisTemplate.setValueSerializer(new GenericJackson2JsonRedisSerializer());

        //hash类型 key序列化
        redisTemplate.setHashKeySerializer(new StringRedisSerializer());

        //hash类型 value序列化
        redisTemplate.setHashValueSerializer(new GenericJackson2JsonRedisSerializer());

        //注入连接工厂
        redisTemplate.setConnectionFactory(redisConnectionFactory);

        return redisTemplate;
    }


    @Bean
    public DefaultRedisScript<Long> script(){
        DefaultRedisScript<Long> redisScript = new DefaultRedisScript<>();
        //stock.lua脚本位置和application.properties同级目录
        redisScript.setLocation(new ClassPathResource("stock.lua"));
        redisScript.setResultType(Long.class);
        return redisScript;
    }
}