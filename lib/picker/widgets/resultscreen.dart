import 'package:flutter/material.dart';

import '../entities/location_result.dart';
class ResultsScreen extends StatelessWidget{
   final LocationResult? results; // Replace String with your result type
  ResultsScreen({ required this.results}); // Constructor to receive the results
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text('Print Location Result')),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text('Formatted Address: ${results?.formattedAddress}',style:const TextStyle(fontSize: 30) ),
             Text('Latitude: ${results?.latLng?.latitude}',style:const TextStyle(fontSize: 30)),
             Text('Longitude: ${results?.latLng?.longitude}',style:const TextStyle(fontSize: 30)),
             // Add more properties you want to print
           ],
         ),
       ),
     );
   }


}