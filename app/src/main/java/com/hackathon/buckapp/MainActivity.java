package com.hackathon.buckapp;

import android.app.Activity;
import android.os.Bundle;
import android.view.LayoutInflater;

import com.hackathon.buckapp.databinding.MainActivityLayoutBinding;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

       MainActivityLayoutBinding inflate = MainActivityLayoutBinding.inflate(LayoutInflater.from(this));
       setContentView(inflate.getRoot());

        User user = new User();
        user.setName("Carlo");

        inflate.setUser(user);
    }

}
