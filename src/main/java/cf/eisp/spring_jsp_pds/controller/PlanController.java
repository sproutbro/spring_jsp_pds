package cf.eisp.spring_jsp_pds.controller;

import cf.eisp.spring_jsp_pds.model.CustomPlan2;
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
        return "redirect:plan";
    }

    @PostMapping("/check")
    public String doCheck(PlanDo planDo) {
        doRepository.save(planDo);
        return "plan";
    }


}
