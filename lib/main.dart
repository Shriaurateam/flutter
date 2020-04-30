

import 'package:flutter/material.dart';
import 'package:flutterworld/pages/home.dart';
import 'package:flutterworld/pages/choose_location.dart';
import 'package:flutterworld/pages/loading.dart';

void main() => runApp(MaterialApp(
initialRoute: '/',
  routes: {
    '/':(context)=>Loading(),
    '/home':(context)=>Home(),
    '/location':(context)=>choose_location()
  },
));
