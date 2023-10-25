package kr.co.wisenut.controller.user;

import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequiredArgsConstructor
public class UserController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping("/searchAll")
    public ModelAndView searchAll() {

        ModelAndView view = new ModelAndView();
        view.setViewName("user/searchAll");

        return view;
    }

    @RequestMapping("/realtimeKeyword")
    public ModelAndView realtimeKeyword() {

        ModelAndView view = new ModelAndView();
        view.setViewName("user/realtimeKeyword");

        return view;
    }

    @RequestMapping("/interestKeyword")
    public ModelAndView interestKeyword() {

        ModelAndView view = new ModelAndView();
        view.setViewName("user/interestKeyword");

        return view;
    }

    @RequestMapping("/analysisState")
    public ModelAndView analysisState() {

        ModelAndView view = new ModelAndView();
        view.setViewName("user/analysisState");

        return view;
    }

    @RequestMapping("/negativeCall")
    public ModelAndView negativeCall() {

        ModelAndView view = new ModelAndView();
        view.setViewName("user/negativeCall");

        return view;
    }

    @RequestMapping("/negativeCall2")
    public ModelAndView negativeCall2() {

        ModelAndView view = new ModelAndView();
        view.setViewName("user/negativeCall2");

        return view;
    }

    @RequestMapping("/negativeKeyword")
    public ModelAndView negativeKeyword() {

        ModelAndView view = new ModelAndView();
        view.setViewName("user/negativeKeyword");

        return view;
    }

    @RequestMapping("/myPage")
    public ModelAndView myPage() {

        ModelAndView view = new ModelAndView();
        view.setViewName("user/myPage");

        return view;
    }
}
