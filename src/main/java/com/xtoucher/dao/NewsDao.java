package com.xtoucher.dao;
/**
 * 新闻
 */


import java.util.List;

import com.xtoucher.model.NewsModel;



public interface NewsDao {

	List<NewsModel> getNewsList();

	List<NewsModel> getNewsMore(int currentPage);

	NewsModel getNewsDetailById(String id);

	public void addNews(NewsModel newsModel);
	
	void updateNews(NewsModel newsModel);
	
	void deleteNews(String id);
	
}
	