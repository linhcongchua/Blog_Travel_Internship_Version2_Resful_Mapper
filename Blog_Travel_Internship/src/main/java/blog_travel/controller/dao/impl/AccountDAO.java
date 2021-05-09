package blog_travel.controller.dao.impl;

import java.util.List;

import blog_travel.controller.dao.IAccountDAO;
import blog_travel.controller.model.Account;
import blog_travel.mapper.AccountMapper;

public class AccountDAO extends GenericDAO<Account> implements IAccountDAO {

	@Override
	public Account findOne(Integer AccountID) {
		String sql = "SELECT * FROM Account WHERE AccountID=? AND Status=1";
		List<Account> accounts = query(sql, new AccountMapper(), AccountID);
		return accounts.isEmpty() ? null : accounts.get(0);
	}

	@Override
	public Account findOne(String username, String password) {
		String sql = "SELECT * FROM Account A JOIN Role R ON A.RoleID=R.RoleID WHERE Username=? AND Password=?  AND Status=1";
		List<Account> accounts = query(sql, new AccountMapper(), username, password);
		return accounts == null ? null : accounts.isEmpty() ? null : accounts.get(0);
	}

}
