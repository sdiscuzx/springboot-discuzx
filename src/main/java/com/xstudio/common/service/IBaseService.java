package com.xstudio.common.service;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.xstudio.utils.Msg;

import java.util.List;

/**
 * Created by Beeant on 2016/12/24.
 */
public interface IBaseService<T extends BaseModelObject> {
    /**
     * 统计总数
     *
     * @param record 统计条件
     * @return 统计结果
     */
    Long countByExample(T record);

    /**
     * 插入设置的值
     *
     * @param record 对象
     * @return 插入成功数
     */
    Msg<T> insertSelective(T record);

    /**
     * 批量插入设置的值
     *
     * @param record 对象
     * @return 插入成功数
     */
    Msg<List<T>> batchInsertSelective(List<T> record);

    /**
     * 主键删除
     *
     * @param keys 主键
     * @return 删除条数
     */
    Msg<Integer> deleteByPrimaryKey(String keys);

    /**
     * 批量删除
     *
     * @param keys 主键
     * @return 删除条数
     */
    Msg<Integer> batchDeleteByPrimaryKey(List<String> keys);

    /**
     * 更新选定的值
     *
     * @param record 对象
     * @return 更新的条数
     */
    Msg<T> updateByPrimaryKeySelective(T record);

    /**
     * 按条件更新选定的值
     *
     * @param example 条件
     * @param record  值对象
     * @return 更新的条数
     */
    Msg<T> updateByExampleSelective(T example, T record);

    /**
     * 批量按主键更新设定的值
     *
     * @param record 值
     * @return 更新的条数
     */
    Msg<List<T>> batchUpdateByPrimaryKeySelective(List<T> record);

    /**
     * 按主键获取
     *
     * @param keys 主键
     * @return 对象
     */
    Msg<T> selectByPrimaryKey(String keys);

    /**
     * 按条件获取（不含大字段）
     *
     * @param record   条件
     * @param distinct 是否distinct
     * @return 对象list
     */
    Msg<T> selectOneByExample(T record, boolean distinct);

    /**
     * 按条件获取（不含大字段） distinct = true
     *
     * @param record 条件
     * @return 对象list
     */
    Msg<T> selectOneByExample(T record);

    /**
     * 按条件获取（含大字段）
     *
     * @param record   条件
     * @param distinct 是否distinct
     * @return 对象list
     */
    Msg<T> selectOneByExampleWithBLOBs(T record, boolean distinct);

    /**
     * 按条件获取（含大字段）
     *
     * @param record 条件
     * @return 对象list
     */
    Msg<List<T>> selectAllByExample(T record);

    /**
     * 按条件获取（含大字段），指定排序
     *
     * @param record 条件
     * @param orders 排序
     * @return 对象list
     */
    Msg<List<T>> selectAllByExample(T record, List<Order> orders);

    /**
     * 分页获取
     *
     * @param record     条件
     * @param pageBounds 分页参数
     * @return 对象list
     */
    Msg<PageList<T>> selectByExampleByPager(T record, PageBounds pageBounds);

    /**
     * 模糊搜索
     *
     * @param record 搜索对象
     * @return 满足条件的对象
     */
    Msg<T> fuzzySearch(T record);

    /**
     * 分页模糊搜索
     *
     * @param record     对象
     * @param pageBounds 分页参数
     * @return 对象list
     */
    Msg<PageList<T>> fuzzySearchByPager(T record, PageBounds pageBounds);

    /**
     * 获取dao实现
     *
     * @return Dao实现
     */
    IBaseDao<T> getRepositoryDao();

    /**
     * 设置默认值
     *
     * @param record 对象
     */
    void setDefaults(T record);

    /**
     * 唯一验证
     *
     * @param record 待验证对象字段
     * @return 验证结果 msg.code == 0 时表示该字段可用
     */
    Msg<String> uniqueValid(T record);

    /**
     * 设置创建时的默认值
     *
     * @param record
     */
    void setCreateInfo(T record);

    /**
     * 设置更新时的默认值
     *
     * @param record
     */
    void setUpdateInfo(T record);
}
