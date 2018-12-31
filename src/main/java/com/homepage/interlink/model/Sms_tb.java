package com.homepage.interlink.model;

public class Sms_tb {
	private int sms_seq;
	private String sms_messages;
	private String sms_userName;
	private String sms_tell;
	private String sms_sendDate;
	private String sms_adminId;
	private String sms_division;
	private String sms_result;
	private String sms_result2;
	private String sms_error;
	private String etc;

	public int getSms_seq() {
		return sms_seq;
	}

	public void setSms_seq(int sms_seq) {
		this.sms_seq = sms_seq;
	}

	public String getSms_messages() {
		return sms_messages;
	}

	public void setSms_messages(String sms_messages) {
		this.sms_messages = sms_messages;
	}

	public String getSms_userName() {
		return sms_userName;
	}

	public void setSms_userName(String sms_userName) {
		this.sms_userName = sms_userName;
	}

	public String getSms_tell() {
		return sms_tell;
	}

	public void setSms_tell(String sms_tell) {
		this.sms_tell = sms_tell;
	}

	public String getSms_sendDate() {
		return sms_sendDate;
	}

	public void setSms_sendDate(String sms_sendDate) {
		this.sms_sendDate = sms_sendDate;
	}

	public String getSms_adminId() {
		return sms_adminId;
	}

	public void setSms_adminId(String sms_adminId) {
		this.sms_adminId = sms_adminId;
	}

	public String getSms_division() {
		return sms_division;
	}

	public void setSms_division(String sms_division) {
		this.sms_division = sms_division;
	}

	public String getSms_result() {
		return sms_result;
	}

	public void setSms_result(String sms_result) {
		this.sms_result = sms_result;
	}

	public String getSms_result2() {
		return sms_result2;
	}

	public void setSms_result2(String sms_result2) {
		this.sms_result2 = sms_result2;
	}

	public String getSms_error() {
		return sms_error;
	}

	public void setSms_error(String sms_error) {
		this.sms_error = sms_error;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	@Override
	public String toString() {
		return "Sms_tb [sms_seq=" + sms_seq + ", sms_messages=" + sms_messages + ", sms_userName=" + sms_userName
				+ ", sms_tell=" + sms_tell + ", sms_sendDate=" + sms_sendDate + ", sms_adminId=" + sms_adminId
				+ ", sms_division=" + sms_division + ", sms_result=" + sms_result + ", sms_result2=" + sms_result2
				+ ", sms_error=" + sms_error + ", etc=" + etc + "]";
	}

}
