package cn.happy.service;

import cn.happy.dao.ClassesMapper;
import cn.happy.model.Classes;

import java.util.List;

/**
 * Created by Administrator on 2017/9/1.
 */
public class ClassesService implements IClassesService {
    ClassesMapper classesMapper;

    public ClassesMapper getClassesMapper() {
        return classesMapper;
    }

    public void setClassesMapper(ClassesMapper classesMapper) {
        this.classesMapper = classesMapper;
    }

    public List<Classes> selectClasses() {
        return classesMapper.selectClasses();
    }
}
