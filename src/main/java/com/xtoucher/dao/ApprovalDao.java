package com.xtoucher.dao;

import java.util.List;

import com.xtoucher.model.ApprovalModel;

import org.apache.ibatis.annotations.Param;

/**
 * 申报审批相关的Dao
 * @author so123
 *
 */
public interface ApprovalDao {

	void submit(ApprovalModel approvalModel);

	public List<String> queryApproval();

	void updateApproval(@Param(value="id")String id,@Param(value="status")String status);

	void deleteByDogId(String dogId);



	

}