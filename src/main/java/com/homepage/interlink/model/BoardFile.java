package com.homepage.interlink.model;

import java.sql.Date;

public class BoardFile {

	private int file_seq;
	private int board_seq;
	private String file_ori_name;
	private String file_sub_name;
	private String extention_name;
	private String file_size;
	private String file_hit;
	private String file_path;
	private String file_use_yn;
	private String file_updateid;
	private Date file_update_date;
	private String file_etc;
	
	public int getFile_seq() {
		return file_seq;
	}
	public void setFile_seq(int file_seq) {
		this.file_seq = file_seq;
	}
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	public String getFile_ori_name() {
		return file_ori_name;
	}
	public void setFile_ori_name(String file_ori_name) {
		this.file_ori_name = file_ori_name;
	}
	public String getFile_sub_name() {
		return file_sub_name;
	}
	public void setFile_sub_name(String file_sub_name) {
		this.file_sub_name = file_sub_name;
	}
	public String getExtention_name() {
		return extention_name;
	}
	public void setExtention_name(String extention_name) {
		this.extention_name = extention_name;
	}
	public String getFile_size() {
		return file_size;
	}
	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}
	public String getFile_hit() {
		return file_hit;
	}
	public void setFile_hit(String file_hit) {
		this.file_hit = file_hit;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getFile_use_yn() {
		return file_use_yn;
	}
	public void setFile_use_yn(String file_use_yn) {
		this.file_use_yn = file_use_yn;
	}
	public String getFile_updateid() {
		return file_updateid;
	}
	public void setFile_updateid(String file_updateid) {
		this.file_updateid = file_updateid;
	}
	public Date getFile_update_date() {
		return file_update_date;
	}
	public void setFile_update_date(Date file_update_date) {
		this.file_update_date = file_update_date;
	}
	public String getFile_etc() {
		return file_etc;
	}
	public void setFile_etc(String file_etc) {
		this.file_etc = file_etc;
	}
	@Override
	public String toString() {
		return "BoardFile [file_seq=" + file_seq + ", board_seq=" + board_seq + ", file_ori_name=" + file_ori_name
				+ ", file_sub_name=" + file_sub_name + ", extention_name=" + extention_name + ", file_size=" + file_size
				+ ", file_hit=" + file_hit + ", file_path=" + file_path + ", file_use_yn=" + file_use_yn
				+ ", file_updateid=" + file_updateid + ", file_update_date=" + file_update_date + ", file_etc="
				+ file_etc + "]";
	}
	
	
	
}
