package com.alhl.hz.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.alhl.hz.dto.ShopDTO;
import com.alhl.hz.dto.UserDTO;

public interface IShopService {
	public ShopDTO shopSelectOne(UserDTO dto);
	public int shopUpdateOne(ShopDTO dto);
	
}
