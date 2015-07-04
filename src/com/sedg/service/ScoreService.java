package com.sedg.service;

import java.util.List;

import com.sedg.entity.Score;
import com.sedg.entity.ScoreDAO;
import com.sedg.util.PageService;

import lombok.Getter;
import lombok.Setter;

public class ScoreService {
	
	@Getter @Setter private ScoreDAO scoreDAO;
	
	/**
	 * 根据主键ID查找对象
	 */
	public Score loadScore(Integer id){
		return scoreDAO.findById(id);
	}
	/**
	 * 执行新增对象或修改对象的保存操作
	 */
	public void saveScore(Score score) {
		scoreDAO.merge(score);
	}
	/**
	 * 根据主键ID删除数据库中对象
	 */
	public void removeScore(Integer id) {
		scoreDAO.delete(scoreDAO.findById(id));
	}
	/**
	 * 根据用户ID查找积分
	 */
	@SuppressWarnings("unchecked")
	public List<Score> searchScoreByUser(Integer userId) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Score as s where s.user.userId = '" + userId + "' order by s.changeTime desc";
		String countHql="select count(*) "+selectHql;
		List<Score> list=PageService.searchByPage(selectHql, countHql, params, null, scoreDAO);
		return list;
	}
}
