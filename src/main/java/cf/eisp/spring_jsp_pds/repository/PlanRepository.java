package cf.eisp.spring_jsp_pds.repository;

import cf.eisp.spring_jsp_pds.model.CustomPlan2;
import cf.eisp.spring_jsp_pds.model.Plan;
import cf.eisp.spring_jsp_pds.model.CustomPlan1;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PlanRepository {
    Integer save(Plan plan);

    List<CustomPlan1> findAll();

    Integer delete(Integer planId);

    List<Plan> findByUsername(String username);

    CustomPlan2 findByPlanId(Integer planId);
}
