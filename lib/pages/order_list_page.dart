import 'package:flutter/material.dart';
import 'package:mechanic_koi/providers/service_provider.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/cart_item_view.dart';

class OrderListPage extends StatelessWidget {
  static const String routeName = '/order_page';
  const OrderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order list Page'),
        centerTitle: true,
      ),
      body: Consumer<ServiceProvider>(
        builder: (context, provider, child) => Column(
          children: [
            const Card(
              child: Image(
                height: 200,
                width: double.infinity,
                image: AssetImage('assets/images/card.png',),
              )
            ),
            Expanded(
              child: ListView.builder(
                itemCount: provider.bookServiceList.length,
                itemBuilder: (context, index) {
                  final orderModel = provider.bookServiceList[index];
                  return CartItemView(
                    orderModel: orderModel,
                    serviceProvider: provider,
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
