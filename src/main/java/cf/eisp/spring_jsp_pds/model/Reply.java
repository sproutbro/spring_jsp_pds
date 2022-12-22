package cf.eisp.spring_jsp_pds.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class Reply {
    private Integer replyId;
    private Integer planId;
    private String username;
    private String replyMemo;
    private Timestamp replyDate;
    private String replyPassword;
}
