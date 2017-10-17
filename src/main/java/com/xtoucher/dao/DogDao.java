package com.xtoucher.dao;
/**
 * 犬信息
 */


import java.util.List;

import com.xtoucher.model.DogModel;
import com.xtoucher.model.PoliceApprovalModel;
import com.xtoucher.model.ProgressHistoryModel;

public interface DogDao {
	public List<DogModel> queryDogBreed();

	public void saveInfo(DogModel dog);

	public void update(DogModel dogTemp);

	public DogModel getDogInfoByKeyWord(String IDNum,String registrationNum);

	public int logOff(String iDNum, String registrationNum, String dogId,
			String reason);


	public DogModel queryDog(String Id);

	public List<PoliceApprovalModel> getApprovalList(Integer branchId);

	public List<PoliceApprovalModel> toApprovalSearch(Integer branchId,
			String IDNum,String realName);

	public List<PoliceApprovalModel> approvaledSearch(Integer branchId,
			String IDNum,String realName);

	public PoliceApprovalModel getApprovalById(Integer branchId, String id);

	public int approval(String id, String status);

	public void saveHistory(ProgressHistoryModel progressHistoryModel);

	public DogModel getDogInfoByKeyWord2(String iDNum, String registrationNum);
}
