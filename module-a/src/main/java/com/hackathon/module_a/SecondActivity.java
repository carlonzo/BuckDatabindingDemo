package com.hackathon.module_a;

import android.app.Activity;
import android.os.Bundle;
import android.view.LayoutInflater;

import androidx.annotation.Nullable;

import com.hackathon.module_a.databinding.SecondActivityBinding;

public class SecondActivity extends Activity {


    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        SecondActivityBinding secondActivityBinding = SecondActivityBinding.inflate(LayoutInflater.from(this));
        setContentView(secondActivityBinding.getRoot());

        LabelModelA labelModelA = new LabelModelA();
        labelModelA.setName("Hi Model A");

        secondActivityBinding.setLabelA(labelModelA);
    }
}
