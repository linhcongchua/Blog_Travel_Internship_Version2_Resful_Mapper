package blog_travel.service;

import blog_travel.controller.model.Account;

public interface IAccountService {
	Account findByUsernameAndPassword(String username, String password);
	Account findByAccountID(Integer AccountID);
}
