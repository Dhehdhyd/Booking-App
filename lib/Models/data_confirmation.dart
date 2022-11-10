import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
@JsonSerializable()
class Data_confirmation {
  String ticket_image;
  String booking_number;
 
   Data_confirmation({this.ticket_image="",
   this.booking_number="",
  
   });
   
         factory Data_confirmation.fromJson(Map<String,dynamic>jsonDate)
         {
           return Data_confirmation(
             ticket_image:jsonDate['ticket_image'] , 
             booking_number:jsonDate['booking_number'],  
             
            );
         }

 
}
