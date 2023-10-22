package admin.schol.indi.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**

 *     수정일         수정자                   수정내용
 *     -------          --------        ---------------------------
 *   2019.12.20       KHN                  최초 생성

 */
@SuppressWarnings("serial")
public class Schol implements Serializable {

	private String scholSeq;
	private String scholGubun =""; 
	private String scholGubunNm ="";
	private String memSeq; 
	private String emailId =""; 
	private String memName =""; 
	private String scholItem =""; 
	private String scholAmount =""; 
	private String scholNote =""; 
	private String scholCk =""; 
	private String scholDate =""; 
	private String scholConfirm  ="";
	private String scholGoalAmount  ="";
	private String scholCurAmount  ="";
	
	private String doAppSeq;
	private String donationGubun ="";
	private String dScholSeq =""; 
	private String donerEmailId ="";				
	private String donerName=""; 
	private String doAmount =""; 	
	private String do_app_date ="";
	private String do_period=""; 
	private String doner_phone =""; 
	private String dScholItem ="";
	
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
	
	private String benAppSeqFile="";
	private String fileNo;
	private String ofileName =""; 
	private String sfileName =""; 
	private String fileSize =""; 
	
	private String benShareName="";
	private String shareSeq;
	private String shareImg =""; 
	private String shareTitle =""; 
	private String shareContent =""; 
	private String shareDate ="";
	private String shareView =""; 
	private String beneEmailId =""; 
	
	private String codeId="";
	private String code ="";
	private String codeNm =""; 
	private String codeDc =""; 
	private String useAt =""; 
	private String frstRegistPnttm ="";
	private String frstRegisterId =""; 
	private String lastUpdtPnttm =""; 
	private String lastUpdusrId ="";
	

	public String getCodeId() {
		return codeId;
	}
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCodeNm() {
		return codeNm;
	}
	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}
	public String getCodeDc() {
		return codeDc;
	}
	public void setCodeDc(String codeDc) {
		this.codeDc = codeDc;
	}
	public String getUseAt() {
		return useAt;
	}
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}
	public String getFrstRegistPnttm() {
		return frstRegistPnttm;
	}
	public void setFrstRegistPnttm(String frstRegistPnttm) {
		this.frstRegistPnttm = frstRegistPnttm;
	}
	public String getFrstRegisterId() {
		return frstRegisterId;
	}
	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}
	public String getLastUpdtPnttm() {
		return lastUpdtPnttm;
	}
	public void setLastUpdtPnttm(String lastUpdtPnttm) {
		this.lastUpdtPnttm = lastUpdtPnttm;
	}
	public String getLastUpdusrId() {
		return lastUpdusrId;
	}
	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}
	public String getBeneEmailId() {
		return beneEmailId;
	}
	public void setBeneEmailId(String beneEmailId) {
		this.beneEmailId = beneEmailId;
	}
	public String getBenShareName() {
		return benShareName;
	}
	public void setBenShareName(String benShareName) {
		this.benShareName = benShareName;
	}
	public String getShareSeq() {
		return shareSeq;
	}
	public void setShareSeq(String shareSeq) {
		this.shareSeq = shareSeq;
	}
	public String getShareImg() {
		return shareImg;
	}
	public void setShareImg(String shareImg) {
		this.shareImg = shareImg;
	}
	public String getShareTitle() {
		return shareTitle;
	}
	public void setShareTitle(String shareTitle) {
		this.shareTitle = shareTitle;
	}
	public String getShareContent() {
		return shareContent;
	}
	public void setShareContent(String shareContent) {
		this.shareContent = shareContent;
	}
	public String getShareDate() {
		return shareDate;
	}
	public void setShareDate(String shareDate) {
		this.shareDate = shareDate;
	}
	public String getShareView() {
		return shareView;
	}
	public void setShareView(String shareView) {
		this.shareView = shareView;
	}
	public String getBenAppSeqFile() {
		return benAppSeqFile;
	}
	public void setBenAppSeqFile(String benAppSeqFile) {
		this.benAppSeqFile = benAppSeqFile;
	}
	public String getFileNo() {
		return fileNo;
	}
	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}
	public String getOfileName() {
		return ofileName;
	}
	public void setOfileName(String ofileName) {
		this.ofileName = ofileName;
	}
	public String getSfileName() {
		return sfileName;
	}
	public void setSfileName(String sfileName) {
		this.sfileName = sfileName;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getdScholSeq() {
		return dScholSeq;
	}
	public void setdScholSeq(String dScholSeq) {
		this.dScholSeq = dScholSeq;
	}


	public String getBenScholSeq() {
		return benScholSeq;
	}
	public void setBenScholSeq(String benScholSeq) {
		this.benScholSeq = benScholSeq;
	}
	public String getdScholItem() {
		return dScholItem;
	}
	public void setdScholItem(String dScholItem) {
		this.dScholItem = dScholItem;
	}
	public String getbScholItem() {
		return bScholItem;
	}
	public void setbScholItem(String bScholItem) {
		this.bScholItem = bScholItem;
	}
	public String getBenAppSeq() {
		return benAppSeq;
	}
	public void setBenAppSeq(String benAppSeq) {
		this.benAppSeq = benAppSeq;
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
	public String getDo_app_date() {
		return do_app_date;
	}
	public void setDo_app_date(String do_app_date) {
		this.do_app_date = do_app_date;
	}
	public String getDo_period() {
		return do_period;
	}
	public void setDo_period(String do_period) {
		this.do_period = do_period;
	}
	public String getDoner_phone() {
		return doner_phone;
	}
	public void setDoner_phone(String doner_phone) {
		this.doner_phone = doner_phone;
	}
	public String getDoAppSeq() {
		return doAppSeq;
	}
	public void setDoAppSeq(String doAppSeq) {
		this.doAppSeq = doAppSeq;
	}
	public String getDonationGubun() {
		return donationGubun;
	}
	public void setDonationGubun(String donationGubun) {
		this.donationGubun = donationGubun;
	}


	public String getDonerEmailId() {
		return donerEmailId;
	}
	public void setDonerEmailId(String donerEmailId) {
		this.donerEmailId = donerEmailId;
	}
	public String getDonerName() {
		return donerName;
	}
	public void setDonerName(String donerName) {
		this.donerName = donerName;
	}
	public String getDoAmount() {
		return doAmount;
	}
	public void setDoAmount(String doAmount) {
		this.doAmount = doAmount;
	}
	public String getDoAppDate() {
		return doAppDate;
	}
	public void setDoAppDate(String doAppDate) {
		this.doAppDate = doAppDate;
	}
	public String getDoPeriod() {
		return doPeriod;
	}
	public void setDoPeriod(String doPeriod) {
		this.doPeriod = doPeriod;
	}
	public String getDonerPhone() {
		return donerPhone;
	}
	public void setDonerPhone(String donerPhone) {
		this.donerPhone = donerPhone;
	}





	private String doAppDate =""; 
	private String doPeriod =""; 
	private String donerPhone ="";
	
	public String getScholGoalAmount() {
		return scholGoalAmount;
	}
	public void setScholGoalAmount(String scholGoalAmount) {
		this.scholGoalAmount = scholGoalAmount;
	}
	public String getScholCurAmount() {
		return scholCurAmount;
	}
	public void setScholCurAmount(String scholCurAmount) {
		this.scholCurAmount = scholCurAmount;
	}
	
	public String getScholSeq() {
		return scholSeq;
	}
	public void setScholSeq(String scholSeq) {
		this.scholSeq = scholSeq;
	}
	

	public String getScholGubun() {
		return scholGubun;
	}
	public void setScholGubun(String scholGubun) {
		this.scholGubun = scholGubun;
	}

	public String getScholGubunNm() {
		return scholGubunNm;
	}





	public void setScholGubunNm(String scholGubunNm) {
		this.scholGubunNm = scholGubunNm;
	}





	public String getMemSeq() {
		return memSeq;
	}





	public void setMemSeq(String memSeq) {
		this.memSeq = memSeq;
	}





	public String getEmailId() {
		return emailId;
	}





	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}





	public String getMemName() {
		return memName;
	}





	public void setMemName(String memName) {
		this.memName = memName;
	}





	public String getScholItem() {
		return scholItem;
	}





	public void setScholItem(String scholItem) {
		this.scholItem = scholItem;
	}





	public String getScholAmount() {
		return scholAmount;
	}





	public void setScholAmount(String scholAmount) {
		this.scholAmount = scholAmount;
	}





	public String getScholNote() {
		return scholNote;
	}





	public void setScholNote(String scholNote) {
		this.scholNote = scholNote;
	}





	public String getScholCk() {
		return scholCk;
	}





	public void setScholCk(String scholCk) {
		this.scholCk = scholCk;
	}





	public String getScholDate() {
		return scholDate;
	}





	public void setScholDate(String scholDate) {
		this.scholDate = scholDate;
	}





	public String getScholConfirm() {
		return scholConfirm;
	}





	public void setScholConfirm(String scholConfirm) {
		this.scholConfirm = scholConfirm;
	}





	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
}
