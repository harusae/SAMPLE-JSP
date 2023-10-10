package kr.co.wisenut.controller;

import kr.co.wisenut.entity.UserInfo;
import kr.co.wisenut.mapper.TestMapper;
import kr.co.wisenut.mapper.UserMapper;
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

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private TestService testService;

    @RequestMapping("/")
    public String home(Model model, Authentication auth) {
        int count = testService.getTest01Count();
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        logger.info("userDetails : {}", userDetails.toString());


        model.addAttribute("count", count);
        return "index";
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

    @RequestMapping("/test")
    public ModelAndView sample() {
        int count = testService.getTest01Count();

        ModelAndView view = new ModelAndView();
        view.addObject("count", count);
        view.setViewName("test/test");

        return view;
    }

    @RequestMapping(method= RequestMethod.POST, value="/sessionChk")
    @ResponseBody
    public ResponseEntity chk(Authentication auth){
        //logger.info("sessionChk : {}", auth.isAuthenticated());

        return new ResponseEntity(auth.isAuthenticated(), HttpStatus.OK);
    }
}
