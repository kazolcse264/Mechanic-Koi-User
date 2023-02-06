
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/service_provider.dart';
import '../utils/helper_functions.dart';


class OfferDetailsPage extends StatefulWidget {
  static const String routeName = '/offer_details';

  const OfferDetailsPage({Key? key}) : super(key: key);

  @override
  State<OfferDetailsPage> createState() => _OfferDetailsPageState();
}

class _OfferDetailsPageState extends State<OfferDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context);
    final offerId = ModalRoute.of(context)!.settings.arguments as String;
    final offerModel = serviceProvider.getOfferById(offerId);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Offer Details Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.card_giftcard,color: Colors.black,),
            title: const Text('Offer Name',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            subtitle: Text(offerModel.offerName),
          ),
          ListTile(
            leading: const Icon(Icons.category,color: Colors.black,),
            title: const Text('Category Name',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            subtitle: Text(offerModel.categoryModel.categoryName),
          ),
          ListTile(
            leading: const Icon(Icons.category,color: Colors.black,),
            title: const Text('Sub Category Name',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            subtitle: Text(offerModel.subcategoryModel.serviceName),
            trailing:Text('Cost : ${offerModel.subcategoryModel.servicePrice.toString()}',style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent,fontSize: 20),),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month,color: Colors.black,),
            title: const Text('Expired Date',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            subtitle: Text(getFormattedDate(
                offerModel.offerExpiredDateModel.timestamp.toDate())),
          ),
          ListTile(
            leading: const Icon(Icons.description,color: Colors.black,),
            title: const Text('Offer Description',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            subtitle: Text(offerModel.offerDescription),

          ),
          ListTile(
            leading: const Icon(Icons.currency_rupee,color: Colors.black,),
            title: const Text('Offer Price',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            subtitle: Text(offerModel.offerPrice.toString(),style: const TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold,fontSize: 20,),),
          ),
          ListTile(
            leading: Image.network(
              offerModel.thumbnailImageModel.imageDownloadUrl,
              height: 200,
              width: 50,
              fit: BoxFit.cover,
            ),
            title:const Text('Offer Banner Photo',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 20,
                shadowColor: Colors.grey.shade200,
                color: const Color(0xFF2B2B2B),
                child: TextButton(onPressed: (){

                }, child: const Text('Go to Book Service Page for booking this offer',style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),))),
          )
        ],
      ),
    );
  }
}
