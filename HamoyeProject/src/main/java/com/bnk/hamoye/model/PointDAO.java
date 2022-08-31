package com.bnk.hamoye.model;

import java.sql.SQLException;
import java.util.Map;

import com.bnk.hamoye.domain.Point;

public interface PointDAO {
	int insertPoint(Point point) throws SQLException; //포인트 추가
	int updateTotalPoint(Map<String, String>map) throws SQLException; //포인트 변경
	int deletePoint(String userId) throws SQLException;  //포인트 삭제
}
