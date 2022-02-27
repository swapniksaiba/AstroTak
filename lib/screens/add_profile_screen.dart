import 'package:astrotak/constants/colors.dart';
import 'package:astrotak/constants/text_styles.dart';
import 'package:flutter/material.dart';

class AddProfileScreen extends StatefulWidget {
  const AddProfileScreen({Key? key}) : super(key: key);

  @override
  _AddProfileScreenState createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  int _selectedProfileIndex = 1;

  final _formKey = GlobalKey<FormState>();

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
          Container(
            margin: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: primary)),
            child: Text('Logout'),
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
            SizedBox(height: 24),
            getForm(),
          ],
        )),
      );

  List<bool> timeToggle = [true, false];
  List genders = ['Male', 'Female', 'Others'];
  String _selectedGender = 'Male';
  List relations = [
    'Father',
    'Mother',
    'Brother',
    'Sister',
    'Son',
    'Daughter',
    'Mother in law',
    'Father in law'
  ];
  String _selectedRelation = 'Father';

  getForm() => Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              SizedBox(width: 12),
              Text(
                'Add New Profile',
                style: textStyleLight.copyWith(
                    fontSize: 20, fontWeight: FontWeight.w100),
              )
            ],
          ),
          SizedBox(height: 18),
          Text(
            'Name',
            style: textStyleLight.copyWith(color: Colors.black54),
          ),
          SizedBox(height: 4),
          TextFormField(
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  value.contains(new RegExp(r'[0-9]')) ||
                  value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                return 'Enter a valid Name';
              }
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
          ),
          SizedBox(height: 18),
          Text(
            'Date of Birth',
            style: textStyleLight.copyWith(color: Colors.black54),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: (MediaQuery.of(context).size.width - 64) / 3,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains(new RegExp(r'[0-9]')) ||
                        int.parse(value) > 31) {
                      return 'Invalid DD';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))),
                ),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width - 64) / 3,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains(new RegExp(r'[0-9]')) ||
                        int.parse(value) > 12) {
                      return 'Invalid MM';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))),
                ),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width - 64) / 3,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.contains(new RegExp(r'[0-9]')) ||
                        int.parse(value) > 2022) {
                      return 'Invalid YYYY';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))),
                ),
              ),
            ],
          ),
          SizedBox(height: 18),
          Text(
            'Time of Birth',
            style: textStyleLight.copyWith(color: Colors.black54),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: (MediaQuery.of(context).size.width - 64) / 3,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains(new RegExp(r'[0-9]')) ||
                        int.parse(value) > 24) {
                      return 'Invalid HH';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))),
                ),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width - 64) / 3,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains(new RegExp(r'[0-9]')) ||
                        int.parse(value) > 60) {
                      return 'Invalid MM';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))),
                ),
              ),
              ToggleButtons(
                  onPressed: (ind) {
                    timeToggle[ind] = true;
                    timeToggle[(ind + 1) % 2] = false;
                    setState(() {});
                  },
                  selectedColor: white,
                  fillColor: secondary,
                  children: [Text('AM'), Text('PM')],
                  isSelected: timeToggle)
            ],
          ),
          SizedBox(height: 18),
          Text(
            'Place of Birth',
            style: textStyleLight.copyWith(color: Colors.black54),
          ),
          SizedBox(height: 4),
          TextFormField(
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  value.contains(new RegExp(r'[0-9]')) ||
                  value.contains(new RegExp(r'[!@#$%^&*().?":{}|<>]'))) {
                return 'Please select a city';
              }
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: (MediaQuery.of(context).size.width - 48) / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 18),
                    Text(
                      'Gender',
                      style: textStyleLight.copyWith(color: Colors.black54),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(6)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          style: textStyleLight,
                          itemHeight: 48, // Not necessary for Option 1
                          value: _selectedGender,
                          onChanged: (val) {
                            setState(() {
                              _selectedGender = val.toString();
                            });
                          },
                          items: genders.map((location) {
                            return DropdownMenuItem(
                              child: new Text(location),
                              value: location,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width - 48) / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 18),
                    Text(
                      'Relation',
                      style: textStyleLight.copyWith(color: Colors.black54),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(6)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          style: textStyleLight,
                          itemHeight: 48,
                          hint: Text(
                              'Please choose a category'), // Not necessary for Option 1
                          value: _selectedRelation,
                          onChanged: (val) {
                            setState(() {
                              _selectedRelation = val.toString();
                            });
                          },
                          items: relations.map((location) {
                            return DropdownMenuItem(
                              child: new Text(location),
                              value: location,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: Text(
                    'Save changes',
                    style: textStyleLight.copyWith(
                        fontWeight: FontWeight.w200,
                        color: white,
                        fontSize: 14),
                  )),
            ],
          )
        ]),
      );
}
