package com.xtoucher.dao;
/**
 * 犬种类
 */

import java.util.List;

import com.xtoucher.model.DogBreedModel;

public interface DogBreedDao {
	public List<DogBreedModel> queryDogBreed();

	public void updateDogBreed(DogBreedModel dogBreedModel);

	public int deleteDogBreed(Integer id);

	public int saveDogBreed(DogBreedModel dogBreedModel);
}
