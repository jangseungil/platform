package first.board.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import first.board.vo.BoardVo;

@Repository
public interface BoardDao {
	public List<BoardVo> selectBoardList(BoardVo boardVo) throws SQLException;
	
	public int selectBoardListCount(BoardVo boardVo) throws SQLException;
}
