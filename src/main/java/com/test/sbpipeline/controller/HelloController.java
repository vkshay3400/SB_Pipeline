package com.test.sbpipeline.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    // 1. A simple endpoint returning plain text
	// http://localhost:8081/hello	
    @GetMapping("/hello")
    public String sayHello() {
        return "Hello, World!";
    }

    // 2. An advanced endpoint that accepts a query parameter
    // http://localhost:8081/greeting
    @GetMapping("/greeting")
    public String sayGreeting(@RequestParam(value = "name", defaultValue = "Guest") String name) {
        return String.format("Hello, %s!", name);
    }
}