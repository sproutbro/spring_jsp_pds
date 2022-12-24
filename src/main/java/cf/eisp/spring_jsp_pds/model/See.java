package cf.eisp.spring_jsp_pds.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class See {
    private Integer seeId;
    private Integer doId;
    private String seeMemo;
    private Timestamp seeDate;
}
