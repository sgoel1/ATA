package com.ata.util;

import com.ata.bean.CredentialsBean;

public interface Authentication {
    public boolean authenticate(CredentialsBean credentialsBean);
    public String authorize(String userID);
    public boolean changeLoginStatus(CredentialsBean credentialsBean,int loginStatus);
}
