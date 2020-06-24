package com.alhl.hz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alhl.hz.dto.ShopDTO;
import com.alhl.hz.dto.Shop_ProductDTO;
import com.alhl.hz.dto.UserDTO;
@Repository
public class ShopDao implements IShopDao {

	@Autowired
	public SqlSessionTemplate mybatis;
	@Override
	public ShopDTO shopSelectOne(UserDTO dto) {
		return mybatis.selectOne("shopMapper.shopSelectOne_user", dto);
	}
	@Override
	public int shopUpdateOne(ShopDTO dto) {
		return mybatis.update("shopMapper.shopUpdate_outTime", dto);
	}
	@Override
	public int shopUpdate_reCount(ShopDTO dto) {
		return mybatis.update("shopMapper.shopUpdate_reCount", dto);
	}
	@Override
	public List<Shop_ProductDTO> shopProduct_info() {
		return mybatis.selectList("shopMapper.shopProduct_info");
	}
	@Override
	public int shopInsert_user(ShopDTO dto) {
		return mybatis.update("shopMapper.shopInsert_user", dto);
	}
	
	
}
