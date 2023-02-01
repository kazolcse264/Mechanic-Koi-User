import 'package:flutter/material.dart';
import 'package:mechanic_koi/utils/constants.dart';

import '../models/book_service_model.dart';
import '../providers/service_provider.dart';

class CartItemView extends StatelessWidget {
  BookServiceModel orderModel;
  ServiceProvider serviceProvider;

  CartItemView(
      {super.key, required this.orderModel, required this.serviceProvider});

  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18.0,
        right: 18.0,
        top: 4.0,
      ),
      child: Card(
        elevation: 20,
        shadowColor: Colors.grey.shade600,
        color: Colors.white,
        child: SizedBox(
          height: 130,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Service Id : ${orderModel.bookServiceId}',
                  style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 18), //Textstyle
                ),
              ),
              const Divider(thickness: 3),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'Category : ${orderModel.categoryModel.categoryName}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ), //Textstyle
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'Service Name : ${orderModel.subcategoryModel.serviceName} ',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text(
                            'Total Cost ',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.teal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                         Align(
                          child: (orderModel.paymentStatus == true)  ? const Text(
                            'Confirmed',
                            style: TextStyle(
                                color: Colors.green, fontSize: 20,fontWeight: FontWeight.w500,), //Textstyle
                          ) : const Text(
                            'Pending',
                            style: TextStyle(
                                color: Colors.red, fontSize: 20,fontWeight: FontWeight.w500,), //Textstyle
                          ),
                        ),
                        const Text(''),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '$currencySymbol ${orderModel.subcategoryModel.servicePrice}',
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ), //Padding
        ), //SizedBox
      ),
    );
  }
}
