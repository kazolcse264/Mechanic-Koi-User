import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF2B2B2B);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const String currencySymbol = '৳';
const double defaultPadding = 16.0;
abstract class PaymentStatus{
  static const String  pending= 'Pending';
  static const String  confirmed= 'Confirmed';
  static const String  canceled= 'Canceled';
}
abstract class NotificationType {
  static const String comment = 'New Comment';
  static const String order = 'New Order';
  static const String user = 'New User';
}


const List<String> imageGalleryList = [
  'assets/images/gallery/1.jpg',
  'assets/images/gallery/2.jpg',
  'assets/images/gallery/3.jpg',
  'assets/images/gallery/4.jpg',
  'assets/images/gallery/5.jpg',
  'assets/images/gallery/6.jpg',
  'assets/images/gallery/7.jpg',
  'assets/images/gallery/8.jpg',
  'assets/images/gallery/9.jpg',
  'assets/images/gallery/10.jpg',
  'assets/images/gallery/11.jpg',
  'assets/images/gallery/12.jpg',
  'assets/images/gallery/13.jpg',
  'assets/images/gallery/14.jpg',
  'assets/images/gallery/15.jpg',
  'assets/images/gallery/16.jpg',
  'assets/images/gallery/17.jpg',
  'assets/images/gallery/18.jpg',
  'assets/images/gallery/19.jpg',
  'assets/images/gallery/20.jpg',
];