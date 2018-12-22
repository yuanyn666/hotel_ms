package com.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Bad;
import com.entity.BreakDetai;
import com.entity.CustomerBreak;
import com.entity.LiveInfo;
import com.service.ProductSalService;

/**
 * 损坏
 */
@Controller
public class BreakDown {
    @Resource
    private ProductSalService service;

    public ProductSalService getService() {
        return service;
    }

    public void setService(ProductSalService service) {
        this.service = service;
    }

    /**
     * 先创建损坏的单号
     *
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/Break")
    public String Selectt(Model model, HttpServletRequest request) {
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        String Spend = "Break" + df.format(new Date());
        model.addAttribute("Spned", Spend);
        //先假想一个损坏房间
        String liviid = request.getParameter("roomId");
        String name = null;//保存损坏人姓名
        List<LiveInfo> list = service.SelectLiveInfo(liviid);
        for (LiveInfo liveInfo : list) {
            name = liveInfo.getCustomerName();
        }
        model.addAttribute("name", name);
        model.addAttribute("liveid", liviid);
        return "BreakDown";
    }

    /**
     * 先录入总表
     *
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/InsertBreak")
    public String InsertSpend(Model model, HttpServletRequest request) {
        //单号
        String Spnedid = request.getParameter("Spnedid");
        //房间号
        String liveid = request.getParameter("liveid");
        //备注
        String mark = request.getParameter("mark");
        //操作人
        int userId = Integer.parseInt(request.getParameter("userId"));
        //获取所有损坏物品
        String[] productId = request.getParameterValues("productId");
        //所有价格
        String[] sum = request.getParameterValues("productName");
        service.zonr2(Spnedid, liveid, mark, userId, productId, sum);
        return "SerchBreak";

    }

    /**
     * 所有的损坏记录查询
     *
     * @param request
     * @param page
     * @param rows
     * @return
     * @throws JsonGenerationException
     * @throws JsonMappingException
     * @throws IOException
     */
    @RequestMapping("/SerchBreak")
    @ResponseBody
    public String SerchBreak(HttpServletRequest request, @RequestParam int page, @RequestParam int rows) throws JsonGenerationException, JsonMappingException, IOException {
        Map<String, Object> map = new HashMap<String, Object>();
        int pageNumber = page == 0 ? 1 : page;
        int pageSize = rows;
        int a = (pageNumber - 1) * pageSize;
        int b = pageSize * pageNumber;
        map.put("a", a);
        map.put("b", b);
        String spendId = request.getParameter("spendId");
        String liveId = request.getParameter("liveId");
        String spendName = request.getParameter("spendName");
        String begin = request.getParameter("begin");
        String end = request.getParameter("end");
        if (begin == "" && end != "") {
            begin = "2016-01-01";
        }
        if (begin != "" && end == "") {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String time = df.format(new Date());
            end = time;
        }
        map.put("spendId", spendId);
        map.put("liveId", liveId);
        map.put("spendName", spendName);
        map.put("begin", begin);
        map.put("end", end);
        //查询总条数
        int total = service.totalComm2(map);
        List<CustomerBreak> list = service.SerchBreakChar(map);
        Map<String, Object> json = new HashMap<String, Object>();
        json.put("total", total);
        json.put("rows", list);
        String str = "";
        //json
        ObjectMapper om = new ObjectMapper();
        str = om.writeValueAsString(json);
        return str;
    }


    /**
     * 查看细的损坏
     *
     * @param request
     * @return
     */
    @RequestMapping("/SerchBreakInfo")
    @ResponseBody
    public List<BreakDetai> SerchBreakInfo(HttpServletRequest request) {
        //ObjectMapper om=new ObjectMapper();//转换json对象
        String spendId = request.getParameter("spendId");
        List<BreakDetai> list = service.SerchBreakInfo(spendId);
        return list;
    }

    /**
     * 查看损坏
     *
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("/SelectBad")
    @ResponseBody
    public List<Bad> SelectBad(HttpServletResponse response, HttpServletRequest request) {
        String name = request.getParameter("name");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("name", name);
        List<Bad> list = service.SelectBad(map);
        return list;
    }

    /**
     * 查看损坏
     *
     * @param request
     * @param page
     * @param rows
     * @return
     * @throws JsonGenerationException
     * @throws JsonMappingException
     * @throws IOException
     */
    @RequestMapping("/SelectBad2")
    @ResponseBody
    public String SelectBad2(HttpServletRequest request, @RequestParam int page, @RequestParam int rows) throws JsonGenerationException, JsonMappingException, IOException {
        //ObjectMapper om=new ObjectMapper();//转换json对象
        Map<String, Object> map = new HashMap<String, Object>();
        String q = request.getParameter("q");
        int pageNumber = page == 0 ? 1 : page;
        int pageSize = rows;
        int a = (pageNumber - 1) * pageSize;
        int b = pageSize * pageNumber;
        map.put("a", a);
        map.put("b", b);
        map.put("name", q);
        List<Bad> list = service.SelectBad2(map);
        //查询总条数
        int total = service.totalComm4(map);
        Map<String, Object> json = new HashMap<String, Object>();
        json.put("total", total);
        json.put("rows", list);
        String str = "";
        ObjectMapper om = new ObjectMapper();
        str = om.writeValueAsString(json);
        return str;
    }

    /**
     * 查看某一个房间的损坏
     * @param request
     * @return
     */
    @RequestMapping("/SerchBreakById")
    @ResponseBody
    public List<CustomerBreak> SerchBreakById(HttpServletRequest request) {
        String aa = (String) request.getSession().getAttribute("mm");
        List<CustomerBreak> list = service.SerchBreakById(aa);
        return list;
    }

    /**
     * 损坏的基表操作
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/AddBad")//
    @ResponseBody
    public List<Bad> AddBad(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<String, Object>();
        String yin = request.getParameter("yin");
        String badName = request.getParameter("badName");
        int money = Integer.parseInt(request.getParameter("money"));
        String name = request.getParameter("name");
        map.put("name", name);
        List<Bad> list = new ArrayList<Bad>();
        if (yin.equals("add")) {
            Bad bad = new Bad(badName, money);
            if (service.AddBad(bad) > 0) {
                list = service.SelectBad(map);
            }
        }
        if (yin.equals("update")) {
            int badId = Integer.parseInt(request.getParameter("badId"));
            Bad bad = new Bad(badId, badName, money);
            if (service.UpdateBad(bad) > 0) {
                list = service.SelectBad(map);
            }
        }
        if (yin.equals("delete")) {
            int badId = Integer.parseInt(request.getParameter("badId"));
            if (service.deleteBad(badId) > 0) {
                list = service.SelectBad(map);
            }
        }
        list = service.SelectBad(map);
        return list;
    }

}
