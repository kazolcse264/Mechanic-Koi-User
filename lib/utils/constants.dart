import 'package:flutter/material.dart';
import 'package:mechanic_koi/models/address_model.dart';
import 'package:mechanic_koi/models/user_model.dart';

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
const List userProfileField = [
  userFieldDisplayName,
  userFieldPhone,
  userFieldEmail,
  '$userFieldAddressModel.$addressFieldCity',
  '$userFieldAddressModel.$addressFieldZipcode',
  '$userFieldAddressModel.$addressFieldAddressLine1',
  '$userFieldAddressModel.$addressFieldAddressLine2',
  userFieldGender,
  userFieldAge,
];

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

const String privacy = 'This Privacy Policy describes Our policies and procedures on the collection, '
    'use and disclosure of Your information when You use the Service and tells You about Your privacy'
    ' rights and how the law protects You.\n\n'
    'We use Your Personal data to provide and improve the Service. By using the Service, '
    'You agree to the collection and use of information in accordance with this Privacy Policy.';

const String interpretation = 'The words of which the initial letter is capitalized have'
    ' meanings defined under the following conditions. The following definitions shall '
    'have the same meaning regardless of whether they appear in singular or in plural.';

const String definitions = 'For the purposes of this Privacy Policy:\n\n'
    '\t* Account means a unique account created for You to access our Service or parts of our Service.\n\n'
    '\t* Affiliate means an entity that controls, is controlled by or is under common control with a party, '
    'where "control" means ownership of 50% or more of the shares, equity interest or other securities '
    'entitled to vote for election of directors or other managing authority.\n\n '
    '\t* Application refers to Mechanic Koi, the software program provided by the Company.\n\n'
    '\t* Company (referred to as either "the Company", "We", "Us" or "Our" in this Agreement)'
    'refers to Mechanic Koi.\n\n \t* Country refers to: Bangladesh .\n\n '
    '\t* Device means any device that can access the Service such as a computer, a cellphone or a digital tablet.\n\n  '
    '\t* Personal Data is any information that relates to an identified or identifiable individual.\n\n '
    '\t* Service refers to the Application.\n\n '
    '\t* Service Provider means any natural or legal person who processes the data '
    'on behalf of the Company. It refers to third-party companies or '
    'individuals employed by the Company to facilitate the Service, to provide '
    'the Service on behalf of the Company, to perform services related to the '
    'Service or to assist the Company in analyzing how the Service is used.\n\n '
    '\t* Usage Data refers to data collected automatically, either generated by the '
    'use of the Service or from the Service infrastructure itself (for example, the duration of a page visit). \n\n '
    '\t* You means the individual accessing or using the Service, or the company, '
    'or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.';

const String personalData = 'While using Our Service, We may ask You to provide Us with certain personally '
    'identifiable information that can be used to contact or identify You. '
    'Personally identifiable information may include, but is not limited to:\n\n'
    '\t\t* Email address\n'
    '\t\t* First name and last name\n'
    '\t\t* Phone number\n'
    '\t\t* Address, State, Province, ZIP/Postal code, City\n'
    '\t\t* Usage Data\n';

const String usageData = 'Usage Data is collected automatically when using the Service.\n\n'
    'Usage Data may include information such as Your Device\'s Internet Protocol'
    'address (e.g. IP address), browser type, browser version, the pages of our '
    'Service that You visit, the time and date of Your visit, the time spent on '
    'those pages, unique device identifiers and other diagnostic data.\n\n'
    'When You access the Service by or through a mobile device, We may collect'
    'certain information automatically, including, but not limited to, the type of'
    'mobile device You use, Your mobile device unique ID, the IP address of Your'
    'mobile device, Your mobile operating system, the type of mobile Internet'
    'browser You use, unique device identifiers and other diagnostic data.\n\n'
    'We may also collect information that Your browser sends whenever You visit our'
    'Service or when You access the Service by or through a mobile device.';

const String updatePolicy = 'We may update Our Privacy Policy from time to time. We will notify You of any'
    'changes by posting the new Privacy Policy on this page.\n\n'
    'We will let You know via email and/or a prominent notice on Our Service, prior'
    'to the change becoming effective and update the "Last updated" date at the top'
    'of this Privacy Policy.\n\n'
    'You are advised to review this Privacy Policy periodically for any changes.'
    'Changes to this Privacy Policy are effective when they are posted on this page.';

const String contact = 'If you have any questions about this Privacy Policy, You can contact us:\n\n '
    '\t\t* By email: admin@gmail.com';