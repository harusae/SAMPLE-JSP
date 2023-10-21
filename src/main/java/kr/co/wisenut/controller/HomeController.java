package kr.co.wisenut.controller;

import kr.co.wisenut.entity.*;
import kr.co.wisenut.mapper.TestMapper;
import kr.co.wisenut.mapper.UserMapper;
import kr.co.wisenut.service.DashboardService;
import kr.co.wisenut.service.TestService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private TestService testService;
    @Autowired
    private DashboardService dashboardService;

    @RequestMapping("/")
    public String home(Model model, Authentication auth) {
        int count = testService.getTest01Count();
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        logger.info("userDetails : {}", userDetails.toString());


        model.addAttribute("count", count);
        return "index";
    }

    @RequestMapping(method= RequestMethod.POST, value="/sessionChk")
    @ResponseBody
    public ResponseEntity chk(Authentication auth){
        //logger.info("sessionChk : {}", auth.isAuthenticated());

        return new ResponseEntity(auth.isAuthenticated(), HttpStatus.OK);
    }

    @RequestMapping("/home")
    public ModelAndView home() {
        Date date = new Date();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String now = format.format(date);


        ModelAndView view = new ModelAndView();
        view.addObject("now", now);
        view.setViewName("user/dashboard");

        return view;
    }
    @RequestMapping(method= RequestMethod.POST, value="/home/dashboard1")
    @ResponseBody
    public ResponseEntity getDashboard1List(@RequestParam HashMap<String, Object> param){

        List<DashboardInfo1> list = dashboardService.getDashboard1List(param);

        return new ResponseEntity(list, HttpStatus.OK);
    }
    @RequestMapping(method= RequestMethod.POST, value="/home/dashboard2")
    @ResponseBody
    public ResponseEntity getDashboard2List(@RequestParam HashMap<String, Object> param){

        List<DashboardInfo2> list = dashboardService.getDashboard2List(param);

        return new ResponseEntity(list, HttpStatus.OK);
    }
    @RequestMapping(method= RequestMethod.POST, value="/home/dashboard3")
    @ResponseBody
    public ResponseEntity getDashboard3List(@RequestParam HashMap<String, Object> param){

        List<DashboardInfo3> list = dashboardService.getDashboard3List(param);

        return new ResponseEntity(list, HttpStatus.OK);
    }
}
