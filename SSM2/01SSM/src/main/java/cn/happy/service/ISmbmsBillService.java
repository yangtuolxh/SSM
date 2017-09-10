package cn.happy.service;

import cn.happy.util.PageUtil;

/**
 * Created by Administrator on 2017/9/8.
 */
public interface ISmbmsBillService {

     PageUtil selectBill(int pageIndex, int pageSize);
    int userCount();

}
