package com.ata.util;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ata.bean.CredentialsBean;
import com.ata.bean.ProfileBean;

@Repository
public class AuthenticationImpl implements Authentication{
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean authenticate(CredentialsBean credentialsBean) {
		System.out.println("========Inside authenticate method===========");
		CredentialsBean bean=(CredentialsBean)sessionFactory.getCurrentSession().get(CredentialsBean.class, credentialsBean.getUserID());
		if(bean!=null)
			return true;
		else
			return false;
	}

	@Override
	public String authorize(String userID) {
		CredentialsBean credentialsBean=(CredentialsBean)sessionFactory.getCurrentSession().get(CredentialsBean.class, userID);
		if(credentialsBean.getLoginStatus()==1)
			return "invalid";
		else
			return "valid";
	}

	@Override
	public boolean changeLoginStatus(CredentialsBean credentialsBean,
			int loginStatus) {
		
		if(credentialsBean.getLoginStatus()==1 && loginStatus==0){
			credentialsBean.setLoginStatus(0);
		}
		else if(credentialsBean.getLoginStatus()==0 && loginStatus==1){
			credentialsBean.setLoginStatus(1);
		}
		
		return false;
	}

	@Override
	public String checkUserType(String UserID) {
		CredentialsBean credentialsBean=(CredentialsBean)sessionFactory.getCurrentSession().get(CredentialsBean.class, UserID);
		if(credentialsBean.getUserType().equals("A"))
			return "A";
		else
			return "C";
	}

}
