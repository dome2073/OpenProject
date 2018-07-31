package com.bitcamp.op.user.service;

import java.io.File;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.op.jdbc.ConnectionProvider;

import com.bitcamp.op.jdbc.jdbcUtil;
import com.bitcamp.op.user.dao.UserDao;
import com.bitcamp.op.user.model.UserVO;



public class UserRegService{
	
	@Autowired
	UserDao userdao;

	public int RegMember(UserVO uservo, HttpServletRequest request) throws Exception {
		int result = 0;		
		Connection conn = null;
		
		//저장용 파일 이름, 물리적저장, DB 저장용
		String imgName = "";
		
		//물리적인 저장
		
		//1. 저장 경로 설정
		String uploadUri ="/uploadFile/UserPhoto";
		
		//2. 시스템의 물리적인 경로
		//JSP 파일업로드와 같은방식 참고해서 보기
		String dir = request.getSession().getServletContext().getRealPath(uploadUri);
		System.out.println(dir);
		
		//회원정보에 사진에 관한 정보가 없을 경우
		if(!uservo.getPhotoFile().isEmpty()) {
			
			// 유저아이디_파일이름.jpg
			imgName = uservo.getUser_id()+"_"+uservo.getPhotoFile().getOriginalFilename();
			
			//저장
			uservo.getPhotoFile().transferTo(new File(dir,imgName));
			System.out.println(dir);
			System.out.println(imgName);
			
			//DB에 저장할 사진이름을 저장함 (SET)
			uservo.setUser_Photo (imgName);
		
		}
		try {
			conn = ConnectionProvider.getConnection();
			
			result = userdao.insertMember(conn, uservo);
			
		} finally {
			jdbcUtil.close(conn);
		}

		return result;
	}

}
