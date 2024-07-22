import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

const tempData = [
  {"title": "Title1", "subTitle": "subTitle1", "imageUrl": "images/kanye.jpg"},
  {"title": "Title2", "subTitle": "subTitle2", "imageUrl": "images/heart2.jpg"},
  {"title": "Title3", "subTitle": "subTitle3", "imageUrl": "images/heart.jpg"},
  {"title": "Title4", "subTitle": "subTitle4", "imageUrl": "images/hahaha.jpg"},
];

const incidentTypes = [
  "Type 1",
  "Type 2",
  "Type 3",
  "Type 4",
  "Type 5",
  "Others"
];

const notifications = [
  {
    "title": "Incident Reported",
    "content": "Notification 1 Content",
    "icon": Ionicons.checkmark_circle,
    "color" : Colors.green
  },
  {
    "title": "Incident being Processed",
    "content": "Notification 2 Content",
    "icon": Ionicons.checkbox,
    "color" : Colors.yellow

  },
  {
    "title": "Incident Responded",
    "content": "Notification 3 Content",
    "icon": Ionicons.shield_checkmark,
    "color" : Colors.blue
  }
];