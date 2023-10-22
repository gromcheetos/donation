package admin.cmn.qna.service;

import org.apache.commons.lang3.builder.ToStringBuilder;

import admin.cmn.*;


public class QnaVO extends QnaDefaultVO{

	private static final long serialVersionUID = 1L;

	/** QA seq */
	private String qnaSeq;

	private int memNumber;
	/** 질문제목 */
	private String qnaTitle;

	/** 질문내용 */
	private String qnaContent;

	/** 작성자 명 */
	private String qnaName;

	/** 작성일자 */
	private String qnaDate;
	
	/** 답변여부 */
	private int qnaCk;

	/** 답변내용 */
	private String answerCn;

	/** 답변일자 */
	private String ansDate;

	/** 답변자명 */
	private String ansAd;	

	/**삭제여부*/
	private String ansDelYn;



	
	
	

	public String getQnaSeq() {
		return qnaSeq;
	}







	public void setQnaSeq(String qnaSeq) {
		this.qnaSeq = qnaSeq;
	}







	public int getMemNumber() {
		return memNumber;
	}







	public void setMemNumber(int memNumber) {
		this.memNumber = memNumber;
	}







	public String getQnaTitle() {
		return qnaTitle;
	}







	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}







	public String getQnaContent() {
		return qnaContent;
	}







	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}







	public String getQnaName() {
		return qnaName;
	}







	public void setQnaName(String qnaName) {
		this.qnaName = qnaName;
	}







	public String getQnaDate() {
		return qnaDate;
	}







	public void setQnaDate(String qnaDate) {
		this.qnaDate = qnaDate;
	}







	public int getQnaCk() {
		return qnaCk;
	}







	public void setQnaCk(int qnaCk) {
		this.qnaCk = qnaCk;
	}







	public String getAnswerCn() {
		return answerCn;
	}







	public void setAnswerCn(String answerCn) {
		this.answerCn = answerCn;
	}







	public String getAnsDate() {
		return ansDate;
	}







	public void setAnsDate(String ansDate) {
		this.ansDate = ansDate;
	}







	public String getAnsAd() {
		return ansAd;
	}







	public void setAnsAd(String ansAd) {
		this.ansAd = ansAd;
	}







	public String getAnsDelYn() {
		return ansDelYn;
	}







	public void setAnsDelYn(String ansDelYn) {
		this.ansDelYn = ansDelYn;
	}







	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
}
