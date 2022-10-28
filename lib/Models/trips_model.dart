import '../Models/trip_model.dart';

class Trips{
  final List<dynamic> trips;
 Trips({ required trips}):trips=[8];
  factory Trips.fromJson(Map<String,dynamic>jsonData){
   return Trips(
     trips:jsonData['trips'],
   );
 }
}