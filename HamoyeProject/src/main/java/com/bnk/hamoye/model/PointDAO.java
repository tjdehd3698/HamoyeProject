package com.bnk.hamoye.model;

import java.sql.SQLException;
import java.util.Map;

import com.bnk.hamoye.domain.Point;

public interface PointDAO {
	int insertPoint(Point point) throws SQLException;
	int updateTotalPoint(Map<String, String>map) throws SQLException;
	int deletePoint(String userId) throws SQLException; 
}
