package com.xtoucher.service;

import java.util.List;

import com.xtoucher.model.DogModel;
import com.xtoucher.model.UserModel;

public interface UserService {
	public List<UserModel> queryUser();

	public UserModel queryUserDetailed(String id);

	public DogModel getDog(String dogId);
}
