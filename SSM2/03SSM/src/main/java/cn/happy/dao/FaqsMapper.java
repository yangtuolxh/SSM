package cn.happy.dao;

import cn.happy.model.Classes;
import cn.happy.model.Faqs;

import java.util.List;

public interface FaqsMapper {
  List<Faqs> selectFaqs();
  List<Faqs> selectAFaqs(Classes classes);
  Faqs selectContent(Classes classes);
  int add(Faqs faqs);
}