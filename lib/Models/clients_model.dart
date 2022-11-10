import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
@JsonSerializable()
class Clients {
  String name_model;
  String image_model;
   String password_model;
   String phone_no_model;
   String iD_number_model;
   String ?birthyear_model;
   Clients({this.name_model="",
   this.image_model="",
   this.password_model="",
   this.phone_no_model="",
   this.iD_number_model="",
   this.birthyear_model="",
  
   });
   
         factory Clients.fromJson(Map<String,dynamic>jsonDate)
         {
           return Clients(
             name_model:jsonDate['name'] , 
             image_model:jsonDate['image'],  
             password_model:jsonDate['password'],  
             phone_no_model:jsonDate['phone_no'],  
             iD_number_model:jsonDate['iD_number'],  
             birthyear_model:jsonDate['birthyear'],  
            );
         }

 
}
