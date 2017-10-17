package com.xtoucher.service;

import java.util.List;

import com.xtoucher.model.AdModel;
import com.xtoucher.model.NewsModel;

public interface AdService {

	public List<AdModel> queryList();
	
	public AdModel adModel(String id);
	
	public void addAd(AdModel adModel);
	
	public void updateAd(AdModel adModel);
	
	public void deleteAd(String id);
	
	public List<NewsModel> queryNews();
	
	public NewsModel newsModel(String id);
	
	public void addNews(NewsModel newsModel);
	
	public void updateNews(NewsModel newsModel);
	
	public void deleteNews(String id);
				
}
