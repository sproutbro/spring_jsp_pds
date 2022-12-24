package cf.eisp.spring_jsp_pds.controller;

import cf.eisp.spring_jsp_pds.model.CustomPlan2;
import cf.eisp.spring_jsp_pds.model.CustomReply1;
import cf.eisp.spring_jsp_pds.model.Reply;
import cf.eisp.spring_jsp_pds.repository.PlanRepository;
import cf.eisp.spring_jsp_pds.repository.ReplyRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;

@Controller
@AllArgsConstructor
@RequestMapping("/reply")
public class ReplyController {

    private ReplyRepository replyRepository;
    private PlanRepository planRepository;
    @PostMapping({"/", ""})
    public String reply(CustomReply1 reply, Principal principal) {
        String username = principal.getName();
        reply.setUsername(username);
        replyRepository.save(reply);
        return "redirect:/detail/" + reply.getPlanId();
    }

    @GetMapping("/delete/{replyId}")
    public String deleteReply(
            @PathVariable String replyId,
            HttpServletRequest request,
            Principal principal) {
//        로직깔끔히 정리 안된다 대충 넘기자 ㅋㅋㅋㅋㅋㅋ
        Integer intReplyId = Integer.valueOf(replyId);
        Reply reply =replyRepository.findByReplyId(intReplyId);
        CustomPlan2 plan = planRepository.findByPlanId(reply.getPlanId());
        String replyUser = reply.getUsername();
        String planUser = plan.getUsername();
        String reqUser = principal.getName();
        if (reqUser.equals(replyUser) || reqUser.equals(planUser)) {
            replyRepository.deleteReply(intReplyId);
        }
        return "redirect:" + request.getHeader("Referer");
    }
}
