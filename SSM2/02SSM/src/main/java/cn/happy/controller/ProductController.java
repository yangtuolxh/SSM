package cn.happy.controller;

import cn.happy.model.Product;
import cn.happy.model.Takeout;
import cn.happy.service.IProductService;
import cn.happy.service.ITakeoutService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoaderListener;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/8/27.
 */
@Controller
public class ProductController {
    IProductService service=(IProductService) ContextLoaderListener.getCurrentWebApplicationContext().getBean("productService");
    ITakeoutService service1= (ITakeoutService) ContextLoaderListener.getCurrentWebApplicationContext().getBean("takeoutService");
    @RequestMapping("/selectProduct")
    public String selectProduct(HttpServletRequest request){
        List<Product> products = service.selectProduct();
        request.setAttribute("products",products);
        return "/jsp/select.jsp";
    }
    @RequestMapping("/skipAdd")
    public String skipAdd(HttpServletRequest request){
        List<Product> products = service.selectProduct();
        request.setAttribute("products",products);
        return "/jsp/add.jsp";
    }
    @ResponseBody
    @RequestMapping("/addTakeout")
    public Object addTakeout(HttpServletRequest request) throws ParseException {
        String path=null;

        Integer productid = Integer.parseInt(request.getParameter("productname"));
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

        Date outdate = sdf.parse(request.getParameter("outdate"));
        Long quantity=Long.parseLong( request.getParameter("quantity"));
        String handler= request.getParameter("handler");
       //获取库存
        Product product = service.selectAProduct(productid);
        Long quantity1 = product.getQuantity();
        //判断库存大小
        Long count=quantity1-quantity;
        //库存容量足够
        if (count>=0){
            //减少库存
            Product product1=new Product();
            product1.setId(productid);
            product1.setQuantity(quantity);
            int i1 = service.updateProduct(product1);
            Takeout takeout=new Takeout();
            takeout.setHandler(handler);
            takeout.setOutdate(outdate);
            takeout.setProductid(productid);
            takeout.setQuantity(quantity);
            System.out.println(outdate);
            int i= service1.addTakeout(takeout);
            if (i>0){
                path="成功";
            }else {
                path="fail";
            }
        }else {
            path="Insufficient stock capacity";
        }


        return path;
    }
}
