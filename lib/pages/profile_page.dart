import 'package:flutter/material.dart';
import 'package:mechanic_koi/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
import '../utils/widget_function.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: const Color(0xFF2B2B2B).withOpacity(0.5),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60,
                        child: (userProvider.userModel == null) ? Image.asset('assets/images/profile.png') : CircleAvatar(
                          backgroundImage: NetworkImage(userProvider
                              .userModel!
                              .imageUrl ??
                              'https://avatars.githubusercontent.com/u/74205867?v=4'),
                          radius: 60,
                        ),
                      ),
                      Positioned(
                        left: 100,
                        right: 0,
                        top: 80,
                        child: CircleAvatar(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_a_photo,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                          },
                          icon: const Icon(Icons.person),
                          label: const Text(
                            'PROFILE',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                child: (userProvider.userModel == null) ? null : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: const Text('Full Name'),
                      trailing: Text(
                          userProvider.userModel!.displayName ??
                              'Not Set Yet'),
                    ),
                    ListTile(
                      title: const Text('Phone'),
                      trailing: Text(
                          userProvider.userModel!.phone ??
                              'Not Set Yet'),
                    ),
                    ListTile(
                      title: const Text('Email Address'),
                      trailing:
                      Text(userProvider.userModel!.email),
                    ),
                    ListTile(
                      title: const Text('Address'),
                      trailing: Text(
                          userProvider.userModel!.addressModel ==
                              null
                              ? 'Not Set Yet'
                              : userProvider.userModel!.addressModel!.addressLine1 ??'Not Set Yet'),
                    ),
                    ListTile(
                      title: const Text('Age'),
                      trailing:(userProvider.userModel!.age == null ) ? const Text('Not Set Yet') : Text(
                          userProvider.userModel!.age.toString(),),
                    ),
                    ListTile(
                      title: const Text('Gender'),
                      trailing: Text(
                          userProvider.userModel!.gender ??
                              'Not Set Yet'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 4.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:const Color(0xFF2B2B2B).withOpacity(0.75),
                ),
                onPressed: () {
                  showMultipleTextFieldInputDialog(
                    context: context,
                    title: 'You Must fill the all field and don\'t forgot the email address as you logged in before.',
                    onSubmit: (value) {
                      // Here value is a list
                      for (var i = 0; i < value.length; i++) {
                        userProvider.updateUserProfileField(
                            userProfileField[i], value[i]);
                      }
                    },
                  );
                },
                child: const Text('EDIT PROFILE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
