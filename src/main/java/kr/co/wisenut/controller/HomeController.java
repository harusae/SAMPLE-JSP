package kr.co.wisenut.controller;

import kr.co.wisenut.mapper.TestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    @Autowired
    private TestMapper testMapper;


    @RequestMapping("/test")
    public String home(Model model) {
        int count = testMapper.getTest01Count();

        model.addAttribute("count", count);
        return "test/test";
    }

    @RequestMapping("/test1")
    public ModelAndView home() {
        int count = testMapper.getTest01Count();

        ModelAndView view = new ModelAndView();
        view.addObject("count", count);
        view.setViewName("test/test");

        return view;
    }
}
