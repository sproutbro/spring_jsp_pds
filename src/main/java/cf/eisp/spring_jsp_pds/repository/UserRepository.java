package cf.eisp.spring_jsp_pds.repository;

import cf.eisp.spring_jsp_pds.model.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {
    Integer save(User user);
    User findByUsername(String username);
}