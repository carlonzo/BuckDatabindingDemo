package com.hackathon.buckapp.databinding;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.databinding.Bindable;
import androidx.databinding.DataBindingUtil;
import androidx.databinding.ViewDataBinding;
import com.hackathon.buckapp.User;
import java.lang.Deprecated;
import java.lang.Object;

public abstract class MainActivityLayoutBinding extends ViewDataBinding {
  @Bindable
  protected User mUser;

  protected MainActivityLayoutBinding(Object _bindingComponent, View _root, int _localFieldCount) {
    super(_bindingComponent, _root, _localFieldCount);
  }

  public abstract void setUser(@Nullable User user);

  @Nullable
  public User getUser() {
    return mUser;
  }

  @NonNull
  public static MainActivityLayoutBinding inflate(@NonNull LayoutInflater inflater,
      @Nullable ViewGroup root, boolean attachToRoot) {
    return inflate(inflater, root, attachToRoot, DataBindingUtil.getDefaultComponent());
  }

  /**
   * This method receives DataBindingComponent instance as type Object instead of
   * type DataBindingComponent to avoid causing too many compilation errors if
   * compilation fails for another reason.
   * https://issuetracker.google.com/issues/116541301
   * @Deprecated Use DataBindingUtil.inflate(inflater, R.layout.main_activity_layout, root, attachToRoot, component)
   */
  @NonNull
  @Deprecated
  public static MainActivityLayoutBinding inflate(@NonNull LayoutInflater inflater,
      @Nullable ViewGroup root, boolean attachToRoot, @Nullable Object component) {
    return ViewDataBinding.<MainActivityLayoutBinding>inflateInternal(inflater, com.hackathon.buckapp.R.layout.main_activity_layout, root, attachToRoot, component);
  }

  @NonNull
  public static MainActivityLayoutBinding inflate(@NonNull LayoutInflater inflater) {
    return inflate(inflater, DataBindingUtil.getDefaultComponent());
  }

  /**
   * This method receives DataBindingComponent instance as type Object instead of
   * type DataBindingComponent to avoid causing too many compilation errors if
   * compilation fails for another reason.
   * https://issuetracker.google.com/issues/116541301
   * @Deprecated Use DataBindingUtil.inflate(inflater, R.layout.main_activity_layout, null, false, component)
   */
  @NonNull
  @Deprecated
  public static MainActivityLayoutBinding inflate(@NonNull LayoutInflater inflater,
      @Nullable Object component) {
    return ViewDataBinding.<MainActivityLayoutBinding>inflateInternal(inflater, com.hackathon.buckapp.R.layout.main_activity_layout, null, false, component);
  }

  public static MainActivityLayoutBinding bind(@NonNull View view) {
    return bind(view, DataBindingUtil.getDefaultComponent());
  }

  /**
   * This method receives DataBindingComponent instance as type Object instead of
   * type DataBindingComponent to avoid causing too many compilation errors if
   * compilation fails for another reason.
   * https://issuetracker.google.com/issues/116541301
   * @Deprecated Use DataBindingUtil.bind(view, component)
   */
  @Deprecated
  public static MainActivityLayoutBinding bind(@NonNull View view, @Nullable Object component) {
    return (MainActivityLayoutBinding)bind(component, view, com.hackathon.buckapp.R.layout.main_activity_layout);
  }
}
