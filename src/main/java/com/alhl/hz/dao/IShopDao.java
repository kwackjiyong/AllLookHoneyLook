package com.alhl.hz.dao;

import java.util.List;

import com.alhl.hz.dto.ShopDTO;
import com.alhl.hz.dto.Shop_ProductDTO;
import com.alhl.hz.dto.UserDTO;

// [DB연결 사용법] 2. Dao인터페이스 생성
public interface IShopDao {
	public ShopDTO shopSelectOne(UserDTO dto);
	public int shopUpdateOne(ShopDTO dto);
	public int shopUpdate_reCount(ShopDTO dto);
	public List<Shop_ProductDTO> shopProduct_info();
}
