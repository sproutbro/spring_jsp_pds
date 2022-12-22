package cf.eisp.spring_jsp_pds.controller;

import cf.eisp.spring_jsp_pds.model.Plan;
import cf.eisp.spring_jsp_pds.repository.PlanRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@AllArgsConstructor
public class IndexController {

    private final PlanRepository planRepository;
    @GetMapping("/")
    public String index(Model model) {
        List<Plan> planList = planRepository.findAll();
        model.addAttribute("planList", planList);
        return "main";
    }

    @GetMapping("/info")
    public String info() {
        return "info";
    }

}
