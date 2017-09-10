package cn.happy.dao;

import cn.happy.model.SmbmsBill;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface SmbmsBillMapper {

   /*  public List<SmbmsBill> allUserList(@Param("uname")String uname, @Param("y") int y, @Param("t") int t);*/
   List<SmbmsBill> selectBill(Map<String,Object> map);
   //总记录数
/*    public int userCount(@Param("uname")String uname);*/
    int userCount();
}