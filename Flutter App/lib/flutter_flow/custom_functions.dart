import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String? calculateDistance(
  LatLng currentLocation,
  String destinaltionLat,
  String destinaltionLng,
) {
  final double lat1 = currentLocation.latitude;
  final double lon1 = currentLocation.longitude;
  final double lat2 = double.parse(destinaltionLat);
  final double lon2 = double.parse(destinaltionLng);

  const double earthRadius = 6371; // Radius of the Earth in kilometers

  double degreesToRadians(double degrees) {
    return degrees * math.pi / 180.0;
  }

  // Convert latitude and longitude from degrees to radians
  double radLat1 = degreesToRadians(lat1);
  double radLon1 = degreesToRadians(lon1);
  double radLat2 = degreesToRadians(lat2);
  double radLon2 = degreesToRadians(lon2);

  double dLat = radLat2 - radLat1;
  double dLon = radLon2 - radLon1;

  double a = math.pow(math.sin(dLat / 2), 2) +
      math.cos(radLat1) * math.cos(radLat2) * math.pow(math.sin(dLon / 2), 2);

  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  // Distance in kilometers
  double distance = earthRadius * c;
  return distance.round().toString() + " km";
}

String noOfChargers(
  int battery1Available,
  int battery2Available,
) {
  if (battery1Available == 1 && battery2Available == 1) {
    return '2';
  } else if (battery1Available == 1 || battery2Available == 1) {
    return '1';
  } else {
    return '0';
  }
}

double calculateHeight(String percentage) {
  double height = 2.2;

  return height * double.parse(percentage);
}

LatLng convertToLatLng(
  String lat,
  String lng,
) {
  // Convert the string variables to doubles.
  double latDouble = double.parse(lat);
  double lngDouble = double.parse(lng);

  // Create a LatLng object.
  LatLng myLatLng = LatLng(latDouble, lngDouble);

  return myLatLng;
}
