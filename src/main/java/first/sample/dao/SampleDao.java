package first.sample.dao;

import java.sql.SQLException;
import java.util.List;
import org.springframework.stereotype.Repository;
import first.sample.vo.SampleVo;

@Repository
public interface SampleDao {
	public List<SampleVo> selectBoardList(SampleVo sampleVo) throws SQLException;
}
