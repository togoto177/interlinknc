package com.homepage.interlink.model;

import java.sql.Date;

public class Board {

	private int board_seq;
	private String board_division;
	private String board_title;
	private String board_content;
	private int board_hit;
	private String board_use_yn;
	private String board_writer;
	private Date board_registerdate;
	private String board_updateid;
	private Date board_update_date;
	private String board_etc;
	
	private int seq; //마지막 추가된 auto increament값 반환
	
	private String file_ori_name; //file_tb에서 파일명 가져와서 뿌려줌
	private String file_sub_name; //file_tb에서 파일명 가져와서 뿌려줌
	
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	public String getBoard_division() {
		return board_division;
	}
	public void setBoard_division(String board_division) {
		this.board_division = board_division;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public int getBoard_hit() {
		return board_hit;
	}
	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}
	public String getBoard_use_yn() {
		return board_use_yn;
	}
	public void setBoard_use_yn(String board_use_yn) {
		this.board_use_yn = board_use_yn;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public Date getBoard_registerdate() {
		return board_registerdate;
	}
	public void setBoard_registerdate(Date board_registerdate) {
		this.board_registerdate = board_registerdate;
	}
	public String getBoard_updateid() {
		return board_updateid;
	}
	public void setBoard_updateid(String board_updateid) {
		this.board_updateid = board_updateid;
	}
	public Date getBoard_update_date() {
		return board_update_date;
	}
	public void setBoard_update_date(Date board_update_date) {
		this.board_update_date = board_update_date;
	}
	public String getBoard_etc() {
		return board_etc;
	}
	public void setBoard_etc(String board_etc) {
		this.board_etc = board_etc;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
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
	@Override
	public String toString() {
		return "Board [board_seq=" + board_seq + ", board_division=" + board_division + ", board_title=" + board_title
				+ ", board_content=" + board_content + ", board_hit=" + board_hit + ", board_use_yn=" + board_use_yn
				+ ", board_writer=" + board_writer + ", board_registerdate=" + board_registerdate + ", board_updateid="
				+ board_updateid + ", board_update_date=" + board_update_date + ", board_etc=" + board_etc + ", seq="
				+ seq + "]";
	}
	
	
	
	
}
