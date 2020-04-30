import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time;
  String flag;
  String url;
  bool isDaytime;

  WorldTime({this.location,this.flag,this.url});


  Future <void> getdata() async{
    try{
        Response resp=await get('http://worldtimeapi.org/api/timezone/$url');

        Map data=jsonDecode(resp.body);
        String datetime=data['datetime'];
        String off=data['utc_offset'].substring(1,3);

        DateTime now=DateTime.parse(datetime);
        now=now.add(Duration(hours: int.parse(off)));

        // print(now);

        time=DateFormat.jm().format(now);
        isDaytime=now.hour>6 && now.hour <14 ?true :false;
  }

  catch(e){
      print('Error - $e');
  }

  }
}

