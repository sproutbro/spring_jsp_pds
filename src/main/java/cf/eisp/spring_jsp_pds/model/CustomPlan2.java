package cf.eisp.spring_jsp_pds.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CustomPlan2 {
    private Integer planId;
    private String username;
    private String planPrivate;
    private String planTitle;
    private Timestamp planRegDate;
    private Timestamp planEndDate;
    private String planMemo;
    private String planCategory;
    private Integer doId;
    private String doState;
    private Timestamp doDate;
    private String seeMemo;
    private Timestamp seeDate;
}
