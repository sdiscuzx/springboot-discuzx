package com.xstudio.utils;

import com.xstudio.exception.ClockMovedBackwardsException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * twitter的snowflake 每秒能够产生26万ID左右
 * From: https://github.com/twitter/snowflake
 * An object that generates IDs.
 * This is broken into a separate class in case
 * we ever want to support multiple worker threads
 * per process
 *
 * @author xiaobiao
 * @version 1.0.0 on 2017/4/19.
 */
public class IdWorker {
    protected static final Logger logger = LoggerFactory.getLogger(IdWorker.class);

    private static Random random = new Random();

    private static Map<String, IdWorker> idWorkers = new HashMap<>();

    private long workerId;
    private long dataCenterId;

    /**
     * 起始标记点，作为基准
     */
    private long twepoch = 1288834974657L;
    /**
     * 并发控制, 0
     */
    private long sequence = 0L;
    /**
     * sequence值控制在0-4095
     */
    private long sequenceBits = 12L;
    /**
     * 只允许workid的范围为：0-1023
     */
    private long workerIdBits = 5L;
    /**
     * 1023,1111111111, 10位
     */
    private long maxWorkerId = ~(-1L << workerIdBits);

    private long dataCenterIdBits = 5L;

    private long maxDataCenterId = ~(-1L << dataCenterIdBits);
    /**
     * 12
     */
    private long workerIdShift = sequenceBits;
    /**
     * 22
     */
    private long timestampLeftShift = sequenceBits + workerIdBits + dataCenterIdBits;
    /**
     * 4095,111111111111,12位
     */
    private long sequenceMask = ~(-1L << sequenceBits);

    private long dataCenterIdShift = sequenceBits + workerIdBits;


    private long lastTimestamp = -1L;

    public static long getId() {
        int threadHashCode = Thread.currentThread().getName().hashCode();
        Integer workerId = threadHashCode % 32;
        if (workerId < 0) {
            workerId = -workerId;
        }
        long dataCenterId = getDataCenterId();
        String id = Long.toString(workerId) + "dc" + dataCenterId;

        IdWorker idWorker = idWorkers.get(id);
        if (null == idWorker) {
            idWorker = new IdWorker(workerId, dataCenterId);
            idWorkers.put(id, idWorker);
        }
        return idWorker.nextId();
    }

    public static String getIdString() {
        return String.valueOf(getId());
    }

    private static long getDataCenterId() {
        return random.nextInt(31);
    }

    public IdWorker(long workerId, long dataCenterId) {
        super();
        // workid < 1024 [10位：2的10次方]
        if (workerId > maxWorkerId || workerId < 0) {
            throw new IllegalArgumentException(String.format("worker Id can't be greater than %d or less than 0", maxWorkerId));
        }
        if (dataCenterId > maxDataCenterId || dataCenterId < 0) {
            throw new IllegalArgumentException(String.format("dataCenter Id can't be greater than %d or less than 0", maxDataCenterId));
        }
        this.workerId = workerId;
        this.dataCenterId = dataCenterId;
        if (logger.isTraceEnabled()) {
            logger.trace(String.format("worker starting. timestamp left shift %d, dataCenter id bits %d, worker id bits %d, sequence bits %d, worker Id %d", timestampLeftShift, dataCenterIdBits, workerIdBits, sequenceBits, workerId));
        }
    }

    public synchronized long nextId() {
        long timestamp = timeGen();
        // 如果当前时间小于上一次ID生成的时间戳，说明系统时钟回退过这个时候应当抛出异常
        if (timestamp < lastTimestamp) {
            if (logger.isErrorEnabled()) {
                logger.error(String.format("clock is moving backwards.  Rejecting requests until %d.", lastTimestamp));
            }
            throw new ClockMovedBackwardsException(String.format("Clock moved backwards.  Refusing to generate id for %d milliseconds", lastTimestamp - timestamp));
        }
        // 如果上一个timestamp与新产生的相等，则sequence加一(0-4095循环)，下次再使用时sequence是新值
        if (lastTimestamp == timestamp) {
            sequence = (sequence + 1) & sequenceMask;
            // 毫秒内序列溢出
            if (sequence == 0) {
                // 阻塞到下一个毫秒,获得新的时间戳
                timestamp = tilNextMillis(lastTimestamp);
            }
            // 时间戳改变，毫秒内序列重置
        } else {
            sequence = 0L;
        }
        // 上次生成ID的时间截
        lastTimestamp = timestamp;
        // 移位并通过或运算拼到一起组成64位的ID  生成新的timestamp
        return ((timestamp - twepoch) << timestampLeftShift) | (dataCenterId << dataCenterIdShift) | (workerId << workerIdShift) | sequence;
    }

    /**
     * 阻塞到下一个毫秒，直到获得新的时间戳
     *
     * @param lastTimestamp 上次生成ID的时间截
     * @return 当前时间戳
     */
    private long tilNextMillis(long lastTimestamp) {
        long timestamp = timeGen();
        while (timestamp <= lastTimestamp) {
            timestamp = timeGen();
        }
        return timestamp;
    }

    /**
     * 返回以毫秒为单位的当前时间
     *
     * @return 当前时间(毫秒)
     */
    private long timeGen() {
        return System.currentTimeMillis();
    }
}
