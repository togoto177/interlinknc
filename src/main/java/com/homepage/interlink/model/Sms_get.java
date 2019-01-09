package com.homepage.interlink.model;

public class Sms_get {
	private int sms_get_no;
	private String result;
	private String seqNum;
	private String userCode;
	private String deptCode;
	private String phone;
	private String recvTime;
	private String reqPhone;
	private String error;
	private String etc;

	public int getSms_get_no() {
		return sms_get_no;
	}

	public void setSms_get_no(int sms_get_no) {
		this.sms_get_no = sms_get_no;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getSeqNum() {
		return seqNum;
	}

	public void setSeqNum(String seqNum) {
		this.seqNum = seqNum;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRecvTime() {
		return recvTime;
	}

	public void setRecvTime(String recvTime) {
		this.recvTime = recvTime;
	}

	public String getReqPhone() {
		return reqPhone;
	}

	public void setReqPhone(String reqPhone) {
		this.reqPhone = reqPhone;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	@Override
	public String toString() {
		return "Sms_get [sms_get_no=" + sms_get_no + ", result=" + result + ", seqNum=" + seqNum + ", userCode="
				+ userCode + ", deptCode=" + deptCode + ", phone=" + phone + ", recvTime=" + recvTime + ", reqPhone="
				+ reqPhone + ", error=" + error + ", etc=" + etc + "]";
	}

}
