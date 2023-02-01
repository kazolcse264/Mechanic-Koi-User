import 'package:flutter/material.dart';
import 'package:mechanic_koi/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
bool isProfile = true;
bool isBike = false;
bool isCredits = false;


  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
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
                        child: (userProvider.userModel == null) ? Image.asset('assets/images/profile.png') : Image.network(
                          userProvider.userModel!
                              .imageUrl ??
                              'https://avatars.githubusercontent.com/u/74205867?v=4',

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
              child: Container(
                height: 100,
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.white,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 55,
                          width: double.infinity,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            child: TextButton.icon(
                              onPressed: () {
                                setState(() {
                                  isProfile = true;
                                  isBike = false;
                                  isCredits = false;

                                });
                              },
                              icon: const Icon(Icons.person),
                              label: const Text('Profile'),
                            ),
                          ),
                         Card(
                            child: TextButton.icon(
                              onPressed: () {
                                setState(() {
                                  isProfile = false;
                                  isBike = true;
                                  isCredits = false;
                                });
                              },
                              icon: const Icon(Icons.directions_bike_rounded),
                              label: const Text('My Bike'),
                            ),
                          ),
                         Card(
                            child: TextButton.icon(
                              onPressed: () {
                                setState(() {
                                  isBike = false;
                                  isCredits = true;
                                  isProfile = false;
                                });
                              },
                              icon: const Icon(Icons.credit_card),
                              label: const Text('Credits'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            if(isProfile)Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    ListTile(
                      title: Text('UserName'),
                      trailing: Text('@Nam5154'),
                    ),
                    ListTile(
                      title: Text('Full Name'),
                      trailing: Text('Testing'),
                    ),
                    ListTile(
                      title: Text('Phone'),
                      trailing: Text('+8801735436436'),
                    ),
                    ListTile(
                      title: Text('Email Address'),
                      trailing: Text('test@gmail.com'),
                    ),
                    ListTile(
                      title: Text('Address'),
                      trailing: Text('Dhaka'),
                    ),
                  ],
                ),
              ),
            ),
           if(isBike) Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: const Color(0xFF2B2B2B).withOpacity(0.25),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Column(
                    children:  [
                      const ListTile(
                        title: Text('UserName',style: TextStyle(color: Colors.white),),
                        subtitle: Text('Reg. No : bike546536',style: TextStyle(color: Colors.white),),
                        trailing: Icon(Icons.more_horiz,color:  Colors.white,),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                              CircleAvatar(
                                child: Text('InSR'),
                              ),
                              Text('Insurance Exp',style: TextStyle(color: Colors.white),),
                              Text('2022-05-27',style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          Column(
                            children: const [
                              CircleAvatar(
                                child: Text('PUC'),
                              ),
                              Text('PUC Exp',style: TextStyle(color: Colors.white),),
                              Text('2022-05-16',style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          Column(
                            children: const [
                              CircleAvatar(
                                child: Text('RC'),
                              ),
                              Text('RC Exp',style: TextStyle(color: Colors.white),),
                              Text('2022-05-20',style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
           if(isCredits) Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: const Color(0xFF2B2B2B).withOpacity(0.25),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  const [
                       ListTile(
                        title: Text('Balance',style: TextStyle(color: Colors.white),),
                        subtitle: Text('0.0',style: TextStyle(color: Colors.white, fontSize: 25,),),
                      ),
                      SizedBox(height: 50,),
                      Padding(
                        padding: EdgeInsets.only(left: 14.0),
                        child: Text('Referral Credit',style: TextStyle(color: Colors.white,fontSize: 22),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 14.0),
                        child: Text('Use them anytime. No worries of Expiration',style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 4.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:const Color(0xFF2B2B2B).withOpacity(0.75),
                ),
                onPressed: () {},
                child: const Text('Edit Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
