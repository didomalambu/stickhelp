import 'package:flutter/material.dart';

class Task {
  const Task({this.date,this.icon,this.title,this.colorIcon,this.name,this.statue});
  final String date;
  final  IconData icon;
  final String title;
  final Color colorIcon;
  final String name;
  final String statue;
}