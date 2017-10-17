package com.xtoucher.model;

/**
 * 
 * @author 张煜
 * 
 * @version <br>
 *          实体类为警务地区表
 * 
 */

public class BranchModel {
	private String id;
	private String name;
	private String parentId;
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	

	
	
}