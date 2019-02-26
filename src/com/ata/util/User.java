package com.ata.util;



import com.ata.bean.CredentialsBean;
import com.ata.bean.ProfileBean;

public interface User {
	public String login(CredentialsBean credentialsBean);
	public boolean logout(String userId);
	public String changePassword(CredentialsBean credentialsBean,String newPassword);
	public String register(ProfileBean profileBean);
	public ProfileBean getuser(String userID);
}
