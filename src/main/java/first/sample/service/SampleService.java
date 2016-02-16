package first.sample.service;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.sample.dao.SampleDao;
import first.sample.vo.SampleVo;
 
@Service
public class SampleService {

	//@Autowired
    private SampleDao sampleDao;
     
    public List<SampleVo> selectBoardList(SampleVo sampleVo) throws Exception {
        return sampleDao.selectBoardList(sampleVo);
    }

}
