import 'package:flutter/material.dart';
import 'package:mechanic_koi/custom_widgets/main_drawer.dart';
import 'package:mechanic_koi/pages/order_list_page.dart';
import 'package:mechanic_koi/pages/profile_page.dart';
import 'package:mechanic_koi/pages/total_expenses_page.dart';
import 'package:mechanic_koi/providers/service_provider.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/bottom_nav_bar_wrapper_page.dart';
import '../providers/user_provider.dart';
import 'contact_us.dart';
import 'offer_list_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    Provider.of<UserProvider>(context, listen: false).getUserInfo();
    Provider.of<ServiceProvider>(context, listen: false).getAllCategories();
    Provider.of<ServiceProvider>(context, listen: false).getAllSubCategories();
    Provider.of<ServiceProvider>(context, listen: false).getAllOrders();
    Provider.of<ServiceProvider>(context, listen: false).getAllEmployees();
    Provider.of<ServiceProvider>(context, listen: false).getAllOffers();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final serviceProvider = Provider.of<ServiceProvider>(context);
    final size = MediaQuery.of(context).size;
    final totalExpense = Provider.of<ServiceProvider>(context).totalExpenses;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MainDrawer(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFF2B2B2B),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.miscellaneous_services_rounded),
            Text('SERVICE')
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, ProfilePage.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: (userProvider.userModel == null)
                    ? Image.asset('assets/images/profile.png')
                    : Image.network(
                        userProvider.userModel!.imageUrl ??
                            'https://avatars.githubusercontent.com/u/74205867?v=4',
                        height: 28,
                        width: 28,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              height: size.height * 0.2,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 56,
                    ),
                    height: size.height * 0.2 - 75,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2B2B2B),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 54,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 50,
                            color: const Color(0xFF2B2B2B).withOpacity(0.23),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/profile.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, OfferListPage.routeName),
                    child: SizedBox(
                      height: size.height / 4,
                      width: size.width / 2 - 15,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5,
                        shadowColor: const Color(0xFF2B2B2B),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Total Offers',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children:  [
                                const Icon(
                                  Icons.card_giftcard,
                                  color: Colors.lightBlue,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  serviceProvider.offerModelList.length.toString(),
                                  style: const TextStyle(
                                      fontSize: 30, color: Colors.lightBlue),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, OrderListPage.routeName),
                    child: SizedBox(
                      height: size.height / 4,
                      width: size.width / 2 - 15,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5,
                        shadowColor: const Color(0xFF2B2B2B),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Total Orders',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.shopping_cart,
                                  color: Colors.lightBlue,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  serviceProvider.bookServiceList.length
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 30, color: Colors.lightBlue),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, ContactUsPage.routeName),
                    child: SizedBox(
                      height: size.height / 4,
                      width: size.width / 2 - 15,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5,
                        shadowColor: const Color(0xFF2B2B2B),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'About Us',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(
                                  Icons.construction,
                                  color: Colors.lightBlue,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.lightBlue),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, TotalExpensesPage.routeName,arguments: totalExpense),
                    child: SizedBox(
                      height: size.height / 4,
                      width: size.width / 2 - 15,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5,
                        shadowColor: const Color(0xFF2B2B2B),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Total Expenses',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/icons/taka_icon.png',
                                  height: 25,
                                  width: 25,
                                  color: Colors.lightBlue,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  totalExpense.toString(),
                                  style: const TextStyle(
                                      fontSize: 30, color: Colors.lightBlue),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /*Container(
                height: 400,
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  itemCount: homePageViewModelList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0),
                  itemBuilder: (BuildContext context, int index) {
                    final model = homePageViewModelList[index];
                    return InkWell(
                      onTap: () => Navigator.pushNamed(context, model.routeName),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5,
                        shadowColor: Color(0xFF2B2B2B),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Text(
                              model.title,
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children:  [
                                Icon(model.iconData),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                 serviceProvider.bookServiceList.length.toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )),*/
          ],
        ),
      ),
    );
  }
}
