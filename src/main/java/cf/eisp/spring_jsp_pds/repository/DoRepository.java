package cf.eisp.spring_jsp_pds.repository;

import cf.eisp.spring_jsp_pds.model.PlanDo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DoRepository {
    Integer save(PlanDo planDo);

    List<PlanDo> findAll();

    PlanDo findById(Integer planId);
    Integer update(PlanDo planDo);
    Integer delete(Integer planId);


}
