package com.xtoucher.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtoucher.dao.DogDao;
import com.xtoucher.dao.UserDao;
import com.xtoucher.model.DogModel;
import com.xtoucher.model.UserModel;
import com.xtoucher.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private DogDao dogDao;

	public List<UserModel> queryUser() {
		// TODO Auto-generated method stub
		return userDao.queryUser();
	}

	public UserModel queryUserDetailed(String id) {
		// TODO Auto-generated method stub
		return userDao.queryUserDetailed(id);
	}

	public DogModel getDog(String dogId) {
		// TODO Auto-generated method stub
		return dogDao.queryDog(dogId);
	}

}
