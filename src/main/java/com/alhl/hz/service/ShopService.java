package com.alhl.hz.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alhl.hz.dao.INoticeDao;
import com.alhl.hz.dao.IShopDao;
import com.alhl.hz.dto.NoticeDTO;
import com.alhl.hz.dto.ShopDTO;
import com.alhl.hz.dto.Shop_ProductDTO;
import com.alhl.hz.dto.UserDTO;

@Service("IShopService")
public class ShopService implements IShopService{
	
	@Autowired
	public IShopDao dao;
	@Override
	public ShopDTO shopSelectOne(UserDTO dto) {
		return dao.shopSelectOne(dto);
	}
	@Override
	public int shopUpdateOne(ShopDTO dto) {
		return dao.shopUpdateOne(dto);
	}
	
	@Override
	public int shopUpdate_reCount(ShopDTO dto) {
		return dao.shopUpdate_reCount(dto);
	}
	
	@Override
	public List<Shop_ProductDTO> shopProduct_info() {
		return dao.shopProduct_info();
	}
}
