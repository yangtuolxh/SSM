package cn.happy.service;

import cn.happy.model.Classes;
import cn.happy.model.Faqs;

import java.util.List;

/**
 * Created by Administrator on 2017/9/1.
 */
public interface IFaqsService {
    List<Faqs> selectFaqs();
    List<Faqs> selectAFaqs(Classes classes);
    Faqs selectContent(Classes classes);
    int add(Faqs faqs);
}
