package com.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.entity.Checkout;
import com.entity.CustomerType;
import com.entity.LiveInfo;
import com.entity.ProductBill;
import com.entity.ReserveInfo;
import com.entity.RoomInfo;
import com.entity.RoomState;
import com.entity.RoomType;
import com.service.LiveInfoService;

@Controller
public class LiveInfoController {
    @Resource
    private LiveInfoService liveService;

    public LiveInfoService getLiveService() {
        return liveService;
    }

    public void setLiveService(LiveInfoService liveService) {
        this.liveService = liveService;
    }

    /**
     * 获取时间
     * @return
     */
    @RequestMapping("rdate")
    @ResponseBody
    public String Rdate() {
        SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sim.format(new Date());
        return time;
    }

    /**
     * 客人入住
     * @param model
     * @param req
     * @return
     */
    @RequestMapping("/insert")
    public String insert(Model model, HttpServletRequest req) {
        int y = -1;
        System.out.println(y);
        String liveId = req.getParameter("liveId");
        int room = Integer.parseInt(req.getParameter("roomId"));
        int liveMoney = Integer.parseInt(req.getParameter("liveMoney"));
        int customerTypeId = Integer.parseInt(req.getParameter("customerTypeId"));
        String customerName = req.getParameter("customerName");
        String customerSex = req.getParameter("customerSex");
        String cardType = req.getParameter("cardType");
        String cardId = req.getParameter("cardId");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        int liveNum = Integer.parseInt(req.getParameter("liveNum"));
        String liveTime = req.getParameter("liveTime");
        int liveDays = Integer.parseInt(req.getParameter("liveDays"));
        String payType = req.getParameter("payType");
        String mark = req.getParameter("mark");
        int userIdnumber = Integer.parseInt(req.getParameter("userIdnumber"));
        int state = Integer.parseInt(req.getParameter("state"));
        SimpleDateFormat df2 = new SimpleDateFormat("yyyyMMddHHmmss");
        String df = "RZ" + df2.format(new Date());

        String[] people = req.getParameterValues("roomId1");
        if (people == null) {
            LiveInfo li = new LiveInfo(df, room, liveMoney, customerTypeId, customerName, customerSex, cardType, cardId, phone, address, liveNum, liveTime, liveDays, payType, userIdnumber, mark, state);
            //添加登记表
            int liveIn = liveService.insert(li);
            if (liveIn > 0) {
                liveService.update(room);
            }
            model.addAttribute("liveInfo", liveIn);
        } else {
            LiveInfo lk = new LiveInfo(df, room, liveMoney, customerTypeId, customerName, customerSex, cardType, cardId, phone, address, liveNum, liveTime, liveDays, payType, userIdnumber, mark, state);
            //添加登记表
            int liveI = liveService.insert(lk);
            if (liveI > 0) {
                liveService.update(room);
            }
            model.addAttribute("liveInfo", liveI);
            int k = 1;
            for (int i = 0; i < people.length; i++) {
                String a = people[i].toString();
                String[] b = a.split(",");
                LiveInfo l = new LiveInfo(df + k, Integer.parseInt(b[0]), Integer.parseInt(b[1]), customerTypeId, customerName, customerSex, cardType, cardId, phone, address, liveNum, liveTime, liveDays, payType, userIdnumber, mark, state);
                //添加登记表
                int liveInfo = liveService.insert(l);
                //修改房态
                if (liveInfo > 0) {
                    liveService.update(Integer.parseInt(b[0]));
                }
                model.addAttribute("liveInfo", liveInfo);
                k++;
            }
        }
        return "redirect:showRoomIST";
    }


    //查询入住信息
    @RequestMapping("/selec")
    public String all(Model model, @RequestParam("roomId") int roomId, HttpServletRequest request) {
        List<LiveInfo> list = liveService.selectL(roomId);
        model.addAttribute("list", list);
        List<RoomInfo> room = liveService.selectType(roomId);
        model.addAttribute("room", room);
        String mm = null;//点击的时候存一个session
        for (LiveInfo liveInfo : list) {
            mm = liveInfo.getLiveId();
        }
        request.getSession().setAttribute("mm", mm);
        return "LiveInfoShow";//
    }

    //续房缴费
    @RequestMapping("/insertXu")
    public String insertXu(Model model, LiveInfo liveInfo) {
        int ru = liveService.insertXu(liveInfo);
        model.addAttribute("ru", ru);
        return "redirect:showRoomIST";

    }


    //客人预订页面
    @RequestMapping("/TongFu")
    public String ReserveInfoShow(Model m) {
        //获取房间类型
        List<RoomType> rtype = liveService.selectS();
        m.addAttribute("rtype", rtype);
        //预订编号
        SimpleDateFormat df2 = new SimpleDateFormat("yyyyMMddHHmmss");
        String df = "YD" + df2.format(new Date());
        m.addAttribute("df", df);
        //预定时间
        SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sim.format(new Date());
        m.addAttribute("time", time);
        //客户类型
        List<CustomerType> ctype = liveService.select();
        m.addAttribute("ctype", ctype);
        return "Reserve";
    }

    //post获取房间信息
    @RequestMapping("findRoomInfoReserve")
    @ResponseBody
    public List<RoomInfo> findRoomInfoReserve(@RequestParam("roomtypeId") int roomtypeId) {
        List<RoomInfo> listRoom = liveService.findRoomInfoByIdS(roomtypeId);
        return listRoom;
    }

    //修改房间状态
    @RequestMapping("/updat")
    public String updateR(Model model, RoomInfo roominfo, int roomId) {
        int result = liveService.updateR(roominfo);
        if (result > 0) {
            liveService.delete(roomId);
        }
        model.addAttribute("result", result);
        return "redirect:showRoomIST";
    }

    //修改房态
    @RequestMapping("/sess")
    public void sessi(HttpServletRequest request) {
        int roomid = Integer.parseInt(request.getParameter("roomId"));
        request.getSession().setAttribute("roomid", roomid);
        List<RoomState> list = liveService.selectRoom();
        request.getSession().setAttribute("list", list);
        List<RoomState> rs = liveService.selectRoomA(roomid);
        request.getSession().setAttribute("rs", rs);
    }

    //录入预定信息
    @RequestMapping("reserveBook1")
    @Transactional//事物注解
    public String insertReser(Model model, ReserveInfo reser, int roomId) {
        int result = liveService.insertReser(reser);
        if (result > 0) {
            liveService.updateRe(roomId);
        }
        model.addAttribute("reser", reser);
        return "ReserveYu";
    }

    //查询预订信息
    @RequestMapping("/findAllReserve")
    public String findAllReserve(Model model) {
        List<ReserveInfo> list = liveService.selectReser();
        model.addAttribute("list", list);
        return "ReserveInfo";
    }

    //根据id查找bookReserve
    @RequestMapping("/bookReserve")
    public String bookReserve(Model model, @RequestParam("roomId") int roomId) {
        //入住单号
        SimpleDateFormat df2 = new SimpleDateFormat("yyyyMMddHHmmss");
        String df = "RZ" + df2.format(new Date());
        model.addAttribute("df", df);
        //查询预定信息
        ReserveInfo list = liveService.selectReserById(roomId);
        model.addAttribute("list", list);
        //入住日期
        SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH:ss:mm");
        String time = sim.format(new Date());
        model.addAttribute("time", time);
        //获取客户类型
        List<CustomerType> custo = liveService.select();
        model.addAttribute("custo", custo);
        return "ReserveLiveinfo";
    }


    //修改预抵为已住
    @RequestMapping("/ReserXiu")
    public String ReserXiu(Model model, int roomId, LiveInfo live) {
        int result = liveService.update(roomId);
        if (result > 0) {
            liveService.delete(roomId);
            liveService.insertLive(live);
        }
        model.addAttribute("result", result);
        return "redirect:showRoomIST";
    }

    //删除预定
    @RequestMapping("/shan")
    public String shan(Model model, int roomId) {
        int result = liveService.delete(roomId);
        if (result > 0) {
            liveService.updateJing(roomId);
        }
        return "redirect:showRoomIST";
    }

    //退房
    @RequestMapping("/tui")
    public String tui(Model model, int roomId) {
        List<LiveInfo> list = liveService.selectLiveInfo(roomId);
        List<RoomInfo> room = liveService.selectOne(roomId);
        SimpleDateFormat df2 = new SimpleDateFormat("yyyyMMddHHmmss");
        SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dfe = sim.format(new Date());
        String df = "JS" + df2.format(new Date());
        model.addAttribute("dfe", dfe);
        model.addAttribute("df", df);
        model.addAttribute("list", list);
        model.addAttribute("room", room);
        return "LiveInfo";
    }

    @RequestMapping("/jie")
    public String jie(Model model, Checkout checkOut, int roomId) {
        System.out.println("-----------------进入结算Controller------------------------");
        int result = liveService.insertCheck(checkOut);
        if (result > 0) {
            liveService.updateZang(roomId);
            liveService.updateBiao(roomId);
            SimpleDateFormat df3 = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat df2 = new SimpleDateFormat("yyyyMMddHHmmss");
            //新建一个时间
            String time3 = df3.format(new Date());
            //获取结账的房费总额
            int jainMoney = checkOut.getMoney();
            //操作人id 后期在session中获取
            int userId = checkOut.getUserId();
            System.out.println("-------------" + userId + "---------------");
            //先根据时间查询，今天是否已经存在盈利记录
            List<ProductBill> list5 = liveService.SelectProductBill(time3);
            //如果已经存在就实现修改，佛则就录入盈利记录
            if (list5.size() != 0) {
                ProductBill bill = new ProductBill(jainMoney, time3);
                //创建一个修改+=盈利的实体对象
                liveService.UpdateProductBill(bill);
            } else {
                //生成盈利编号
                String billId = "bill" + df2.format(new Date());
                //创建一个盈利的实体对象
                ProductBill bill = new ProductBill(billId, userId, jainMoney, time3);
                liveService.InsertProductBill(bill);
            }
				/*List<ProductBill> list6=liveService.SelectProductBill(time3);
				for (ProductBill productBill : list6) {
					System.out.println(productBill.getJainMoney());//获取到数据的盈利值，以后存session
				}*/
        }
        model.addAttribute("result", result);
        return "redirect:showRoomIST";

    }


    //根据房间号查出入住信息传到换房页面
    @RequestMapping("/findByRoomId")
    public String findByRoomId(Model model, @RequestParam("roomId") int roomId) {
        //入住信息
        List<LiveInfo> listLiveInfo = liveService.selectL(roomId);
        model.addAttribute("listLiveInfo", listLiveInfo);
        //入住的房间类型
        List<RoomInfo> room = liveService.selectType(roomId);
        model.addAttribute("room", room);
        //房间信息
        List<RoomType> rtype = liveService.selectS();
        model.addAttribute("rtype", rtype);
        return "updateLiveInfo";
    }

    //根据房间类型查找对应的空房间
    @RequestMapping("IdMoney")
    @ResponseBody
    public List<RoomInfo> findRoomInfoReserve1(@RequestParam("roomtypeId") int roomtypeId) {
        List<RoomInfo> listRoom = liveService.findRoomInfoByIdS(roomtypeId);
        return listRoom;
    }

    @RequestMapping("findRtypeById")
    @ResponseBody
    public RoomType findRoomtype(@RequestParam("roomTypeId") int roomTypeId) {
        RoomType Roomtype = liveService.findRTypeByIdS(roomTypeId);
        return Roomtype;
    }


    //换房
    @Transactional
    @RequestMapping("/updateLive")
    public String updateLive(Model model, LiveInfo live, int roomId, int newRoomId) {
        int result = liveService.updateLive(live);
        if (result > 0) {
            //修改房间状态
            liveService.updateZang(roomId);
            //新房间
            liveService.update(newRoomId);
        }
        model.addAttribute("result", result);
        return "redirect:showRoomIST";
    }

    //在住客人
    @RequestMapping("/live")
    @ResponseBody
    public String live(HttpServletRequest request, @RequestParam int page, @RequestParam int rows) throws JsonGenerationException, JsonMappingException, IOException {
        Map<String, Object> map = new HashMap<String, Object>();
        int pageNumber = page == 0 ? 1 : page;
        int pageSize = rows;
        int a = (pageNumber - 1) * pageSize;
        int b = pageSize * pageNumber;
        map.put("a", a);
        map.put("b", b);
        String customerName = request.getParameter("spendName");
        map.put("customerName", customerName);
        int total = liveService.total(map);//查询总条数
        List<LiveInfo> list = liveService.selectLiveInfoS(map);
        Map<String, Object> json = new HashMap<String, Object>();
        json.put("total", total);
        json.put("rows", list);
        String str = "";
        ObjectMapper om = new ObjectMapper();//json
        str = om.writeValueAsString(json);
        return str;
    }

    //结算查询
    @RequestMapping("/checkSelect")
    @ResponseBody
    public String checkSelect(HttpServletRequest request, @RequestParam int page, @RequestParam int rows) throws JsonGenerationException, JsonMappingException, IOException {
        Map<String, Object> map = new HashMap<String, Object>();
        int pageNumber = page == 0 ? 1 : page;
        int pageSize = rows;
        int a = (pageNumber - 1) * pageSize;
        int b = pageSize * pageNumber;
        map.put("a", a);
        map.put("b", b);
        String checkId = request.getParameter("checkId");
        String liveId = request.getParameter("liveId");
        String customername = request.getParameter("customername");

        map.put("checkId", checkId);
        map.put("liveId", liveId);
        map.put("customername", customername);
        int total = liveService.totalComm(map);//查询总条数
        List<Checkout> list = liveService.checkSelect(map);
        Map<String, Object> json = new HashMap<String, Object>();
        json.put("total", total);
        json.put("rows", list);
        String str = "";
        ObjectMapper om = new ObjectMapper();
        str = om.writeValueAsString(json);
        return str;


    }


}
