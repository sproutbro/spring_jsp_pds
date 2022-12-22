package cf.eisp.spring_jsp_pds.controller;

import cf.eisp.spring_jsp_pds.model.User;
import cf.eisp.spring_jsp_pds.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@AllArgsConstructor
public class JoinController {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @GetMapping("/join")
    public String join() {
        return "join";
    }

    @PostMapping("/join")
    public String joinAction(User user, Model model) {
        User findUser = userRepository.findByUsername(user.getUsername());
        if (findUser != null) {
            model.addAttribute("msg", "이미 가입된 아이디");
            return "join";
        }
        String encodePWD = bCryptPasswordEncoder.encode(user.getPassword());
        user.setPassword(encodePWD);
        Integer joinResult = userRepository.save(user);
        if (joinResult == 1) {
            model.addAttribute("msg", "가입완료");
        } else {
            model.addAttribute("msg", "가입 애러");
        }
        return "join";
    }
}
