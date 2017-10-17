package com.xtoucher.dao;

/**
 * 禁养犬只Dao
 */

import com.xtoucher.model.DogForbiddenModel;

public interface DogForbiddenDao {

	
	public DogForbiddenModel queryDogFor();
	

	public int updateDogFor(DogForbiddenModel dogForbiddenModel);
	
	
}
