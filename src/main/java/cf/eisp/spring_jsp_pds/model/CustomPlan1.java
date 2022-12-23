package cf.eisp.spring_jsp_pds.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CustomPlan1 {
    private Integer planId;
    private String planTitle;
    private Timestamp planRegDate;
    private Timestamp planEndDate;
    private String doState;
    private Integer seeId;
    private Integer replyCount;
}
