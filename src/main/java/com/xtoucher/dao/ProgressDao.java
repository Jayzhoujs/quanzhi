package com.xtoucher.dao;

import com.xtoucher.model.ProgressHistoryModel;
import com.xtoucher.model.ProgressModel;

public interface ProgressDao {

	ProgressModel progressSearch(String IDNum,String phone);

	ProgressHistoryModel progressHistory(String approvalId);
}
