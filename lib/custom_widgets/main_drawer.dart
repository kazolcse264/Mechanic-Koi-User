import 'package:flutter/material.dart';
import 'package:mechanic_koi/pages/Others/how_it_work.dart';
import 'package:mechanic_koi/pages/Others/privacy_policy.dart';
import 'package:mechanic_koi/pages/contact_us.dart';
import 'package:mechanic_koi/pages/order_list_page.dart';
import 'package:mechanic_koi/pages/profile_page.dart';
import 'package:mechanic_koi/pages/settings.dart';
import 'package:mechanic_koi/pages/total_expenses_page.dart';
import 'package:mechanic_koi/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../auth/auth_service.dart';
import '../pages/book_service_page.dart';
import '../pages/launcher_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 150,
            color: const Color(0xFF2B2B2B).withOpacity(0.75),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  shadowColor: const Color(0xFF2B2B2B),
                  child: (userProvider.userModel == null) ? Image.asset(
                    'assets/images/profile.png',height: 80,width: 80,
                  ) : Image.network(
                userProvider.userModel!
                    .imageUrl ??
                    'https://avatars.githubusercontent.com/u/74205867?v=4',
                    height: 80,
                    width: 80,
                ),
                /*CircleAvatar(
                  child: Image.asset(
                    'assets/images/profile.png',
                  ),
                  radius: 30,
                ),*/
                ),
                 Text(
                  userProvider.userModel?.displayName ??'User Name',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                 Text(
                  userProvider.userModel?.email ??'user@gmail.com',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18.0,top: 8),
            child: Text('Menu',style: TextStyle(color: Colors.grey,fontSize: 20),),
          ),
          const Divider(
            height: 5,
            thickness: 2,
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, ProfilePage.routeName);
            },
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: const Text('My Profile'),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, BookServicePage.routeName,arguments:userProvider.userModel);
            },
            leading: const CircleAvatar(child: Icon(Icons.bookmark)),
            title: const Text('Book Service'),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
        /*  ListTile(
            onTap: () {},
            leading: const CircleAvatar(child: Icon(Icons.card_giftcard)),
            title: const Text('Offer/Coupons'),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),*/
         /* ListTile(
            onTap: () {},
            leading: const CircleAvatar(child: Icon(Icons.share)),
            title: const Text('Share/Referral'),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),*/
        /*  ListTile(
            onTap: () {},
            leading: const CircleAvatar(child: Icon(Icons.notifications)),
            title: const Text('Notification'),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),*/
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, TotalExpensesPage.routeName);
            },
            leading: const CircleAvatar(child: Icon(Icons.payment)),
            title: const Text('Payment'),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, OrderListPage.routeName);
            },
            leading: const CircleAvatar(child: Icon(Icons.shopping_cart)),
            title: const Text('My Orders'),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18.0,top: 8),
            child: Text('Others',style: TextStyle(color: Colors.grey,fontSize: 20),),
          ),
          const Divider(
            height: 5,
            thickness: 2,
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, HowItWorkPage.routeName);
            },
            leading: CircleAvatar(
              child: Image.asset(
                'assets/icons/fork.png',height: 30,width: 30,color: Colors.white,
              ),
            ),
            title: const Text('How it work'),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, ContactUsPage.routeName);
            },
            leading: const CircleAvatar(child: Icon(Icons.location_on)),
            title: const Text('Contact Us'),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, PrivacyPolicyPage.routeName);
            },
            leading: const CircleAvatar(child: Icon(Icons.privacy_tip)),
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, SettingsPage.routeName);
            },
            leading: const CircleAvatar(child: Icon(Icons.settings)),
            title: const Text('Settings'),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          /*ListTile(
            onTap: () {},
            leading: const CircleAvatar(child: Icon(Icons.support)),
            title: const Text('Support'),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),*/
          ListTile(
            onTap: () {
              AuthService.logout().then((value) =>
                  Navigator.pushReplacementNamed(
                      context, LauncherPage.routeName));
            },
            leading: const CircleAvatar(child: Icon(Icons.logout)),
            title: const Text('Logout'),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
    );
  }
}
