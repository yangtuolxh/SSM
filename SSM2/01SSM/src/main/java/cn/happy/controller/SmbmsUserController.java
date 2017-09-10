package cn.happy.controller;

import cn.happy.model.SmbmsBill;
import cn.happy.model.SmbmsUser;
import cn.happy.service.ISmbmsBillService;
import cn.happy.service.ISmbmsUserService;
import cn.happy.util.PageUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoaderListener;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/8/22.
 */

@Controller
public class SmbmsUserController {

    ISmbmsUserService service= (ISmbmsUserService) ContextLoaderListener.getCurrentWebApplicationContext().getBean("smbmsUserService");
    ISmbmsBillService service1= (ISmbmsBillService) ContextLoaderListener.getCurrentWebApplicationContext().getBean("smbmsBillService");
    @RequestMapping("/billShow")
    public String userShow() {
        return "/super/jsp/billList.jsp";
    }


    @ResponseBody
    @RequestMapping("/getUserInfo")
    public Object getuser(@RequestParam(defaultValue = "1") int pageIndex, @RequestParam(defaultValue = "1") int pageSize) {


        System.out.println(pageIndex);
        PageUtil page= service1.selectBill(pageIndex, pageSize);
        List<SmbmsBill> bills = page.getList();
        for (SmbmsBill item:bills) {
            System.out.println("123"+item.getBillcode());
            System.out.println("123"+item.getProductname());
        }
        return page;
    }
    @RequestMapping("/first")
    public String isLogin(SmbmsUser smbmsUser){
         String path=null;

        int login = service.isLogin(smbmsUser);
        if (login>0){
            path="/super/jsp/welcome.jsp";
        }else {
            path="/jsp/login.jsp";
        }
      return path;
    }

    @RequestMapping("/select")
    public Object selectAll(HttpServletRequest request, @RequestParam(value ="pn",defaultValue = "1")int pn){

        PageHelper.startPage(pn, 2);
        List<SmbmsUser> smbmsUsers = service.selectAll();
        for (SmbmsUser item:smbmsUsers
             ) {
            System.out.println(item.getPhone());
        }

        PageInfo<SmbmsUser> pageInfo = new PageInfo<SmbmsUser>(smbmsUsers);
        long total = pageInfo.getTotal(); //获取总记录数
        int pageNum = pageInfo.getPageNum();

        int lastPage = pageInfo.getLastPage();

        System.out.println("总记录数：" + total);
        System.out.println("当前页数：" + pageNum);
        System.out.println("共多少页：" + lastPage);

        request.setAttribute("page",smbmsUsers);
        request.setAttribute("pageNum",pageNum);
        request.setAttribute("lastPage",lastPage);
        request.setAttribute("pageTotal",total);
        return   "/super/jsp/userList.jsp";
    }

    //ajax添加
    @ResponseBody
    @RequestMapping("/addUser")
    public Object addUser(HttpServletRequest request, HttpServletResponse response) throws ParseException {
        String userCode = request.getParameter("usercode");
        System.out.println(userCode);
    String userName = request.getParameter("username");
        String userPassword = request.getParameter("userpassword");
        Integer gender =Integer.parseInt(request.getParameter("gender"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date birthday = sdf.parse(request.getParameter("birthday"));
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Integer userType = Integer.parseInt(request.getParameter("usertype"));
        String path=null;
        SmbmsUser smbmsUser=new SmbmsUser();
        smbmsUser.setUsercode(userCode);
        smbmsUser.setUsername(userName);
        smbmsUser.setUserpassword(userPassword);
        smbmsUser.setGender(gender);

        smbmsUser.setBirthday(birthday);
        smbmsUser.setPhone(phone);
        smbmsUser.setAddress(address);
        smbmsUser.setUsertype(userType);

        int i = service.addUser(smbmsUser);
        //response.getWriter().print("获取成功");

        if (i>0){
            path="success";
        }
        else{
            path="fail";
        }
        return  path;
    }



    //批量删除
    @ResponseBody
    @RequestMapping("/deleteUser")
    public Object deleteUser(HttpServletRequest request, HttpServletResponse response){
        String path=null;
        String vars = request.getParameter("vars");

        System.out.println(vars+"a");
        String [] vals=vars.split(",");
        System.out.println(vals.length+"b");
        int[] num=new int[vals.length];
        for (int i = 0; i < num.length; i++) {
            num[i]=Integer.parseInt(vals[i]);
        }
        int i = service.deleteUser(num);

        if (i>0){
            path="success";
        }
        else{
            path="fail";
        }
        return path;
    }


    @ResponseBody
    @RequestMapping("/updateUser")
    public Object updateUser(HttpServletRequest request, HttpServletResponse response) throws ParseException {
        Long id = Long.parseLong(request.getParameter("id"));
        String userCode = request.getParameter("usercode");
        System.out.println(userCode);
        String userName = request.getParameter("username");
        String userPassword = request.getParameter("userpassword");
        Integer gender =Integer.parseInt(request.getParameter("gender"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date birthday = sdf.parse(request.getParameter("birthday"));
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Integer userType = Integer.parseInt(request.getParameter("usertype"));
        String path=null;
        SmbmsUser smbmsUser=new SmbmsUser();
        smbmsUser.setId(id);
        smbmsUser.setUsercode(userCode);
        smbmsUser.setUsername(userName);
        smbmsUser.setUserpassword(userPassword);
        smbmsUser.setGender(gender);

        smbmsUser.setBirthday(birthday);
        smbmsUser.setPhone(phone);
        smbmsUser.setAddress(address);
        smbmsUser.setUsertype(userType);


        int i = service.updateUser(smbmsUser);
        //response.getWriter().print("获取成功");

        if (i>0){
            path="success";
        }
        else{
            path="fail";
        }
        return  path;
    }
    @RequestMapping("/aUser")
    public String aUser(HttpServletRequest request){

        int id= Integer.parseInt(request.getParameter("id"));
        SmbmsUser smbmsUser = service.aUser(id);
   request.setAttribute("smbmsUser",smbmsUser);
return "/super/jsp/userUpdate.jsp";
    }


}
