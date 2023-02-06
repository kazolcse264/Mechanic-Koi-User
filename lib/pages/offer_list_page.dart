import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/service_provider.dart';
import '../utils/helper_functions.dart';
import 'offer_details_page.dart';

class OfferListPage extends StatelessWidget {
  static const String routeName = '/offer_list_page';
  const OfferListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OfferListPage'),),
      body: Consumer<ServiceProvider>(
        builder: (context, provider, child) => ListView.builder(
          itemCount: provider.offerModelList.length,
          itemBuilder: (context, index) {
            final offerModel = provider.offerModelList[index];
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: () =>  Navigator.pushNamed(context, OfferDetailsPage.routeName,arguments: offerModel.offerId),
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        offerModel.thumbnailImageModel.imageDownloadUrl,
                      ),
                    ),
                    tileColor: Colors.tealAccent.shade100,
                    title: Text(
                      offerModel.offerName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      getFormattedDate(offerModel
                          .offerExpiredDateModel.timestamp
                          .toDate()),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
