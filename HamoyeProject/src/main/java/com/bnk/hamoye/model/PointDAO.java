package com.bnk.hamoye.model;

import java.util.Map;

import com.bnk.hamoye.domain.Point;

public interface PointDAO {
	int insertPoint(Point point) throws Exception; //포인트 추가
	int updateTotalPoint(Map<String, String>map) throws Exception; //포인트 변경
	int deletePoint(String userId) throws Exception;  //포인트 삭제
	int getPointSum() throws Exception; //포인트 총액 조회
}
