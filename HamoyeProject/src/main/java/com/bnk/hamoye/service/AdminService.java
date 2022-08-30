package com.bnk.hamoye.service;

import java.sql.SQLException;
import java.util.List;

import com.bnk.hamoye.domain.User;

public interface AdminService {
	List<User> getAllUser() throws SQLException;
}
