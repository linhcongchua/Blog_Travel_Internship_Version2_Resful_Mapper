package blog_travel.service.impl;

import javax.inject.Inject;

import blog_travel.controller.dao.IAccountDAO;
import blog_travel.controller.dao.impl.AccountDAO;
import blog_travel.controller.model.Account;
import blog_travel.service.IAccountService;

public class AccountService implements IAccountService {
	@Inject
	private IAccountDAO accountDAO;

	@Override
	public Account findByUsernameAndPassword(String username, String password) {
		return accountDAO.findOne(username, password);
	}

	@Override
	public Account findByAccountID(Integer AccountID) {
		return accountDAO.findOne(AccountID);
	}
	
	
}
