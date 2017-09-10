package cn.happy.dao;

import cn.happy.model.SmbmsUser;

import java.util.List;

public interface SmbmsUserMapper {
   int isLogin(SmbmsUser smbmsUser);
   List<SmbmsUser> selectAll();
   int addUser(SmbmsUser smbmsUser);
   int deleteUser(int[] num);
   int updateUser(SmbmsUser smbmsUser);
   SmbmsUser aUser(int id);

}