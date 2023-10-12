package kr.co.wisenut.controller.manage;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.co.wisenut.config.sub.AES256;
import kr.co.wisenut.config.sub.SHA256;
import kr.co.wisenut.service.MenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
    @RequestMapping("/user")
    public String user(Model model){
        /*
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        logger.info("bcrypt encode : {}", bCryptPasswordEncoder.encode("test1"));
        try{
            SHA256 encoder = new SHA256();
            logger.info("encoder encode : {}", encoder.encode("test1"));
            logger.info("compare : {}",  encoder.matches("test1","1B4F0E9851971998E732078544C96B36C3D01CEDF7CAA332359D6F1D83567014"));
        }
        catch(Exception e){
            e.printStackTrace();
        }

        AES256 aes256 = new AES256();
        logger.info("aes256 test1 : {}", aes256.encode("test1"));
        */


        return "manage/user";
    }
    @RequestMapping("/keyword")
    public String keyword(Model model){
        return "manage/keyword";
    }
}
