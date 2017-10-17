package com.xtoucher.service;

import java.util.Map;

import com.xtoucher.model.ProgressModel;

public interface ProgressService {

	ProgressModel progressSearch(String IDNum,String phone);

	Map<String, Object> progressHistory(String approvalId);
}
