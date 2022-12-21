import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controllers/methods.dart';
import '../models/user.dart';

//Methods for handling any logic on the homepage of the app is handled here

User createUser(String name, int age) {
  //Takes input string and int to create a new User object from the model found in the models directory
  User newUser = User(name: name, age: age);
  return newUser;
}

void increaseAge(User user) {
  //Takes a User object as a parameter and increments the age attribute up by 1
  int age = user.age! + 1;

  user.age = age;
}