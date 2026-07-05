import Redis from 'ioredis';

export const redis = new Redis({
    host: process.env.REDIS_HOST || 'redis',
    connectTimeout: 5000,
    commandTimeout: 5000,
    lazyConnect: true,
});
