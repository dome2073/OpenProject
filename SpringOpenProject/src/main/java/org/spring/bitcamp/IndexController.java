package org.spring.bitcamp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("/")
	public String Index() {
		return "index";//응답해야하는 뷰 설정
	}
}
