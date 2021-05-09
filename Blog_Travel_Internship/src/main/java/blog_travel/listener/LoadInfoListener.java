package blog_travel.listener;

import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class LoadInfoListener implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ResourceBundle rd=ResourceBundle.getBundle("db");
		String numberPostInPage=rd.getString("numberOfPage");
		int npip=Integer.parseInt(numberPostInPage);
		ServletContext contex = sce.getServletContext();
		contex.setAttribute("npip", npip);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}

}
