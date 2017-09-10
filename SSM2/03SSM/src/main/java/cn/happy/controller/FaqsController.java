package cn.happy.controller;

import cn.happy.model.Classes;
import cn.happy.model.Faqs;
import cn.happy.service.IClassesService;
import cn.happy.service.IFaqsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoaderListener;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2017/9/1.
 */
@Controller
public class FaqsController {
    IFaqsService service= (IFaqsService) ContextLoaderListener.getCurrentWebApplicationContext().getBean("faqsService");
    IClassesService service1= (IClassesService) ContextLoaderListener.getCurrentWebApplicationContext().getBean("classesService");
    @RequestMapping("/selectFaqs")
    public String selectFaqs(HttpServletRequest request){
        List<Faqs> faqsList = service.selectFaqs();
        for (Faqs item: faqsList
             ) {
            System.out.println(item.getId()+"================================");
        }
        System.out.println();
        request.setAttribute("faqsList",faqsList);
        return "/jsp/show.jsp";
    }


}
