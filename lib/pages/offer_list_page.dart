import 'package:flutter/material.dart';

class OfferListPage extends StatelessWidget {
  static const String routeName = '/offer_list_page';
  const OfferListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OfferListPage'),),
    );
  }
}
