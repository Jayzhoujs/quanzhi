package com.xtoucher.service;

import com.xtoucher.model.DogModel;

public interface PersonalService {

	DogModel getDogInfoByKeyWord(String IDNum, String registrationNum);

	int logOff(String iDNum, String registrationNum, String dogId, String reason);
}
