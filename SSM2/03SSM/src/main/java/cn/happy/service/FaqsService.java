package cn.happy.service;

import cn.happy.dao.FaqsMapper;
import cn.happy.model.Classes;
import cn.happy.model.Faqs;

import java.util.List;

/**
 * Created by Administrator on 2017/9/1.
 */
public class FaqsService implements IFaqsService {
    FaqsMapper faqsMapper;

    public FaqsMapper getFaqsMapper() {
        return faqsMapper;
    }

    public void setFaqsMapper(FaqsMapper faqsMapper) {
        this.faqsMapper = faqsMapper;
    }

    public List<Faqs> selectFaqs() {
        return faqsMapper.selectFaqs();
    }

    public List<Faqs> selectAFaqs(Classes classes) {
        return faqsMapper.selectAFaqs(classes);
    }

    public Faqs selectContent(Classes classes) {
        return faqsMapper.selectContent(classes);
    }

    public int add(Faqs faqs) {
        return faqsMapper.add(faqs);
    }
}
