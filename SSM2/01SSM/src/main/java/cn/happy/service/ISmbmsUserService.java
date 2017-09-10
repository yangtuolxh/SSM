package cn.happy.service;

import cn.happy.model.SmbmsUser;

import java.util.List;

/**
 * Created by Administrator on 2017/8/22.
 */
public interface ISmbmsUserService {
    int isLogin(SmbmsUser smbmsUser);
    List<SmbmsUser> selectAll();
    int addUser(SmbmsUser smbmsUser);
    int deleteUser(int[] num);
    int updateUser(SmbmsUser smbmsUser);
    SmbmsUser aUser(int id);

}
