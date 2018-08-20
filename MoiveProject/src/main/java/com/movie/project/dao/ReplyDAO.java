package com.movie.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.movie.project.model.Criteria;
import com.movie.project.model.ReplyVO;

public interface ReplyDAO {
public List<ReplyVO> list(String movie_code) throws Exception;
	
	public void create(ReplyVO vo) throws Exception;
	
	public void update(ReplyVO vo) throws Exception;
	
	public void delete(Integer rno) throws Exception;
	
	public List<ReplyVO> listPage(@Param("movie_code") String movie_code, @Param("cri") Criteria cri) throws Exception;
	
	public int count(String movie_code) throws Exception;

}
