package cf.eisp.spring_jsp_pds.config;

import cf.eisp.spring_jsp_pds.model.PlanDo;
import cf.eisp.spring_jsp_pds.repository.DoRepository;
import lombok.AllArgsConstructor;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@AllArgsConstructor
public class Scheduler {
    private final DoRepository doRepository;

    /**
     * 이용한 만료기간 자동처리 로직 완료 - 윤병우
     * 추가 보완 사항 : update 시 로그 기록 남겨야함
     */
    @Scheduled(cron = "0 * * * * *")
    public void updatePlanState() {
        doRepository.updateDoByFailPlan();
        System.out.println("");
    }
}
