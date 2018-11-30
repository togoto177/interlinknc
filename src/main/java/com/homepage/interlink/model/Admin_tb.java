package com.homepage.interlink.model;

public class Admin_tb {
	private int ad_seq;
	private String ad_id;
	private String ad_password;
	private String ad_name;
	private String ad_contact; //연락처
	private String ad_email;
	private String ad_hiredate; //입사일
	private String ad_updateid;
	private String ad_update_date;
	private String ad_rank; //직급
	private String ad_etc;
	public int getAd_seq() {
		return ad_seq;
	}
	public void setAd_seq(int ad_seq) {
		this.ad_seq = ad_seq;
	}
	public String getAd_id() {
		return ad_id;
	}
	public void setAd_id(String ad_id) {
		this.ad_id = ad_id;
	}
	public String getAd_password() {
		return ad_password;
	}
	public void setAd_password(String ad_password) {
		this.ad_password = ad_password;
	}
	public String getAd_name() {
		return ad_name;
	}
	public void setAd_name(String ad_name) {
		this.ad_name = ad_name;
	}
	public String getAd_contact() {
		return ad_contact;
	}
	public void setAd_contact(String ad_contact) {
		this.ad_contact = ad_contact;
	}
	public String getAd_email() {
		return ad_email;
	}
	public void setAd_email(String ad_email) {
		this.ad_email = ad_email;
	}
	public String getAd_hiredate() {
		return ad_hiredate;
	}
	public void setAd_hiredate(String ad_hiredate) {
		this.ad_hiredate = ad_hiredate;
	}
	public String getAd_updateid() {
		return ad_updateid;
	}
	public void setAd_updateid(String ad_updateid) {
		this.ad_updateid = ad_updateid;
	}
	public String getAd_update_date() {
		return ad_update_date;
	}
	public void setAd_update_date(String ad_update_date) {
		this.ad_update_date = ad_update_date;
	}
	public String getAd_rank() {
		return ad_rank;
	}
	public void setAd_rank(String ad_rank) {
		this.ad_rank = ad_rank;
	}
	public String getAd_etc() {
		return ad_etc;
	}
	public void setAd_etc(String ad_etc) {
		this.ad_etc = ad_etc;
	}
	
	@Override
	public String toString() {
		return "admin_tb [ad_seq=" + ad_seq + ", ad_id=" + ad_id + ", ad_password=" + ad_password + ", ad_name="
				+ ad_name + ", ad_contact=" + ad_contact + ", ad_email=" + ad_email + ", ad_hiredate=" + ad_hiredate
				+ ", ad_updateid=" + ad_updateid + ", ad_update_date=" + ad_update_date + ", ad_rank=" + ad_rank
				+ ", ad_etc=" + ad_etc + "]";
	}
}
