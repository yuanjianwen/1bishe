package com.model;

/**
 * TMaijia entity. @author MyEclipse Persistence Tools
 */

public class TMaijia implements java.io.Serializable {

	// Fields

	private Integer id;
	private String loginname;
	private String loginpw;
	private String xingming;
	
	private String xingbie;
	private String dianhua;
	private String zhuzhi;
	private String tai;
	
	private String del;

	// Constructors

	/** default constructor */
	public TMaijia() {
	}

	/** full constructor */
	public TMaijia(String loginname, String loginpw, String xingming,
			String xingbie, String dianhua, String zhuzhi, String tai,
			String del) {
		this.loginname = loginname;
		this.loginpw = loginpw;
		this.xingming = xingming;
		this.xingbie = xingbie;
		this.dianhua = dianhua;
		this.zhuzhi = zhuzhi;
		this.tai = tai;
		this.del = del;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLoginname() {
		return this.loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getLoginpw() {
		return this.loginpw;
	}

	public void setLoginpw(String loginpw) {
		this.loginpw = loginpw;
	}

	public String getXingming() {
		return this.xingming;
	}

	public void setXingming(String xingming) {
		this.xingming = xingming;
	}

	public String getXingbie() {
		return this.xingbie;
	}

	public void setXingbie(String xingbie) {
		this.xingbie = xingbie;
	}

	public String getDianhua() {
		return this.dianhua;
	}

	public void setDianhua(String dianhua) {
		this.dianhua = dianhua;
	}

	public String getZhuzhi() {
		return this.zhuzhi;
	}

	public void setZhuzhi(String zhuzhi) {
		this.zhuzhi = zhuzhi;
	}

	public String getTai() {
		return this.tai;
	}

	public void setTai(String tai) {
		this.tai = tai;
	}

	public String getDel() {
		return this.del;
	}

	public void setDel(String del) {
		this.del = del;
	}

}