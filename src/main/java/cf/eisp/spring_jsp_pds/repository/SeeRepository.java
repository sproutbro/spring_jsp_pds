package cf.eisp.spring_jsp_pds.repository;

import cf.eisp.spring_jsp_pds.model.Plan;
import cf.eisp.spring_jsp_pds.model.See;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SeeRepository {
    void save(See see);

    void deleteByPlanId(Integer planId);

    List<Plan> findByUsername(String username);
}
