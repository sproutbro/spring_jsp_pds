package cf.eisp.spring_jsp_pds.controller;

import cf.eisp.spring_jsp_pds.model.CustomPlan2;
import cf.eisp.spring_jsp_pds.model.Reply;
import cf.eisp.spring_jsp_pds.repository.PlanRepository;
import cf.eisp.spring_jsp_pds.repository.ReplyRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/detail")
public class DetailController {

    private PlanRepository planRepository;
    private ReplyRepository replyRepository;

    @GetMapping("/{id}")
    public String findByPlanId(
            @PathVariable String id,
            Model model,
            Principal principal) {
        Integer planId = Integer.valueOf(id);
        CustomPlan2 plan = planRepository.findByPlanId(planId);

        if (plan.getPlanPrivate().equals("Y")) {
//            공개
            getPlanAndReply(model, plan, replyRepository);
        } else if (plan.getUsername().equals(principal.getName())) {
//            비공개 유저네임 비교후
            getPlanAndReply(model, plan, replyRepository);
        }
        return "detail";
    }
    private static void getPlanAndReply(Model model, CustomPlan2 plan, ReplyRepository replyRepository) {
        model.addAttribute("plan", plan);
        List<Reply> replyList = replyRepository.findByPlanId(plan.getPlanId());
        model.addAttribute("replyList", replyList);
    }
}
