package cf.eisp.spring_jsp_pds.controller;

import cf.eisp.spring_jsp_pds.model.PlanDo;
import cf.eisp.spring_jsp_pds.repository.DoRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/do")
public class DoController {
    private final DoRepository doRepository;

    @RequestMapping("/save")
    public void doSave(PlanDo planDo) {
        doRepository.save(planDo);
    }

    @RequestMapping("/findAll")
    public String doFindAll(Model model){
        List<PlanDo> doList = doRepository.findAll();
        model.addAttribute("doList", doList);
        return "do";
    }
    @RequestMapping("/findById")
    public void doFindById(Integer planId) {
        doRepository.findById(planId);
    }
    @RequestMapping("/update")
    public void doUpdate(PlanDo planDo){
        doRepository.update(planDo);
    }

    @RequestMapping("/delete")
    public void doDelete(Integer planId) {
        doRepository.delete(planId);
    }

}
