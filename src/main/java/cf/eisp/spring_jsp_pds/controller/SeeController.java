package cf.eisp.spring_jsp_pds.controller;

import cf.eisp.spring_jsp_pds.model.Plan;
import cf.eisp.spring_jsp_pds.model.See;
import cf.eisp.spring_jsp_pds.repository.SeeRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/see")
public class SeeController {

    private SeeRepository seeRepository;

    @GetMapping({"/", ""})
    public String see(Principal principal, Model model) {
        String username = principal.getName();
        List<Plan> planList = seeRepository.findByUsername(username);
        model.addAttribute("planList", planList);
        return "main";
    }

    @PostMapping("/write")
    public String writeAction(
            HttpServletRequest request,
            See see)
    {
        seeRepository.save(see);
        return "redirect:" + request.getHeader("Referer");
    }
}
