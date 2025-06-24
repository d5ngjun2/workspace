package com.kh.login.controller;

import com.kh.login.exception.UserNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/test")
public class TestExceptionController {

    @GetMapping("/illegal")
    public String testIllegalArgument(@RequestParam Integer number) {
        if (number < 0) {
            throw new IllegalArgumentException("음수는 허용되지 않습니다. : " + number);
        }
        return "정상응답 : " + number;
    }

    @GetMapping("/user/{id}")
    public String getUser(@PathVariable Long id) {

        // Member member = service.getUser(id);
        // if (member == null)
        if (id <= 0) {
            throw new UserNotFoundException();
        }
        return "정상 응답 : " + id;
    }
}
