package kr.co.wisenut.controller.manage;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.co.wisenut.service.MenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/manage")
public class ManageController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    ObjectMapper mapper = new ObjectMapper();

    @Autowired
    private MenuService menuService;

    @RequestMapping("/menu")
    public String menu(Model model){
        return "manage/menu";
    }
    @RequestMapping("/menu/auth")
    public String menuAuth(Model model){
        return "manage/menuAuth";
    }
}
