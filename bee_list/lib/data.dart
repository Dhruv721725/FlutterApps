import 'package:bee_list/components/models.dart';

Map<String,Map<String,List<Map<String,dynamic>>>> Data = {
  "Daily Essentials":{
    "Notifications": [
      {
        "text": "Check your daily tasks.",
        "time": DateTime.now(),
        "day" : weekDays()[1],
        "hr"  : 22,
        "min" : 20,
      },
      {
        "text": "",
        "time": DateTime.now(),
        "day" : weekDays()[7],
        "hr"  : 22,
        "min" : 25,
      }
    ],
    "Notes":[
      {
        "text": "This is a text for notes 1st text box",
        "time": DateTime.now(),
      },
      {
        "text": "This is a text for notes 2nd text box, aur bhai log maza aarha hai ki nhi",
        "time": DateTime.now(),
      },
      {
        "text": "This is a text for notes 3rd text box, kya bolti public machna hai kya hungama",
        "time": DateTime.now(),
      },
    ],
    "Items":[
      {
        "text": "Tooth Brush",
        "check": false,
      },
      {
        "text": "Tooth Paste",
        "check": false,
      },
      {
        "text": "Soap",
        "check": false,
      },
      {
        "text": "Face Wash",
        "check": true,
      },
      {
        "text": "Shampoo",
        "check": false,
      },
    ] 
  },

  "Clothings":{
    "Notifications": [
      {
        "text": "Be well dressed.",
        "time": DateTime.now(),
        "day" : weekDays()[0],
        "hr"  : 22,
        "min" : 20,
      },
      {
        "text": "Don't forget Hankey",
        "time": DateTime.now(),
        "day" : weekDays()[2],
        "hr"  : 22,
        "min" : 20,
      }
    ],
    "Notes":[
      {
        "text": "Before leaving pack ur all daily clothings.",
        "time": DateTime.now(),
      },
      {
        "text": "Pack clothings in a folded manner so that they can be easily accessed and allow sapce fo rother goods as well.",
        "time": DateTime.now(),
      },
      {
        "text": "As it's a winter try to wear more clothings on urself and stay covered.",
        "time": DateTime.now(),
      },
    ],
    "Items":[
      {
        "text": "Shirt",
        "check": false,
      },
      {
        "text": "Chinos",
        "check": false,
      },
      {
        "text": "Tshirts",
        "check": false,
      },
      {
        "text": "Jeans",
        "check": true,
      },
      {
        "text": "Hoodies",
        "check": false,
      },
    ] 
  },
  "Food & Snacks":{
    "Notifications": [],
    "Notes":[],
    "Items":[]
  },
  "Medicines":{},
  "Documents":{},
  "Shoes":{},
  "Tools":{}
};