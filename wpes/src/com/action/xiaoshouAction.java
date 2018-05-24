package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.TGoodsDAO;
import com.dao.TOrderDAO;
import com.dao.TOrderItemDAO;
import com.model.TGoods;
import com.model.TMaijia;
import com.model.TOrderItem;
import com.opensymphony.xwork2.ActionSupport;

public class xiaoshouAction extends ActionSupport
{
	private TOrderItemDAO orderItemDAO;
	private TGoodsDAO goodsDAO;
	private TOrderDAO orderDAO;
	
	public String xiaoshouMine()
	{
		Map session= ServletActionContext.getContext().getSession();
		TMaijia maijia=(TMaijia)session.get("maijia");
		
		String ss=get_goods_list(maijia.getId());
		
	    String sql="from TOrderItem where goodsId in("+ss+") order by zt";
	    List orderItemList=orderItemDAO.getHibernateTemplate().find(sql);
	    for(int i=0;i<orderItemList.size();i++)
	    {
	    	TOrderItem orderItem=(TOrderItem)orderItemList.get(i);
	    	orderItem.setOrder(orderDAO.findById(orderItem.getOrderId()));
	    	orderItem.setGoods(goodsDAO.findById(orderItem.getGoodsId()));
	    }
	    
	    System.out.println(orderItemList.size()+"**");
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("orderItemList", orderItemList);
		return ActionSupport.SUCCESS;
		
	}
	
	
	
	public String shouli()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		int orderItemId=Integer.parseInt(request.getParameter("orderItemId"));
		
		TOrderItem orderItem=orderItemDAO.findById(orderItemId);
		orderItem.setZt("已受理");
		
		orderItemDAO.attachDirty(orderItem);
		
		request.setAttribute("msg", "受理完毕");
		return "msg";
		
		
	}
	
	
	public String get_goods_list(int maijiaId)
	{
		StringBuffer s=new StringBuffer();
		
		String sql="from TGoods where maijiaId="+maijiaId;
		List list=goodsDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<list.size();i++)
		{
			TGoods goods=(TGoods)list.get(i);
			s.append(goods.getGoodsId());
			s.append(",");
		}
		
		String ss = s.toString();
		
		return ss.substring(0,ss.length()-1);//删除最后一个逗号
	}


	public TOrderItemDAO getOrderItemDAO()
	{
		return orderItemDAO;
	}


	public void setOrderItemDAO(TOrderItemDAO orderItemDAO)
	{
		this.orderItemDAO = orderItemDAO;
	}


	public TGoodsDAO getGoodsDAO()
	{
		return goodsDAO;
	}


	public void setGoodsDAO(TGoodsDAO goodsDAO)
	{
		this.goodsDAO = goodsDAO;
	}


	public TOrderDAO getOrderDAO()
	{
		return orderDAO;
	}


	public void setOrderDAO(TOrderDAO orderDAO)
	{
		this.orderDAO = orderDAO;
	}
	
}
