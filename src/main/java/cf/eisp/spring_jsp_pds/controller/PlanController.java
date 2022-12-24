package cf.eisp.spring_jsp_pds.controller;

import cf.eisp.spring_jsp_pds.model.CustomPlan2;
import cf.eisp.spring_jsp_pds.model.Plan;
import cf.eisp.spring_jsp_pds.model.PlanDo;
import cf.eisp.spring_jsp_pds.repository.DoRepository;
import cf.eisp.spring_jsp_pds.repository.PlanRepository;
import cf.eisp.spring_jsp_pds.repository.ReplyRepository;
import cf.eisp.spring_jsp_pds.repository.SeeRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/plan")
public class PlanController {

    PlanRepository planRepository;
    ReplyRepository replyRepository;
    SeeRepository seeRepository;
    DoRepository doRepository;

    @GetMapping({"","/"})
    public String plan(Model model, Principal principal) {
        String username = principal.getName();
        List<Plan> planList = planRepository.findByUsername(username);
        model.addAttribute("planList", planList);
        return "plan";
    }

    @GetMapping("/write")
    public String planWrite() {

        return "planWrite";
    }

    @PostMapping("/write")
    public String planWriteAction(Plan plan, Principal principal) {
        plan.setUsername(principal.getName());
        if (plan.getPlanPrivate() == null) {
            plan.setPlanPrivate("N");
        }

        planRepository.save(plan);
        return "redirect:/plan";
    }

    @PostMapping("/check")
    public String doCheck(PlanDo planDo) {
        doRepository.save(planDo);
        return "plan";
    }

    @PostMapping("/delete")
    public String planDelete(Integer planId, Principal principal) {
        CustomPlan2 plan = planRepository.findByPlanId(planId);
        String findUser = plan.getUsername();
        String user = principal.getName();
        if (findUser.equals(user)) {
//            키연결때문에 삭제 그지같네... ㅡㅡ
            replyRepository.deleteByPlanId(planId);
            seeRepository.deleteByPlanId(planId);
            doRepository.delete(planId);
            planRepository.delete(planId);
        }
        return "redirect:/plan";
    }

}
