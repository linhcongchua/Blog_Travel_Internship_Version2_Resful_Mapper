package blog_travel.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import blog_travel.controller.model.Account;

public class AccountMapper implements IRowMapper<Account>{

	public Account mapRow(ResultSet rs) {
		Account account=new Account();
		try {
			account.setAccountID(rs.getInt("accountID"));
			account.setUsername(rs.getString("username"));
			account.setPassword(rs.getString("password"));
			account.setFullname(rs.getString("fullname"));
			account.setPhone(rs.getString("phone"));
			account.setRolename(rs.getString("rolename"));
			System.out.println(account.getFullname());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return null;
		}
		return account;
	}
}
