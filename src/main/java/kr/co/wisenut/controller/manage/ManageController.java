package kr.co.wisenut.controller.manage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage")
public class ManageController {
    @RequestMapping("/menu")
    public String menu(Model model){
        return "manage/menu";
    }
    @RequestMapping("/menu/auth")
    public String menuAuth(Model model){
        return "manage/menuAuth";
    }
}
