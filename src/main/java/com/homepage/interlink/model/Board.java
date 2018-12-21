package com.homepage.interlink.model;

import java.sql.Date;

public class Board {

	//게시판 전체 공통 부분
	
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
	
	
	private String file_ori_name; //file_tb에서 파일명 가져와서 뿌려줌
	private String file_sub_name; //file_tb에서 파일명 가져와서 뿌려줌
	private String file_path;     //file_tb에서 파일명 가져와서 뿌려줌
	
	private String file_hit; //파일 다운로드 수
	
	private String preview;
	private String nextview;
	private String pretitle;
	private String nexttitle;
	
	private String file_cnt; //파일 갯수 
	
	//포트폴리오 모델 추가
	private int portfolio_seq;
	private String business_period;
	private String buyer;
	private String link;
	private String portfolio_etc;
	private String pf_division;
	private String pf_year;
	private String seq_division; //홀수행 짝수행 구분을 위해 추가
	
	//고객센터 모델 추가
	private int customer_seq;
	private String user_id;
	private String user_email;
	private String user_contact;
	private String status;
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
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getFile_hit() {
		return file_hit;
	}
	public void setFile_hit(String file_hit) {
		this.file_hit = file_hit;
	}
	public String getPreview() {
		return preview;
	}
	public void setPreview(String preview) {
		this.preview = preview;
	}
	public String getNextview() {
		return nextview;
	}
	public void setNextview(String nextview) {
		this.nextview = nextview;
	}
	public String getPretitle() {
		return pretitle;
	}
	public void setPretitle(String pretitle) {
		this.pretitle = pretitle;
	}
	public String getNexttitle() {
		return nexttitle;
	}
	public void setNexttitle(String nexttitle) {
		this.nexttitle = nexttitle;
	}
	public String getFile_cnt() {
		return file_cnt;
	}
	public void setFile_cnt(String file_cnt) {
		this.file_cnt = file_cnt;
	}
	public int getPortfolio_seq() {
		return portfolio_seq;
	}
	public void setPortfolio_seq(int portfolio_seq) {
		this.portfolio_seq = portfolio_seq;
	}
	public String getBusiness_period() {
		return business_period;
	}
	public void setBusiness_period(String business_period) {
		this.business_period = business_period;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getPortfolio_etc() {
		return portfolio_etc;
	}
	public void setPortfolio_etc(String portfolio_etc) {
		this.portfolio_etc = portfolio_etc;
	}
	public String getPf_division() {
		return pf_division;
	}
	public void setPf_division(String pf_division) {
		this.pf_division = pf_division;
	}
	public String getPf_year() {
		return pf_year;
	}
	public void setPf_year(String pf_year) {
		this.pf_year = pf_year;
	}
	public String getSeq_division() {
		return seq_division;
	}
	public void setSeq_division(String seq_division) {
		this.seq_division = seq_division;
	}
	public int getCustomer_seq() {
		return customer_seq;
	}
	public void setCustomer_seq(int customer_seq) {
		this.customer_seq = customer_seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_contact() {
		return user_contact;
	}
	public void setUser_contact(String user_contact) {
		this.user_contact = user_contact;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Board [board_seq=" + board_seq + ", board_division=" + board_division + ", board_title=" + board_title
				+ ", board_content=" + board_content + ", board_hit=" + board_hit + ", board_use_yn=" + board_use_yn
				+ ", board_writer=" + board_writer + ", board_registerdate=" + board_registerdate + ", board_updateid="
				+ board_updateid + ", board_update_date=" + board_update_date + ", board_etc=" + board_etc
				+ ", file_ori_name=" + file_ori_name + ", file_sub_name=" + file_sub_name + ", file_path=" + file_path
				+ ", file_hit=" + file_hit + ", preview=" + preview + ", nextview=" + nextview + ", pretitle="
				+ pretitle + ", nexttitle=" + nexttitle + ", file_cnt=" + file_cnt + ", portfolio_seq=" + portfolio_seq
				+ ", business_period=" + business_period + ", buyer=" + buyer + ", link=" + link + ", portfolio_etc="
				+ portfolio_etc + ", pf_division=" + pf_division + ", pf_year=" + pf_year + ", seq_division="
				+ seq_division + ", customer_seq=" + customer_seq + ", user_id=" + user_id + ", user_email="
				+ user_email + ", user_contact=" + user_contact + ", status=" + status + "]";
	}
	
	
	
	
	
}
