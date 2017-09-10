package cn.happy.service;

import cn.happy.dao.SmbmsUserMapper;
import cn.happy.model.SmbmsUser;

import java.util.List;

/**
 * Created by Administrator on 2017/8/22.
 */
public class SmbmsUserService implements ISmbmsUserService {

    SmbmsUserMapper smbmsUserMapper;


    public SmbmsUserMapper getSmbmsUserMapper() {
        return smbmsUserMapper;
    }

    public void setSmbmsUserMapper(SmbmsUserMapper smbmsUserMapper) {
        this.smbmsUserMapper = smbmsUserMapper;
    }

    public int isLogin(SmbmsUser smbmsUser) {
        return smbmsUserMapper.isLogin(smbmsUser);
    }

    public List<SmbmsUser> selectAll() {
        return smbmsUserMapper.selectAll();
    }

    public int addUser(SmbmsUser smbmsUser) {
        return smbmsUserMapper.addUser(smbmsUser);
    }

    public int deleteUser(int[] num) {
        return smbmsUserMapper.deleteUser(num);
    }

    public int updateUser(SmbmsUser smbmsUser) {
        return smbmsUserMapper.updateUser(smbmsUser);
    }

    public SmbmsUser aUser(int id) {
        return smbmsUserMapper.aUser(id);
    }



}
