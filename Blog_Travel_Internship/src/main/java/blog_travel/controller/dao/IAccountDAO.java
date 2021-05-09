package blog_travel.controller.dao;

import blog_travel.controller.model.Account;

public interface IAccountDAO extends IGenericDAO<Account>{
	Account findOne(Integer AccountID);
	Account findOne(String username, String password);
}
