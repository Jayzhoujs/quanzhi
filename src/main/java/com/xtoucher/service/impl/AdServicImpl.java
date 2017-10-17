package com.xtoucher.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtoucher.dao.AdDao;
import com.xtoucher.dao.NewsDao;
import com.xtoucher.model.AdModel;
import com.xtoucher.model.NewsModel;
import com.xtoucher.service.AdService;

@Service
public class AdServicImpl implements AdService {

	@Autowired
	private AdDao adDao;
	@Autowired
	private NewsDao newsDao;

	public List<AdModel> queryList() {
		// TODO Auto-generated method stub
		return adDao.getList();
	}
	
	public AdModel adModel(String id) {
		// TODO Auto-generated method stub
		return adDao.queryAd(id);
	}

	public void addAd(AdModel adModel) {
		// TODO Auto-generated method stub
		adDao.addAd(adModel);
	}

	public void updateAd(AdModel adModel) {
		// TODO Auto-generated method stub
		adDao.updateAd(adModel);
	}

	public void deleteAd(String id) {
		// TODO Auto-generated method stub
		adDao.deleteAd(id);
	}

	public List<NewsModel> queryNews() {
		// TODO Auto-generated method stub
		return newsDao.getNewsList();
	}

	public NewsModel newsModel(String id) {
		// TODO Auto-generated method stub
		return newsDao.getNewsDetailById(id);
	}

	public void addNews(NewsModel newsModel) {
		// TODO Auto-generated method stub
		Date date = new Date();
		SimpleDateFormat ysdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String hTime = ysdf.format(date);
		newsModel.setCreateTime(hTime);
		newsDao.addNews(newsModel);
	}

	public void updateNews(NewsModel newsModel) {
		// TODO Auto-generated method stub
		Date date = new Date();
		SimpleDateFormat ysdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String hTime = ysdf.format(date);
		newsModel.setCreateTime(hTime);
		newsDao.updateNews(newsModel);
	}

	public void deleteNews(String id) {
		// TODO Auto-generated method stub
		newsDao.deleteNews(id);
	}

	

}
