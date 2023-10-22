package admin.bene.mng.service;

import java.io.Serializable;

import admin.schol.indi.service.Schol;
import admin.schol.indi.service.ScholVO;

@SuppressWarnings("serial")
public class BeneMngVO extends ScholVO implements Serializable{
	
	private String benAppSeq="";
	private String benScholSeq="";
	private String bEmailId =""; 
	private String benName =""; 
	private String benPhone =""; 
	private String benBelong =""; 
	private String benBirth =""; 
	private String benAppField =""; 	/*모집분야코드*/
	private String benAppFieldNm =""; 	/*모집분야명*/
	private String benMsg =""; 
	private String benApplyDate =""; 
	private String benCk ="";
	private String bScholItem ="";
	public String getBenAppSeq() {
		return benAppSeq;
	}
	public void setBenAppSeq(String benAppSeq) {
		this.benAppSeq = benAppSeq;
	}
	public String getBenScholSeq() {
		return benScholSeq;
	}
	public void setBenScholSeq(String benScholSeq) {
		this.benScholSeq = benScholSeq;
	}
	public String getbEmailId() {
		return bEmailId;
	}
	public void setbEmailId(String bEmailId) {
		this.bEmailId = bEmailId;
	}
	public String getBenName() {
		return benName;
	}
	public void setBenName(String benName) {
		this.benName = benName;
	}
	public String getBenPhone() {
		return benPhone;
	}
	public void setBenPhone(String benPhone) {
		this.benPhone = benPhone;
	}
	public String getBenBelong() {
		return benBelong;
	}
	public void setBenBelong(String benBelong) {
		this.benBelong = benBelong;
	}
	public String getBenBirth() {
		return benBirth;
	}
	public void setBenBirth(String benBirth) {
		this.benBirth = benBirth;
	}
	public String getBenAppField() {
		return benAppField;
	}
	public void setBenAppField(String benAppField) {
		this.benAppField = benAppField;
	}
	public String getBenAppFieldNm() {
		return benAppFieldNm;
	}
	public void setBenAppFieldNm(String benAppFieldNm) {
		this.benAppFieldNm = benAppFieldNm;
	}
	public String getBenMsg() {
		return benMsg;
	}
	public void setBenMsg(String benMsg) {
		this.benMsg = benMsg;
	}
	public String getBenApplyDate() {
		return benApplyDate;
	}
	public void setBenApplyDate(String benApplyDate) {
		this.benApplyDate = benApplyDate;
	}
	public String getBenCk() {
		return benCk;
	}
	public void setBenCk(String benCk) {
		this.benCk = benCk;
	}
	public String getbScholItem() {
		return bScholItem;
	}
	public void setbScholItem(String bScholItem) {
		this.bScholItem = bScholItem;
	}
	
	

}
