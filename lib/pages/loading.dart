import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterworld/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
 String time='loading';

void setuptime() async{
  WorldTime instance=WorldTime(location: 'IND',flag: 'IND.png',url: 'Asia/Kolkata');
  await instance.getdata();
  print(instance.time);
  setState(() {
    time=instance.time;
  });
  Navigator.pushReplacementNamed(context, '/home',arguments:{
    'location':instance.location,
    'flag':instance.flag,
    'time':instance.time,
    'isDaytime':instance.isDaytime,
  });
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setuptime();
    print('run');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      )

    );
  }
}
