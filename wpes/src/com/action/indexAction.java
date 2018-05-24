package com.action;



import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TCatelogDAO;
import com.dao.TGoodsDAO;
import com.dao.TOrderItemDAO;
import com.model.TGoods;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.liuService;

public class indexAction extends ActionSupport
{
	private TGoodsDAO goodsDAO;
	private TCatelogDAO catelogDAO;
	private TOrderItemDAO orderItemDAO;
	
	
	public String index()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		Map session=ActionContext.getContext().getSession();
		
		
		String sql="from TGoods where goodsDel='no' and goodsIsnottejia='no' and shifoumaichu='·ñ' order by goodsId desc";
		List goodsNoTejiaList=goodsDAO.getHibernateTemplate().find(sql);
		if(goodsNoTejiaList.size()>8)
		{
			goodsNoTejiaList=goodsNoTejiaList.subList(0, 8);
		}
		request.put("goodsNoTejiaList", goodsNoTejiaList);
		
		
		
		
		sql="from TCatelog where catelogDel='no'";
		List cateLogList=catelogDAO.getHibernateTemplate().find(sql);
		session.put("cateLogList", cateLogList);
		
		
		
		List tuijianList=new ArrayList();
		List<Integer> idList=new ArrayList<Integer>();
		for(int i=0;i<goodsNoTejiaList.size();i++)
		{
			TGoods goods=(TGoods)goodsNoTejiaList.get(i);
			idList.add(goods.getGoodsId());
		}
		
		
		int[] ss=liuService.Random(idList, 4);
		for(int j=0;j<ss.length;j++)
		{
			int k=ss[j];
			tuijianList.add(goodsDAO.findById(k));
		}
		
		request.put("tuijianList", tuijianList);
		return ActionSupport.SUCCESS;
		
		
	}
	

	public TGoodsDAO getGoodsDAO()
	{
		return goodsDAO;
	}

	public void setGoodsDAO(TGoodsDAO goodsDAO)
	{
		this.goodsDAO = goodsDAO;
	}


	public TOrderItemDAO getOrderItemDAO()
	{
		return orderItemDAO;
	}


	public void setOrderItemDAO(TOrderItemDAO orderItemDAO)
	{
		this.orderItemDAO = orderItemDAO;
	}


	public TCatelogDAO getCatelogDAO()
	{
		return catelogDAO;
	}


	public void setCatelogDAO(TCatelogDAO catelogDAO)
	{
		this.catelogDAO = catelogDAO;
	}
	
	
}
