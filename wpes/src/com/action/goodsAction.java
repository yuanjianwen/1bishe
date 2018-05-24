package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.TCatelogDAO;
import com.dao.TGoodsDAO;
import com.model.TGoods;
import com.model.TMaijia;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class goodsAction extends ActionSupport
{
	private Integer goodsId;
	private Integer maijiaId;
	private String goodsName;
	private String goodsMiaoshu;

	private String goodsPic;
	private Integer goodsShichangjia;
	private Integer goodsTejia;
	private String goodsIsnottejia;
	
	private Integer goodsCatelogId;
	private String shifoumaichu;
	private String goodsDel;
	
	private String message;
	private String path;
	
	private TGoodsDAO goodsDAO;
	
	
	public String goodsAdd()
	{
		HttpServletRequest re=ServletActionContext.getRequest();
		String fujian=re.getParameter("fujian");
		Map session = ActionContext.getContext().getSession();
		TMaijia maijia=(TMaijia)session.get("maijia");
       
		TGoods goods=new TGoods();
		
		goods.setGoodsId(0);
		goods.setMaijiaId(maijia.getId());
		goods.setGoodsCatelogId(goodsCatelogId);
		goods.setGoodsName(goodsName);
		
		goods.setGoodsMiaoshu(goodsMiaoshu);
		goods.setGoodsPic((fujian.equals("")?"/img/zanwu.jpg":fujian));
		goods.setGoodsShichangjia(goodsShichangjia);
		goods.setGoodsTejia(goodsShichangjia);
		
		goods.setGoodsIsnottejia("no");
		goods.setShifoumaichu("否");
		goods.setGoodsDel("no");
		
		goodsDAO.save(goods);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "物品发布完毕");
		return "msg";
		
	}
	
	
	public String goodsMine()
	{
		Map session = ActionContext.getContext().getSession();
		TMaijia maijia=(TMaijia)session.get("maijia");
		
		String sql="from TGoods where goodsDel='no' and goodsIsnottejia='no' and maijiaId="+maijia.getId();
		List goodsList=goodsDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("goodsList", goodsList);
		return ActionSupport.SUCCESS;
	}
	
	public String goodsDel()
	{
		TGoods goods=goodsDAO.findById(goodsId);
		goods.setGoodsDel("yes");
		goodsDAO.attachDirty(goods);

		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "删除完毕");
		return "msg";
	}
	
	
	
	public String goodsMana()
	{
		String sql="from TGoods where goodsDel='no' and goodsIsnottejia='no' order by maijiaId";
		List goodsList=goodsDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("goodsList", goodsList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String goodsDetailHou()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		TGoods goods=goodsDAO.findById(goodsId);
		request.put("goods", goods);
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	public String goodsAllNoTejia()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
		
		String sql="from TGoods where goodsDel='no' and goodsIsnottejia='no' and shifoumaichu='否' order by goodsCatelogId";
		List goodsList=goodsDAO.getHibernateTemplate().find(sql);
		request.put("goodsList", goodsList);
		return ActionSupport.SUCCESS;
	}
	
	public String goodsDetailQian()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		TGoods goods=goodsDAO.findById(goodsId);
		
		request.put("goods", goods);
		return ActionSupport.SUCCESS;
	}
	
	
	public String goodsByCatelog()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
		
		String sql="from TGoods where goodsDel='no' and goodsIsnottejia='no' and goodsCatelogId=? and shifoumaichu='否' order by goodsCatelogId";
		Object[] con={goodsCatelogId};
		List goodsList=goodsDAO.getHibernateTemplate().find(sql,con);
		request.put("goodsList", goodsList);
		
		return ActionSupport.SUCCESS;
	}
	
	

	public Integer getGoodsId() {
		return goodsId;
	}


	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}


	public Integer getMaijiaId() {
		return maijiaId;
	}


	public void setMaijiaId(Integer maijiaId) {
		this.maijiaId = maijiaId;
	}


	public String getGoodsName() {
		return goodsName;
	}


	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}


	public String getGoodsMiaoshu() {
		return goodsMiaoshu;
	}


	public void setGoodsMiaoshu(String goodsMiaoshu) {
		this.goodsMiaoshu = goodsMiaoshu;
	}


	public String getGoodsPic() {
		return goodsPic;
	}


	public void setGoodsPic(String goodsPic) {
		this.goodsPic = goodsPic;
	}


	public Integer getGoodsShichangjia() {
		return goodsShichangjia;
	}


	public void setGoodsShichangjia(Integer goodsShichangjia) {
		this.goodsShichangjia = goodsShichangjia;
	}


	public Integer getGoodsTejia() {
		return goodsTejia;
	}


	public void setGoodsTejia(Integer goodsTejia) {
		this.goodsTejia = goodsTejia;
	}


	public String getGoodsIsnottejia() {
		return goodsIsnottejia;
	}


	public void setGoodsIsnottejia(String goodsIsnottejia) {
		this.goodsIsnottejia = goodsIsnottejia;
	}


	public Integer getGoodsCatelogId() {
		return goodsCatelogId;
	}


	public void setGoodsCatelogId(Integer goodsCatelogId) {
		this.goodsCatelogId = goodsCatelogId;
	}


	public String getShifoumaichu() {
		return shifoumaichu;
	}


	public void setShifoumaichu(String shifoumaichu) {
		this.shifoumaichu = shifoumaichu;
	}


	public String getGoodsDel() {
		return goodsDel;
	}


	public void setGoodsDel(String goodsDel) {
		this.goodsDel = goodsDel;
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


	public TGoodsDAO getGoodsDAO() {
		return goodsDAO;
	}


	public void setGoodsDAO(TGoodsDAO goodsDAO) {
		this.goodsDAO = goodsDAO;
	}
	
}
