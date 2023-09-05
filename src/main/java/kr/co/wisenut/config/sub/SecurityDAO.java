package kr.co.wisenut.config.sub;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class SecurityDAO {
    @Autowired
    JdbcTemplate jt;

    public List<Map<String, Object>> getAuthReq(){
        return jt.query("select * from WISETM_MENU_INFO", (rs, rowNum) ->{
           Map<String, Object> aRow = new HashMap<>();
           aRow.put("id", rs.getInt(1));
            aRow.put("url", rs.getString(2));
            aRow.put("auth", rs.getString(3));
            aRow.put("date", rs.getString(4));
           return aRow;
        });
    }
}
