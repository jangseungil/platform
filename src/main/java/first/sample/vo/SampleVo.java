package first.sample.vo;

public class SampleVo {
	
	private int idx;

	private int parentIdx;
	
	private String title;
	
	private String contents;
	
	private int hitCnt;
	
	private String delGb;
	
	private String creaDtm;
	
	private String creaId;

	public SampleVo() {
		
	}
	
	public SampleVo(int idx) {
		this.idx = idx;
	}
	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getParentIdx() {
		return parentIdx;
	}

	public void setParentIdx(int parentIdx) {
		this.parentIdx = parentIdx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getHitCnt() {
		return hitCnt;
	}

	public void setHitCnt(int hitCnt) {
		this.hitCnt = hitCnt;
	}

	public String getDelGb() {
		return delGb;
	}

	public void setDelGb(String delGb) {
		this.delGb = delGb;
	}

	public String getCreaDtm() {
		return creaDtm;
	}

	public void setCreaDtm(String creaDtm) {
		this.creaDtm = creaDtm;
	}

	public String getCreaId() {
		return creaId;
	}

	public void setCreaId(String creaId) {
		this.creaId = creaId;
	}
	
}
