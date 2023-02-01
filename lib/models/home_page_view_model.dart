import 'package:flutter/material.dart';
import 'package:mechanic_koi/pages/order_list_page.dart';

import '../pages/contact_us.dart';
import '../pages/offer_list_page.dart';
import '../pages/total_expenses_page.dart';

class HomePageViewModel {
  final String title;
  final IconData iconData;
  final String routeName;

  const HomePageViewModel({
    required this.title,
    required this.iconData,
    required this.routeName,
  });
}

 List<HomePageViewModel> homePageViewModelList = [
  const HomePageViewModel(
      title: 'Offers',
      iconData: Icons.card_giftcard,
      routeName: OfferListPage.routeName),
  const HomePageViewModel(
      title: 'Total My Order',
      iconData: Icons.shopping_cart,
      routeName: OrderListPage.routeName),
  const HomePageViewModel(
      title: 'Contact Us',
      iconData: Icons.location_on,
      routeName: ContactUsPage.routeName),
  const HomePageViewModel(
      title: 'Expenses',
      iconData: Icons.monetization_on,
      routeName: TotalExpensesPage.routeName),
];