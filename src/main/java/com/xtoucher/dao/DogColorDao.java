package com.xtoucher.dao;
/**
 * 犬颜色
 */


import java.util.List;

import com.xtoucher.model.DogColorModel;

public interface DogColorDao {
	public List<DogColorModel> queryDogColor();

	public void updateDogColor(DogColorModel dogColorModel);

	public int deleteDogColor(Integer id);

	public int saveDogColor(DogColorModel dogColorModel);	
}
