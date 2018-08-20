package com.movie.project.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.project.dao.ReplyDAO;
import com.movie.project.model.Criteria;
import com.movie.project.model.ReplyVO;


@Service
public class ReplyService{
	
	@Autowired
	SqlSessionTemplate template;
	
	private ReplyDAO dao;
	
	public void addReply(ReplyVO vo) throws Exception {
		dao = template.getMapper(ReplyDAO.class);
		dao.create(vo);
	}

	public List<ReplyVO> listReply(String movie_code) throws Exception {
		dao = template.getMapper(ReplyDAO.class);
		return dao.list(movie_code);
	}

	public void modifyReply(ReplyVO vo) throws Exception {
		dao = template.getMapper(ReplyDAO.class);
		dao.update(vo);
	}

	public void removeReply(Integer rno) throws Exception {
		dao = template.getMapper(ReplyDAO.class);
		dao.delete(rno);
	}

	public List<ReplyVO> listReplyPage(String movie_code, Criteria cri) throws Exception {
		dao = template.getMapper(ReplyDAO.class);
		return dao.listPage(movie_code, cri);
	}

	public int count(String movie_code) throws Exception {
		dao = template.getMapper(ReplyDAO.class);
		return dao.count(movie_code);
	}

}
