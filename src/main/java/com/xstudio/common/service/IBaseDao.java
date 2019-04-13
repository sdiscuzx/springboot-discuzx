package com.xstudio.common.service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 基础dao
 *
 * @author xiaobiao
 * @version 1.0.0 on 2017.04.12
 */
public interface IBaseDao<T> {
    /**
     * 统计总数
     * @param record 统计条件
     * @return 统计结果
     */
    Long countByExample(@Param("example") T record);

    /**
     * 插入设置的值
     *
     * @param record 对象
     * @return 插入成功数
     */
    int insertSelective(T record);

    /**
     * 批量插入设置的值
     * @param record 对象
     * @return 插入成功数
     */
    int batchInsertSelective(List<T> record);

    /**
     * 主键删除
     * @param key 主键
     * @return 删除条数
     */
    int deleteByPrimaryKey(String key);

    /**
     * 批量删除
     * @param keys 主键
     * @return 删除条数
     */
    int batchDeleteByPrimaryKey(@Param("items") List<String> keys);

    /**
     * 更新选定的值
     * @param record 对象
     * @return 更新的条数
     */
    int updateByPrimaryKeySelective(T record);

    /**
     * 按条件更新选定的值
     * @param example 条件
     * @param record 值对象
     * @return 更新的条数
     */
    int updateByExampleSelective(@Param("example") T example, @Param("record") T record);

    /**
     * 批量按主键更新设定的值
     * @param record 值
     * @return 更新的条数
     */
    int batchUpdateByPrimaryKeySelective(List<T> record);

    /**
     * 按主键获取
     * @param key 主键
     * @return 对象
     */
    T selectByPrimaryKey(String key);

    /**
     * 按条件获取（不含大字段）
     * @param record 条件
     * @param distinct 是否distinct
     * @return 对象list
     */
    List<T> selectByExample(@Param("example") T record, @Param("distinct") boolean distinct);

    /**
     * 按条件获取（含大字段）
     * @param record 条件
     * @param distinct 是否distinct
     * @return 对象list
     */
    List<T> selectByExampleWithBLOBs(@Param("example") T record, @Param("distinct") boolean distinct);

    /**
     * 分页获取
     * @param record 条件
     * @param pageBounds 分页参数
     * @return 对象list
     */
    PageList<T> selectByExampleByPager(@Param("example") T record, @Param("pageBounds") PageBounds pageBounds);

    /**
     * 模糊搜索
     * @param record 搜索对象
     * @return 满足条件的对象
     */
    T fuzzySearch(T record);

    /**
     * 分页模糊搜索
     * @param record 对象
     * @param pageBounds 分页参数
     * @return 对象list
     */
    PageList<T> fuzzySearchByPager(@Param("example") T record, @Param("pageBounds") PageBounds pageBounds);
}