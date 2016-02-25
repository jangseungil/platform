package first.common.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class PagingTag extends TagSupport {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -4469130065316609277L;

	private String msg;
	
	private String firstPageNo;

	/**
	 * @param firstPageNo
	 */
	public void setFirstPageNo(String firstPageNo) {
		this.firstPageNo = firstPageNo;
	}

	/**
	 * tld파일에 attribute로 선언한 놈의 set메소드를 만들어 주어야한다.
	 * 
	 * @param msg
	 */
	public void setMsg(String msg) {
		this.msg = msg;
	}

	@Override
	public int doStartTag() throws JspException {
		System.out.println("doStartTag()");
		// return SKIP_BODY;//바디부를 생략
		return super.doStartTag();
	}

	@Override
	public int doAfterBody() throws JspException {
		System.out.println("doAfterBody()");
		// return EVAL_BODY_INCLUDE; //한번 실행하고 넘어가기
		// return EVAL_BODY_AGAIN; //반복 문 사용시
		return super.doAfterBody();
	}

	@Override
	public int doEndTag() throws JspException {
		System.out.println("doEndTag()");
		JspWriter out = pageContext.getOut();
		try {
			out.write("\r\n");
		      out.write("\r\n");
		      out.write("<div class=\"paginate\">\r\n");
		      out.write("    <a href=\"javascript:goPage(");
		      out.write(firstPageNo);
		      out.write(")\" class=\"first\">처음페이지</a>\r\n");
		      out.write("    <a href=\"javascript:goPage(");
		      
		      out.write(")\" class=\"prev\">이전페이지</a>\r\n");
		      out.write("    <span>\r\n");
		      out.write("        <c:forEach var=\"i\" begin=\"");

		      out.write("\" end=\"");

		      out.write("\" step=\"1\">\r\n");
		      out.write("            <c:choose>\r\n");
		      out.write("                <c:when test=\"");

		      out.write("\"><a href=\"javascript:goPage(");

		      out.write(")\" class=\"choice\">");

		      out.write("</a></c:when>\r\n");
		      out.write("                <c:otherwise><a href=\"javascript:goPage(");

		      out.write(')');
		      out.write('"');
		      out.write('>');

		      out.write("</a></c:otherwise>\r\n");
		      out.write("            </c:choose>\r\n");
		      out.write("        </c:forEach>\r\n");
		      out.write("    </span>\r\n");
		      out.write("    <a href=\"javascript:goPage(");

		      out.write(")\" class=\"next\">다음페이지</a>\r\n");
		      out.write("    <a href=\"javascript:goPage(");
		      out.write(")\" class=\"last\">마지막페이지</a>\r\n");
		      out.write("</div>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return EVAL_PAGE; // ㄱㅖ속해서 다음에 있는 페이지 안의 소스 실행해라
		// return SKIP_PAGE; //태그 다음에 있는 page 안의 소스 다무시
	}
}
