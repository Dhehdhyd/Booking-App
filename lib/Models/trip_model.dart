import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
@JsonSerializable()
class Trip {
  int trip_id;
  String office_logo;
  String trip_day;
   String office_logo_image;
   double price;
   String trip_state;
   String attendance_date;
   String wait_date;
   String start_date;
   String bus_type;
    String? from_city;
   String ?to_city;
   Trip({this.office_logo="",
   this.price=1,
   this.trip_id=1,
   this.office_logo_image="",
   this.attendance_date="",
   this.bus_type="",
   this.from_city="",
   this.start_date="",
   this.to_city="",
   this.trip_day="",
   this.trip_state="",
  this. wait_date="",
   });
   
         factory Trip.fromJson(Map<String,dynamic>jsonDate)
         {
           return Trip(
              trip_id:jsonDate['trip_id'] , 
             office_logo:jsonDate['office_logo'] , 
             office_logo_image:jsonDate['office_logo_image'],  
             attendance_date:jsonDate['attendance_date'],  
             bus_type:jsonDate['bus_type'],  
             from_city:jsonDate['from_city'],  
             price:jsonDate['price'],  
             start_date:jsonDate['start_date'],  
             to_city:jsonDate['to_city'],  
             trip_day:jsonDate['trip_day'],  
             trip_state:jsonDate['trip_state'],  
             wait_date:jsonDate['wait_date']);
         }

 
}
