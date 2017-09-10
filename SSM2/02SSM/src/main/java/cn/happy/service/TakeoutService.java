package cn.happy.service;

import cn.happy.dao.TakeoutMapper;
import cn.happy.model.Takeout;

/**
 * Created by Administrator on 2017/8/27.
 */
public class TakeoutService implements ITakeoutService {
    TakeoutMapper takeoutMapper;

    public TakeoutMapper getTakeoutMapper() {
        return takeoutMapper;
    }

    public void setTakeoutMapper(TakeoutMapper takeoutMapper) {
        this.takeoutMapper = takeoutMapper;
    }

    public int addTakeout(Takeout takeout) {
        return takeoutMapper.addTakeout(takeout);
    }
}
