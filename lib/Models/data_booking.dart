import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
@JsonSerializable()
class Booking {
  int trip_id;
  String office_name;
  String trip_day;
  String bus_access_station;
  String bus_starting_station;
   String price;
   String attendance_date;
   String wait_date;
   String start_date;
    String? from_city;
   String ?to_city;
  String booking_policy;
  String company_headquarters;
   String bank_account;
   String bank_name;
   Booking({this.office_name="",
   this.price="",
   this.trip_id=1,
   this.trip_day="",
   this.attendance_date="",
   this.bus_access_station="",
   this.from_city="",
   this.start_date="",
   this.to_city="",
   this.bus_starting_station="",
  this. wait_date="",
   this.booking_policy="",
   this.company_headquarters="",
   this.bank_account="",
  this. bank_name="",
   });
   
         factory Booking.fromJson(Map<String,dynamic>jsonDate)
         {
           return Booking(
              trip_id:jsonDate['trip_id'] , 
             office_name:jsonDate['office_name'] , 
             bus_access_station:jsonDate['arrival_station'],  
             attendance_date:jsonDate['attendance_time'],  
             bus_starting_station:jsonDate['departure_station'],  
             from_city:jsonDate['departure_city'],  
             price:jsonDate['ticket_price'],  
             start_date:jsonDate['departure_time'],  
             to_city:jsonDate['arrival_city'],  
             trip_day:jsonDate['trip_day'],  
             wait_date:jsonDate['waiting_time'],
             booking_policy:jsonDate['booking_policy'],  
             company_headquarters:jsonDate['location'],  
             bank_account:jsonDate['bank_account'],  
             bank_name:jsonDate['bank_name']);
         }

 
}
