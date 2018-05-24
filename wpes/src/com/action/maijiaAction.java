package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TMaijiaDAO;
import com.model.TMaijia;
import com.opensymphony.xwork2.ActionSupport;

public class maijiaAction extends ActionSupport
{
	private Integer id;
	private String loginname;
	private String loginpw;
	private String xingming;
	
	private String xingbie;
	private String dianhua;
	private String zhuzhi;
	private String tai;
	
	private String del;
	
	private String message;
	private String path;
	
	private TMaijiaDAO maijiaDAO;
	
	
	public String maijiaReg()
	{
		TMaijia maijia=new TMaijia();

		maijia.setId(id);
		maijia.setLoginname(loginname);
		maijia.setLoginpw(loginpw);
		maijia.setXingming(xingming);
		
		maijia.setXingbie(xingbie);
		maijia.setDianhua(dianhua);
		maijia.setZhuzhi(zhuzhi);
		maijia.setTai("待审核");
		
		maijia.setDel("no");
		
		maijiaDAO.save(maijia);

		
		this.setMessage("注册完毕，等待管理员审核");
		this.setPath("qiantai/default.jsp");
		return "succeed";
	}
	
	public String maijiaManaDaishen()
	{
		String sql="from TMaijia where del='no' and tai='待审核'";
		List maijiaList=maijiaDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("maijiaList", maijiaList);
		return ActionSupport.SUCCESS;
	}
	
	public String maijiaManaYishen()
	{
		String sql="from TMaijia where del='no' and tai='已审核'";
		List maijiaList=maijiaDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("maijiaList", maijiaList);
		return ActionSupport.SUCCESS;
	}
	
	public String maijiaDel()
	{
		TMaijia maijia=maijiaDAO.findById(id);
		maijiaDAO.delete(maijia);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	public String maijiaShenhe()
	{
		TMaijia maijia=maijiaDAO.findById(id);
		maijia.setTai("已审核");
		maijiaDAO.attachDirty(maijia);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getLoginpw() {
		return loginpw;
	}

	public void setLoginpw(String loginpw) {
		this.loginpw = loginpw;
	}

	public String getXingming() {
		return xingming;
	}

	public void setXingming(String xingming) {
		this.xingming = xingming;
	}

	public String getXingbie() {
		return xingbie;
	}

	public void setXingbie(String xingbie) {
		this.xingbie = xingbie;
	}

	public String getDianhua() {
		return dianhua;
	}

	public void setDianhua(String dianhua) {
		this.dianhua = dianhua;
	}

	public String getZhuzhi() {
		return zhuzhi;
	}

	public void setZhuzhi(String zhuzhi) {
		this.zhuzhi = zhuzhi;
	}

	public String getTai() {
		return tai;
	}

	public void setTai(String tai) {
		this.tai = tai;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public TMaijiaDAO getMaijiaDAO() {
		return maijiaDAO;
	}

	public void setMaijiaDAO(TMaijiaDAO maijiaDAO) {
		this.maijiaDAO = maijiaDAO;
	}

}
