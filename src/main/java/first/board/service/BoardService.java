package first.board.service;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.board.dao.BoardDao;
import first.board.vo.BoardVo;
 
@Service
public class BoardService {

	@Autowired
    private BoardDao boardDao;
     
	public List<BoardVo> selectBoardList(BoardVo boardVo) throws Exception {
    	
    	//paging
    	boardVo.setTotalCount(boardDao.selectBoardListCount(boardVo));
    	
        return boardDao.selectBoardList(boardVo);
    }
}