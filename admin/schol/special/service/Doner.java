package admin.schol.special.service;

import java.io.Serializable;
import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class Doner implements Serializable{
	private String doAppSeq;
	private String donationGubun =""; 
	private String DemailId ="";
	private String DmemName; 
	private String doAmount =""; 
	private String doAppDate =""; 
	private String doPeriod =""; 
	private String donerPhone ="";
	
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

	public String getDemailId() {
		return DemailId;
	}
	public void setDemailId(String demailId) {
		DemailId = demailId;
	}
	public String getDmemName() {
		return DmemName;
	}
	public void setDmemName(String dmemName) {
		DmemName = dmemName;
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
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
}
