package kr.co.wisenut.controller;

import kr.co.wisenut.entity.UserInfo;
import kr.co.wisenut.mapper.TestMapper;
import kr.co.wisenut.mapper.UserMapper;
import kr.co.wisenut.service.TestService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@Controller
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
        return "home";
    }

    @RequestMapping("/test")
    public ModelAndView home() {
        int count = testService.getTest01Count();

        //HashMap<String, Object> map = testService.getLoginInfo();
        //logger.info("getLoginInfo : {}", map);

        ModelAndView view = new ModelAndView();
        view.addObject("count", count);
        view.setViewName("test/test");

        return view;
    }
}
