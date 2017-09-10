package cn.happy.service;

import cn.happy.dao.SmbmsBillMapper;
import cn.happy.model.SmbmsBill;

import cn.happy.util.PageUtil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/9/8.
 */
public class SmbmsBillService implements ISmbmsBillService {
    SmbmsBillMapper smbmsBillMapper;

    public SmbmsBillMapper getSmbmsBillMapper() {
        return smbmsBillMapper;
    }

    public void setSmbmsBillMapper(SmbmsBillMapper smbmsBillMapper) {
        this.smbmsBillMapper = smbmsBillMapper;
    }



    public PageUtil selectBill(int pageIndex, int pageSize) {
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("pageIndex",pageIndex*pageSize);
        map.put("pageSize",pageSize);

        PageUtil page=new PageUtil(); //实例化一个PageUtil对象
        page.setPageSize(pageSize); //给PageUtil属性赋值
        page.setPageIndex(pageIndex);//给PageUtil的pageIndex赋值
        //
        int totalCount = smbmsBillMapper.userCount();
        page.setTotalRecords(totalCount);

        int totalPages=page.getTotalRecords()%page.getPageSize()==0?page.getTotalRecords()/page.getPageSize():page.getTotalRecords()/page.getPageSize()+1;
        page.setTotalPages(totalPages);
        //为什么dao层方法的入参我写成map？？？
        List<SmbmsBill> list = smbmsBillMapper.selectBill(map);
        page.setList(list);
        return page;
    }

    public int userCount() {
        return smbmsBillMapper.userCount();
    }


}
