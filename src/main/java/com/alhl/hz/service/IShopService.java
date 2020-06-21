package com.alhl.hz.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.alhl.hz.dto.ShopDTO;
import com.alhl.hz.dto.Shop_ProductDTO;
import com.alhl.hz.dto.UserDTO;

public interface IShopService {
	public ShopDTO shopSelectOne(UserDTO dto);
	public int shopUpdateOne(ShopDTO dto);
	public int shopUpdate_reCount(ShopDTO dto);
	public List<Shop_ProductDTO> shopProduct_info();
	public int shopInsert_user(ShopDTO dto);
}
