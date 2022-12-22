package cf.eisp.spring_jsp_pds.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class User {
    private String username;
    private String password;
    private Timestamp userRegDate;
}
