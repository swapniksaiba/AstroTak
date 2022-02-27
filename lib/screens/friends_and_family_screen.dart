import 'package:astrotak/constants/colors.dart';
import 'package:astrotak/constants/text_styles.dart';
import 'package:astrotak/screens/add_profile_screen.dart';
import 'package:flutter/material.dart';

class FriendsAndFamilyScreen extends StatefulWidget {
  const FriendsAndFamilyScreen({Key? key}) : super(key: key);

  @override
  _FriendsAndFamilyScreenState createState() => _FriendsAndFamilyScreenState();
}

class _FriendsAndFamilyScreenState extends State<FriendsAndFamilyScreen> {
  int _selectedProfileIndex = 1;

  int _walletBalance = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: getAppBar(),
          body: TabBarView(
            children: [
              getProfileBody(),
              Container(
                child: Center(child: Text('No order history')),
              )
            ],
          )),
    );
  }

  getAppBar() => AppBar(
        // toolbarHeight: 100,
        leading: Image.asset('assets/hamburger.png'),
        elevation: 0,
        backgroundColor: white,
        title: Image.asset(
          'assets/icon.png',
          scale: 8,
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: primary)),
              child: Text('Logout'),
            ),
          )
        ],
        centerTitle: true,
        bottom: TabBar(
            labelColor: primary,
            unselectedLabelColor: Colors.black54,
            labelStyle: textStyleLight.copyWith(fontWeight: FontWeight.w300),
            tabs: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('My Profile'),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('Order History'),
              ),
            ]),
      );

  getProfileBody() => Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: white),
                child: Row(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width - 32) / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: _selectedProfileIndex == 0 ? primary : white),
                      child: Center(
                        child: Text(
                          'Basic Profile',
                          style: textStyleLight.copyWith(
                              fontWeight: FontWeight.w200,
                              color: _selectedProfileIndex == 0 ? white : black,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      width: (MediaQuery.of(context).size.width - 32) / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: _selectedProfileIndex == 1 ? primary : white,
                      ),
                      child: Center(
                        child: Text(
                          'Friends and Family Profile',
                          style: textStyleLight.copyWith(
                              fontWeight: FontWeight.w200,
                              color: _selectedProfileIndex == 1 ? white : black,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              width: MediaQuery.of(context).size.width - 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: secondary.withOpacity(0.1)),
              child: Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet,
                    color: secondary,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Wallet Balance: ₹$_walletBalance',
                    style: textStyleLight.copyWith(color: secondary),
                  ),
                  SizedBox(width: 4),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(color: black)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                      backgroundColor: MaterialStateProperty.all(white),
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 16, vertical: 0)),
                    ),
                    child: Text(
                      'Add money',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: secondary),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                SizedBox(width: 4),
                Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 48) / 5,
                  child: Text(
                    'Name',
                    style: textStyleLight.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                        color: secondary),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 48) / 4,
                  child: Text(
                    'DOB',
                    style: textStyleLight.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                        color: secondary),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 48) / 6,
                  child: Text(
                    'TOB',
                    style: textStyleLight.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                        color: secondary),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 48) / 5,
                  child: Text(
                    'Relation',
                    style: textStyleLight.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                        color: secondary),
                  ),
                ),
              ],
            ),
            for (int i = 0; i < 5; i++) getPersonCard(),
            SizedBox(height: 24),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddProfileScreen()));
                },
                child: Text(
                  '+ Add New Profile',
                  style: textStyleLight.copyWith(
                      fontWeight: FontWeight.w200, color: white, fontSize: 14),
                ))
          ],
        )),
      );

  Widget getPersonCard() => Card(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width - 48) / 6,
              child: Text(
                'Mohit kr',
                style: textStyleLight.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w100),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width - 48) / 4,
              child: Text(
                '11-08-1994',
                style: textStyleLight.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w100),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width - 48) / 7,
              child: Text(
                '8:30',
                style: textStyleLight.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w100),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width - 48) / 6,
              child: Text(
                'Brother',
                style: textStyleLight.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w100),
              ),
            ),
            Icon(
              Icons.edit,
              color: primary,
            ),
            IconButton(
              onPressed: () => deletePopup(),
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ]),
        ),
      );

  deletePopup() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Do you really want to Delete?'),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Yes',
                      style: textStyleLight.copyWith(
                          fontWeight: FontWeight.w200,
                          color: white,
                          fontSize: 14),
                    )),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'No',
                      style: textStyleLight.copyWith(
                          fontWeight: FontWeight.w200,
                          color: white,
                          fontSize: 14),
                    ))
              ],
            ));
  }
}
