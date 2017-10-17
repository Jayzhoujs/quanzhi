package com.xtoucher.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtoucher.dao.AdDao;
import com.xtoucher.dao.ForbiddenDao;
import com.xtoucher.dao.NewsDao;
import com.xtoucher.dao.ProcessDao;
import com.xtoucher.dao.RegulationDao;
import com.xtoucher.model.AdModel;
import com.xtoucher.model.ForbiddenModel;
import com.xtoucher.model.NewsModel;
import com.xtoucher.model.ProcessModel;
import com.xtoucher.model.RegulationModel;
import com.xtoucher.service.IndexService;

@Service  
public class IndexServiceImpl implements IndexService {

	private static Logger logger = Logger.getLogger(IndexServiceImpl.class);
	@Autowired  
	private AdDao adDao;
	@Autowired  
	private NewsDao newDao;
	@Autowired  
	private RegulationDao regulationDao;
	@Autowired  
	private ForbiddenDao forbiddenDao;
	@Autowired  
	private ProcessDao processDao;
	public List<AdModel> getAdList() {
		List<AdModel> adList=new ArrayList<AdModel>();
		adList=adDao.getList();
		return adList;
	}
	public List<NewsModel> getNewsList() {
		// TODO Auto-generated method stub
		List<NewsModel> list=new ArrayList<NewsModel>();
		list=newDao.getNewsList();
		return list;
	}
	public List<NewsModel> getNewsMore(int currentPage) {
		List<NewsModel> list=new ArrayList<NewsModel>();
		list=newDao.getNewsMore(currentPage*8);
		return list;
	}
	public NewsModel getNewsDetailById(String id) {
		NewsModel newsModel=new NewsModel();
		newsModel=newDao.getNewsDetailById(id);
		return newsModel;
	}
	public RegulationModel getRegulation() {
		RegulationModel regulationModel=new RegulationModel();
		regulationModel=regulationDao.getRegulation();
		return regulationModel;
	}
	public ForbiddenModel dogForbidden() {
		ForbiddenModel forbiddenModel=new ForbiddenModel();
		forbiddenModel=forbiddenDao.dogForbidden();
		return forbiddenModel;
	}
	public ProcessModel process() {
		ProcessModel processModel=new ProcessModel();
		processModel=processDao.process();
		return processModel;
	}
	
  
}
