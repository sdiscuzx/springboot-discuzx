package com.xstudio.common.service;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.xstudio.config.AppUserDetails;
import com.xstudio.utils.ContextUtil;
import com.xstudio.utils.EnError;
import com.xstudio.utils.Msg;
import org.apache.commons.collections4.ListUtils;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 基础服务
 * <p>
 *
 * @author Beeant on 2016/12/24.
 */
@Component
public abstract class BaseServiceImpl<T extends BaseModelObject> implements IBaseService<T> {
    private static int batchPerSqlNumber = 100;

    @Override
    public Msg<String> uniqueValid(T record) {
        Msg<String> msg = new Msg<>();
        String key = record.getKey();
        if (null == key || "".equals(key)) {
            Long existNumber = getRepositoryDao().countByExample(record);
            if (existNumber > 0) {
                msg.setResult(EnError.CONFLICT);
                return msg;
            }

            return msg;
        }

        /* 主键存在 参数获取的对象主键不一致时 返回错误 */
        record.setKey(null);
        List<T> dbRecord = getRepositoryDao().selectByExample(record, true);
        if (null != dbRecord && !dbRecord.isEmpty() && !key.equals(dbRecord.get(0).getKey())) {
            msg.setResult(EnError.CONFLICT);
            return msg;
        }

        return msg;
    }

    @Override
    public Long countByExample(T record) {
        return getRepositoryDao().countByExample(record);
    }


    @Override
    public Msg<T> insertSelective(T record) {
        Msg<T> msg = new Msg<>();
        setDefaults(record);
        setCreateInfo(record);
        int result = getRepositoryDao().insertSelective(record);
        if (0 == result) {
            msg.setResult(EnError.INSERT_NONE);
            return msg;
        }

        msg.setData(record);
        return msg;
    }

    @Override
    public Msg<List<T>> batchInsertSelective(List<T> records) {
        Msg<List<T>> msg = new Msg<>();
        if (null == records || records.isEmpty()) {
            msg.setResult(EnError.INSERT_NONE);
            return msg;
        }
        for (T record : records) {
            setDefaults(record);
            setCreateInfo(record);
        }

        int insertCount = 0;
        List<List<T>> lists = ListUtils.partition(records, batchPerSqlNumber);
        for (List<T> list : lists) {
            insertCount = insertCount + getRepositoryDao().batchInsertSelective(list);
        }

        if (0 == insertCount) {
            msg.setResult(EnError.INSERT_NONE);
            return msg;
        }
        msg.setData(records);

        return msg;
    }

    @Override
    public Msg<Integer> deleteByPrimaryKey(String keys) {
        Msg<Integer> msg = new Msg<>();
        int result = getRepositoryDao().deleteByPrimaryKey(keys);
        if (0 == result) {
            msg.setResult(EnError.DELETE_NONE);
            return msg;
        }

        return msg;
    }

    @Override
    public Msg<Integer> batchDeleteByPrimaryKey(List<String> keys) {
        Msg<Integer> msg = new Msg<>();
        if (null == keys || 0 == keys.size()) {
            msg.setResult(EnError.INSERT_NONE);
            return msg;
        }
        int result = getRepositoryDao().batchDeleteByPrimaryKey(keys);
        if (0 == result) {
            msg.setResult(EnError.DELETE_NONE);
            return msg;
        }

        msg.setData(result);
        return msg;
    }

    @Override
    public Msg<T> updateByPrimaryKeySelective(T record) {
        Msg<T> msg = new Msg<>();
        setDefaults(record);
        setUpdateInfo(record);
        int result = getRepositoryDao().updateByPrimaryKeySelective(record);
        if (0 == result) {
            msg.setResult(EnError.UPDATE_NONE);
            return msg;
        }

        // 重新获取数据
        T dbRecord = getRepositoryDao().selectByPrimaryKey(record.getKey());
        msg.setData(dbRecord);
        return msg;
    }

    @Override
    public Msg<T> updateByExampleSelective(T example, T record) {
        Msg<T> msg = new Msg<>();
        String keyValue = record.getKey();
        setDefaults(record);
        setUpdateInfo(record);
        record.setKey(null);
        int result = getRepositoryDao().updateByExampleSelective(example, record);
        if (0 == result) {
            msg.setResult(EnError.UPDATE_NONE);
            return msg;
        }

        // 重新获取数据
        if (!StringUtils.isEmpty(keyValue)) {
            T dbRecord = getRepositoryDao().selectByPrimaryKey(keyValue);
            msg.setData(dbRecord);
        }
        return msg;
    }

    @Override
    public Msg<List<T>> batchUpdateByPrimaryKeySelective(List<T> records) {
        Msg<List<T>> msg = new Msg<>();
        if (null == records || records.isEmpty()) {
            msg.setResult(EnError.INSERT_NONE);
            return msg;
        }
        for (T record : records) {
            setDefaults(record);
            setUpdateInfo(record);
        }

        int count = 0;
        List<List<T>> lists = ListUtils.partition(records, batchPerSqlNumber);
        for (List<T> list : lists) {
            count = count + getRepositoryDao().batchUpdateByPrimaryKeySelective(list);
        }

        if (0 == count) {
            msg.setResult(EnError.UPDATE_NONE);
            return msg;
        }

        msg.setData(records);
        return msg;
    }

    @Override
    public Msg<T> selectByPrimaryKey(String keys) {
        Msg<T> msg = new Msg<>();
        T result = getRepositoryDao().selectByPrimaryKey(keys);
        if (null == result) {
            msg.setResult(EnError.NO_MATCH);
            return msg;
        }

        msg.setData(result);
        return msg;
    }

    @Override
    public Msg<T> selectOneByExample(T record, boolean distinct) {
        Msg<T> msg = new Msg<>();
        List<T> result;
        try {
            result = getRepositoryDao().selectByExampleWithBLOBs(record, true);
        } catch (Exception e) {
            result = getRepositoryDao().selectByExample(record, true);
        }
        if (null == result || result.isEmpty()) {
            msg.setResult(EnError.NO_MATCH);
            return msg;
        }

        if (result.size() > 1) {
            msg.setResult(EnError.NO_MATCH);
            msg.setMsg("获取到的数据大于1条");
            return msg;
        }

        msg.setData(result.get(0));
        return msg;
    }

    @Override
    public Msg<T> selectOneByExampleWithBLOBs(T record, boolean distinct) {
        Msg<T> msg = new Msg<>();
        List<T> result = getRepositoryDao().selectByExampleWithBLOBs(record, true);

        if (null == result || result.isEmpty()) {
            msg.setResult(EnError.NO_MATCH);
            return msg;
        }

        if (result.size() > 1) {
            msg.setResult(EnError.NO_MATCH);
            msg.setMsg("获取到的数据大于1条");
            return msg;
        }

        msg.setData(result.get(0));
        return msg;
    }

    @Override
    public Msg<T> selectOneByExample(T record) {
        return selectOneByExample(record, true);
    }

    @Override
    public Msg<List<T>> selectAllByExample(T record) {
        List<Order> orders = new ArrayList<>();
        orders.add(new Order("create_at", Order.Direction.DESC, ""));
        return selectAllByExample(record, orders);
    }

    @Override
    public Msg<List<T>> selectAllByExample(T record, List<Order> orders) {
        Msg<List<T>> msg = new Msg<>();
        Msg<PageList<T>> pageListMsg = new Msg<>();
        List<T> list = new ArrayList<>();
        int limit = 5000;
        PageBounds pageBounds = new PageBounds(1, limit);
        pageBounds.setOrders(orders);
        boolean doLoop = true;
        while (pageListMsg.getSuccess() && doLoop) {
            pageListMsg = selectByExampleByPager(record, pageBounds);
            if (pageListMsg.getSuccess()) {
                doLoop = pageListMsg.getData().size() >= limit;
                list.addAll(pageListMsg.getData());
            }

            pageBounds.setPage(pageBounds.getPage() + 1);
        }

        if (list.isEmpty()) {
            msg.setResult(EnError.NO_MATCH);
            return msg;
        }

        msg.setData(list);
        return msg;
    }

    @Override
    public Msg<PageList<T>> selectByExampleByPager(T record, PageBounds pageBounds) {
        Msg<PageList<T>> msg = new Msg<>();
        PageList<T> result = getRepositoryDao().selectByExampleByPager(record, pageBounds);
        if (result.isEmpty()) {
            msg.setResult(EnError.NO_MATCH);
            return msg;
        }

        msg.setData(result);
        return msg;
    }

    @Override
    public Msg<T> fuzzySearch(T record) {
        Msg<T> msg = new Msg<>();
        T result = getRepositoryDao().fuzzySearch(record);
        if (null == result) {
            msg.setResult(EnError.NO_MATCH);
            return msg;
        }

        msg.setData(result);
        return msg;
    }

    @Override
    public Msg<PageList<T>> fuzzySearchByPager(T record, PageBounds pageBounds) {
        Msg<PageList<T>> msg = new Msg<>();
        if (null == pageBounds.getOrders() || pageBounds.getOrders().isEmpty()) {
            List<Order> orders = new ArrayList<>();
            orders.add(new Order("create_at", Order.Direction.DESC, ""));
            pageBounds.setOrders(orders);
        }
        PageList<T> result = getRepositoryDao().fuzzySearchByPager(record, pageBounds);
        if (result.isEmpty()) {
            msg.setResult(EnError.NO_MATCH);
            return msg;
        }

        msg.setData(result);
        return msg;
    }

    @Override
    public void setCreateInfo(T record) {
        Date now = new Date();
        if (null == record.getCreateAt()) {
            record.setCreateAt(now);
        }
        record.setUpdateAt(now);
        if (StringUtils.isEmpty(record.getCreateBy())) {
            AppUserDetails user = ContextUtil.getCurrentUser();
            if (null != user) {
                if ("anonymousUser".equalsIgnoreCase(user.getUserId())) {
                    record.setCreateBy("0");
                } else {
                    record.setCreateBy(user.getUserId());
                }
            } else {
                record.setCreateBy("0");
            }
        }
    }

    @Override
    public void setUpdateInfo(T record) {
        record.setUpdateAt(new Date());
        if (StringUtils.isEmpty(record.getUpdateBy())) {
            AppUserDetails user = ContextUtil.getCurrentUser();
            if (null != user) {
                record.setUpdateBy(user.getUserId());
            } else {
                record.setUpdateBy("system");
            }
        }
    }
}
