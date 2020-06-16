package com.alhl.hz.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alhl.hz.dao.INoticeDao;
import com.alhl.hz.dao.IShopDao;
import com.alhl.hz.dto.NoticeDTO;

@Service("IShopService")
public class ShopService implements IShopService{
	
	@Autowired
	public IShopDao dao;

}
