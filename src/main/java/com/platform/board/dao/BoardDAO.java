package com.platform.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.platform.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectBoardList(Map<String,Object> map){
		return (List<Map<String,Object>>)selectList("board.selectBoardList",map);
	}

	public void insertBoard(Map<String, Object> map) {
		insert("board.insertBoard", map);
	}
	
	public void updateHitCnt(Map<String, Object> map) throws Exception{
	    update("board.updateHitCnt", map);
	}
	 
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception{
	    return (Map<String, Object>) selectOne("board.selectBoardDetail", map);
	}
	
	public void deleteBoard(Map<String,Object> map) throws Exception{
		update("board.deleteBoard", map);
	}
}
