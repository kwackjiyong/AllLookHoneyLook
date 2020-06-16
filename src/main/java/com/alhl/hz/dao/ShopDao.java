package com.alhl.hz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alhl.hz.dto.ShopDTO;
@Repository
public class ShopDao implements IShopDao {

	@Autowired
	public SqlSessionTemplate mybatis;
	

}
