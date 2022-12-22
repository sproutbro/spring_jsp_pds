package cf.eisp.spring_jsp_pds.controller;

import cf.eisp.spring_jsp_pds.model.Plan;
import cf.eisp.spring_jsp_pds.model.PlanDo;
import cf.eisp.spring_jsp_pds.model.Reply;
import cf.eisp.spring_jsp_pds.repository.DoRepository;
import cf.eisp.spring_jsp_pds.repository.PlanRepository;
import cf.eisp.spring_jsp_pds.repository.ReplyRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/plan")
public class PlanController {

    PlanRepository planRepository;
    ReplyRepository replyRepository;
    DoRepository doRepository;

    @GetMapping({"","/"})
    public String plan(Model model, Principal principal) {
        String username = principal.getName();
        List<Plan> planList = planRepository.findByUsername(username);
        model.addAttribute("planList", planList);
        return "plan";
    }

    @GetMapping("/{id}")
    public String findByPlanId(
            @PathVariable String id,
            Model model,
            Principal principal) {
        Integer planId = Integer.valueOf(id);
        Plan plan = planRepository.findByPlanId(planId);

        if (plan.getPlanPrivate().equals("Y")) {
//            공개
            getPlanAndReply(model, plan, replyRepository);
        } else if (plan.getUsername().equals(principal.getName())) {
//            비공개 유저네임 비교후
            getPlanAndReply(model, plan, replyRepository);
        }
        return "planDetail";
    }

    @GetMapping("/write")
    public String planWrite() {

        return "planWrite";
    }

    @PostMapping("/write")
    public String planWriteAction(Plan plan, Principal principal) {
        System.out.println("plan = " + plan);
        plan.setPlanPrivate("Y");
        plan.setUsername(principal.getName());
        planRepository.save(plan);
        return "plan";
    }

    @PostMapping("/check")
    public String doCheck(PlanDo planDo) {
        doRepository.save(planDo);
        return "plan";
    }


    private static void getPlanAndReply(Model model, Plan plan, ReplyRepository replyRepository) {
        model.addAttribute("plan", plan);
        List<Reply> replyList = replyRepository.findByPlanId(plan.getPlanId());
        model.addAttribute("replyList", replyList);
    }
}
