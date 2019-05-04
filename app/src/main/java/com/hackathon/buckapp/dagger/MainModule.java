package com.hackathon.buckapp.dagger;

import com.hackathon.buckapp.User;

//@Module
public class MainModule {

//    @Provides
    User providesUser() {
        return new User();
    }

}
