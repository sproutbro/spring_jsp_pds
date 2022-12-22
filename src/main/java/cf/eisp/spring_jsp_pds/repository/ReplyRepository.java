package cf.eisp.spring_jsp_pds.repository;

import cf.eisp.spring_jsp_pds.model.Reply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReplyRepository {

    Integer save(Reply reply);

    List<Reply> findByPlanId(Integer planId);
}
