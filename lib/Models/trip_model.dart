import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
@JsonSerializable()
class Trip {
  int trip_id;
  String logo_image;
  String trip_day;
   String office_name;
   double ticket_price;
   String status;
   String attendance_time;
   String waiting_time;
   String departure_time;
   String bus_type;
    String? departure_city;
   String ?arrival_city;
   Trip({this.logo_image="",
   this.ticket_price=1,
   this.trip_id=1,
   this.office_name="",
   this.attendance_time="",
   this.bus_type="",
   this.departure_city="",
   this.departure_time="",
   this.arrival_city="",
   this.trip_day="",
   this.status="",
  this. waiting_time="",
   });
   
         factory Trip.fromJson(Map<String,dynamic>jsonDate)
         {
           return Trip(
              trip_id:jsonDate['trip_id'] , 
             logo_image:jsonDate['logo_image'] , 
             office_name:jsonDate['office_name'],  
             attendance_time:jsonDate['attendance_time'],  
             bus_type:jsonDate['bus_type'],  
             departure_city:jsonDate['departure_city'],  
             ticket_price:jsonDate['ticket_price'],  
             departure_time:jsonDate['departure_time'],  
             arrival_city:jsonDate['arrival_city'],  
             trip_day:jsonDate['trip_day'],  
             status:jsonDate['status'],  
             waiting_time:jsonDate['waiting_time']);
         }

 
}
