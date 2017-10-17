package com.xtoucher.service;

import java.util.List;

import com.xtoucher.model.AdModel;
import com.xtoucher.model.ForbiddenModel;
import com.xtoucher.model.NewsModel;
import com.xtoucher.model.ProcessModel;
import com.xtoucher.model.RegulationModel;


public interface IndexService {

	List<AdModel> getAdList();

	List<NewsModel> getNewsList();

	List<NewsModel> getNewsMore(int currentPage);

	NewsModel getNewsDetailById(String id);

	RegulationModel getRegulation();

	ForbiddenModel dogForbidden();

	ProcessModel process();


}
