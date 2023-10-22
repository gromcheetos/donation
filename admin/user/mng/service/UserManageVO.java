package admin.user.mng.service;

/**
 * 일반회원VO클래스로서 일반회원관리 비지니스로직 처리용 항목을 구성한다.
 * @author 공통서비스 개발팀 조재영
 * @since 2009.04.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.10  조재영          최초 생성
 *   2017.07.21  장동한 			로그인인증제한 작업
 *
 * </pre>
 */
public class UserManageVO extends UserDefaultVO{

	private static final long serialVersionUID = -4255594107023139972L;

	/** 이전비밀번호 - 비밀번호 변경시 사용*/
    private String oldMemPw = "";

    /* 회원번호 */
	private String memSeq;
	/* 회원이름 */
	private String memName;
	/* 이메일아이디 */
	private String emailId;
	/* 비밀번호 */
	private String memPw;
	/* 이메일인증키 */
	private String emailKdy;
	/* 이메일인증여부 */
	private String emailConfirm;
	/* 이메일인증일 */
	private String emailDate;
	/* 회원등급 */
	private String memLev;
	/* 회원상테 */
	private String memStatus;
	/* 가입일시 */
	private String regDate;
	/* 회원가입구분 */
	private String memGubun;
	/*회원상태구분명*/
	private String memStatusNm;
	/*회원가입구분명*/
	private String memGubunNm;
	

	public String getOldMemPw() {
		return oldMemPw;
	}
	public void setOldMemPw(String oldMemPw) {
		this.oldMemPw = oldMemPw;
	}

	public String getMemSeq() {
		return memSeq;
	}
	public void setMemSeq(String memSeq) {
		this.memSeq = memSeq;
	}
	
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	
	public String getEmailKdy() {
		return emailKdy;
	}
	public void setEmailKdy(String emailKdy) {
		this.emailKdy = emailKdy;
	}
	
	public String getEmailConfirm() {
		return emailConfirm;
	}
	public void setEmailConfirm(String emailConfirm) {
		this.emailConfirm = emailConfirm;
	}
	
	public String getEmailDate() {
		return emailDate;
	}
	public void setEmailDate(String emailDate) {
		this.emailDate = emailDate;
	}
	
	public String getMemLev() {
		return memLev;
	}
	public void setMemLev(String memLev) {
		this.memLev = memLev;
	}
	public String getMemStatus() {
		return memStatus;
	}
	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getMemGubun() {
		return memGubun;
	}
	public void setMemGubun(String memGubun) {
		this.memGubun = memGubun;
	}
	public String getMemStatusNm() {
		return memStatusNm;
	}
	public void setMemStatusNm(String memStatusNm) {
		this.memStatusNm = memStatusNm;
	}
	public String getMemGubunNm() {
		return memGubunNm;
	}
	public void setMemGubunNm(String memGubunNm) {
		this.memGubunNm = memGubunNm;
	}
	
	
}