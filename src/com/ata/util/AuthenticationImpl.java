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
		ProfileBean profileBean=(ProfileBean)sessionFactory.getCurrentSession().get(ProfileBean.class,credentialsBean.getUserID());
		if(profileBean!=null){
			if(profileBean.getPassword().equals(credentialsBean.getPassword()))
				return true;
			else
				return false;
		}
		return false;
	}

	@Override
	public String authorize(String userID) {
		if(userID.equals("SK1000"))
			return "A";
		else
			return "C";
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

}
