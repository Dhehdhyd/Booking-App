import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
@JsonSerializable()
class Clients {
  int client_id;
  String name_model;
  String image_model;
   String password_model;
   String phone_no_model;
   String iD_number_model;
   String ?birthyear_model;
   Clients({
   this.client_id=1,
     this.name_model="",
   this.image_model="",
   this.password_model="",
   this.phone_no_model="",
   this.iD_number_model="",
   this.birthyear_model="",
  
   });
   
         factory Clients.fromJson(Map<String,dynamic>jsonDate)
         {
           return Clients(
             client_id:jsonDate['user_id'] , 
             name_model:jsonDate['name'] , 
             image_model:jsonDate['identity_image'],  
             password_model:jsonDate['password'],  
             phone_no_model:jsonDate['phoneno'],  
             iD_number_model:jsonDate['identityno'],  
             birthyear_model:jsonDate['birthdate'],  
            );
         }

 
}
