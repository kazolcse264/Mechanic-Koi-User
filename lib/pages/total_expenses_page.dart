import 'package:flutter/material.dart';
import 'package:mechanic_koi/models/book_service_model.dart';
import 'package:mechanic_koi/utils/constants.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/cart_item_view.dart';
import '../providers/service_provider.dart';

class TotalExpensesPage extends StatelessWidget {
  static const String routeName = '/expense';
  const TotalExpensesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final totalExpense = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: const Text('Total Expenses Page'),),
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
                  if(orderModel.paymentStatus == true){
                    return CartItemView(
                      orderModel: orderModel,
                      serviceProvider: provider,
                    );
                  }
                  return Text('');
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Card(
                color: kPrimaryColor,
                child: Center(child: (totalExpense == null) ? const Text(''):Text('Total Expenses :  ${totalExpense.toString()} $currencySymbol',style: const TextStyle(fontSize: 25,color: Colors.white),)),
              ),
            )

          ],
        ),
      ),
    );
  }
}
