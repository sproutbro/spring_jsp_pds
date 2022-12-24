package cf.eisp.spring_jsp_pds.repository;

import cf.eisp.spring_jsp_pds.model.CustomReply1;
import cf.eisp.spring_jsp_pds.model.Reply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReplyRepository {

    Integer save(CustomReply1 reply);

    List<Reply> findByPlanId(Integer planId);

    void deleteReply(Integer replyId);

    Reply findByReplyId(Integer intReplyId);

    void deleteByPlanId(Integer planId);
}
