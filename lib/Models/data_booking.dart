import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
@JsonSerializable()
class Booking {
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
String traveler_name;
  String id_number;
  String booking_policy;
  String company_headquarters;
   String bank_account;
   String bank_name;
   Booking({this.office_name="",
   this.price="",
   this.trip_day="",
   this.attendance_date="",
   this.bus_access_station="",
   this.from_city="",
   this.start_date="",
   this.to_city="",
   this.bus_starting_station="",
   this.traveler_name="",
  this. wait_date="",
  this.id_number="",
   this.booking_policy="",
   this.company_headquarters="",
   this.bank_account="",
  this. bank_name="",
   });
   
         factory Booking.fromJson(Map<String,dynamic>jsonDate)
         {
           return Booking(
             office_name:jsonDate['office_name'] , 
             bus_access_station:jsonDate['bus_access_station'],  
             attendance_date:jsonDate['attendance_date'],  
             bus_starting_station:jsonDate['bus_starting_station'],  
             from_city:jsonDate['from_city'],  
             price:jsonDate['price'],  
             start_date:jsonDate['start_date'],  
             to_city:jsonDate['to_city'],  
             trip_day:jsonDate['trip_day'],  
             traveler_name:jsonDate['traveler_name'],  
             wait_date:jsonDate['wait_date'],
              id_number:jsonDate['id_number'],  
             booking_policy:jsonDate['booking_policy'],  
             company_headquarters:jsonDate['company_headquarters'],  
             bank_account:jsonDate['bank_account'],  
             bank_name:jsonDate['bank_name']);
         }

 
}
