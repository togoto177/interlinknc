package com.homepage.interlink.model;

public class Surem_admin {
	private int surem_admin_seq;
	private String surem_usercode;
	private String surem_deptcode;
	private String surem_tell;
	private String surem_reserved_time;
	private String surem_etc;

	public int getSurem_admin_seq() {
		return surem_admin_seq;
	}

	public void setSurem_admin_seq(int surem_admin_seq) {
		this.surem_admin_seq = surem_admin_seq;
	}

	public String getSurem_usercode() {
		return surem_usercode;
	}

	public void setSurem_usercode(String surem_usercode) {
		this.surem_usercode = surem_usercode;
	}

	public String getSurem_deptcode() {
		return surem_deptcode;
	}

	public void setSurem_deptcode(String surem_deptcode) {
		this.surem_deptcode = surem_deptcode;
	}

	public String getSurem_tell() {
		return surem_tell;
	}

	public void setSurem_tell(String surem_tell) {
		this.surem_tell = surem_tell;
	}

	public String getSurem_reserved_time() {
		return surem_reserved_time;
	}

	public void setSurem_reserved_time(String surem_reserved_time) {
		this.surem_reserved_time = surem_reserved_time;
	}

	public String getSurem_etc() {
		return surem_etc;
	}

	public void setSurem_etc(String surem_etc) {
		this.surem_etc = surem_etc;
	}

	@Override
	public String toString() {
		return "surem_admin [surem_admin_seq=" + surem_admin_seq + ", surem_usercode=" + surem_usercode
				+ ", surem_deptcode=" + surem_deptcode + ", surem_tell=" + surem_tell + ", surem_reserved_time="
				+ surem_reserved_time + ", surem_etc=" + surem_etc + "]";
	}

}
