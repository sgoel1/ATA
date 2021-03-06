package com.ata.util;




import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.object.SqlQuery;
import org.springframework.stereotype.Repository;

import com.ata.bean.CredentialsBean;
import com.ata.bean.ProfileBean;



@Repository
public class UserImpl implements User {
		
	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	Authentication authentication;
	
	@Transactional
	@Override
	public String login(CredentialsBean credentialsBean) {
		System.out.println("======Inside Login Implementation======");
		System.out.println(credentialsBean.getUserID()+" "+credentialsBean.getPassword());
		boolean v=authentication.authenticate(credentialsBean);
		if(v==true){
			//String val=authentication.authorize(credentialsBean.getUserID());
			//if(val.equals("valid")){
				CredentialsBean bean=(CredentialsBean)sessionFactory.getCurrentSession().get(CredentialsBean.class, credentialsBean.getUserID());
				bean.setLoginStatus(1);
				sessionFactory.getCurrentSession().update(bean);
			    return bean.getUserType();
		//	}
			    //else 
				//return "already"  // here 'already' will come in case user is alredy loggedin
		}
		return "invalid";
	}

	
	@Transactional
	@Override
	public boolean logout(String userId) {
		CredentialsBean credentialsBean=(CredentialsBean)sessionFactory.getCurrentSession().get(CredentialsBean.class,userId);
		if(credentialsBean!=null){
			credentialsBean.setLoginStatus(0);
			sessionFactory.getCurrentSession().update(credentialsBean);
			return true;
		}
		return false;
	}

	@Override
	public String changePassword(CredentialsBean credentialsBean,
			String newPassword) {
		
		return null;
	}
	
	@Transactional
	@Override
	public String register(ProfileBean profileBean) {
		
		String s=Character.toString(profileBean.getFirstName().charAt(0)).toUpperCase();
		String d=Character.toString(profileBean.getLastName().charAt(0)).toUpperCase();
		Query q=sessionFactory.getCurrentSession().createSQLQuery("Select userID from ata_tbl_id");
		int val=(int) q.list().get(0);
	    profileBean.setUserID(s+d+val);
	    CredentialsBean credbean=new CredentialsBean();
	    credbean.setUserID(s+d+val);
	    credbean.setPassword(profileBean.getPassword());
	    credbean.setLoginStatus(0);
	    credbean.setUserType("C");
	    sessionFactory.getCurrentSession().save(credbean);
		sessionFactory.getCurrentSession().save(profileBean);
		SQLQuery query=sessionFactory.getCurrentSession().createSQLQuery("update ata_tbl_id set userid=userid+1");
		query.executeUpdate();
		return "Your Login-ID is : "+profileBean.getUserID();
	}

	@Transactional
	@Override
	public ProfileBean getuser(String userID) {
		ProfileBean profileBean=(ProfileBean)sessionFactory.getCurrentSession().get(ProfileBean.class,userID);
		if(profileBean!=null){
			return profileBean;
		}
		return null;
	}

}
