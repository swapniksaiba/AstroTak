import 'package:astrotak/constants/colors.dart';
import 'package:astrotak/constants/text_styles.dart';
import 'package:astrotak/models/categories.dart';
import 'package:astrotak/screens/friends_and_family_screen.dart';
import 'package:astrotak/utils/ask_question_data.dart';
import 'package:astrotak/utils/fetch_api_data.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AskQuestionScreen extends StatefulWidget {
  const AskQuestionScreen({Key? key}) : super(key: key);

  @override
  _AskQuestionScreenState createState() => _AskQuestionScreenState();
}

class _AskQuestionScreenState extends State<AskQuestionScreen> {
  int _walletBalance = 0;

  List<CategoryModel> _categories = [CategoryModel(1, 'Self', '', 1, [])];
  List<String> _categoryNames = ['Self'];
  String _selectedCategory = 'Self';
  int _selectedCategoryIndex = 0;

  List<String> _suggestedQuestion = [
    'When is the right for me to introduce my boyfriend / girlfriend?',
    'Doubtful about taking my relationship to next level?',
    'How will I meet my potential life partner',
    'Is my Wife/Husband faithful?',
    'Will I meet my true love?',
    'When will I get in relationship?'
  ];

  int _selectedNavbarIndex = 2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchData().fetchCategories();

    _categories = FetchData().getCategories();
    for (int i = 0; i < _categories.length; i++)
      _categoryNames.add(_categories[i].name);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: getAppBar(),
      body: getBody(),
      bottomNavigationBar: getNavbar(),
      floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                  color: primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 8, offset: Offset(2, 4))
                  ]),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: white,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: secondary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₹150 (1 Question on Love)',
                    style: textStyleLight.copyWith(color: white),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                      backgroundColor: MaterialStateProperty.all(white),
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 16, vertical: 0)),
                    ),
                    child: Text(
                      'Ask now',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: secondary),
                    ),
                  )
                ],
              ),
            )
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  getAppBar() => AppBar(
        toolbarHeight: 100,
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FriendsAndFamilyScreen()));
            },
            child: Image.asset(
              'assets/profile.png',
              scale: 3.5,
            ),
          )
        ],
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Container(
            color: secondary,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wallet Balance: ₹$_walletBalance',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: white),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(white),
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 16, vertical: 0)),
                    ),
                    child: Text(
                      'Add Money',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: secondary),
                    ),
                  )
                ]),
          ),
        ),
      );

  getNavbar() async => BottomNavigationBar(
          backgroundColor: white,
          selectedLabelStyle: textStyleLight.copyWith(fontSize: 14),
          unselectedLabelStyle: textStyleLight.copyWith(fontSize: 12),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedItemColor: primary,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedNavbarIndex,
          onTap: (ind) {
            setState(() {
              _selectedNavbarIndex = ind;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/home.png',
                color: _selectedNavbarIndex == 0 ? primary : Colors.grey,
                scale: 2.5,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/talk.png',
                  color: _selectedNavbarIndex == 1 ? primary : Colors.grey,
                  scale: 2.5,
                ),
                label: 'Talk'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/ask.png',
                  color: _selectedNavbarIndex == 2 ? primary : Colors.grey,
                  scale: 2,
                ),
                label: 'Ask Question'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/reports.png',
                  color: _selectedNavbarIndex == 3 ? primary : Colors.grey,
                  scale: 2.5,
                ),
                label: 'Reports'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/chat.png',
                  color: _selectedNavbarIndex == 4 ? primary : Colors.grey,
                  scale: 3.5,
                ),
                label: 'Chat'),
          ]);

  getBody() async => Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ask a Question',
              style: textStyleBold,
            ),
            Text(
              'Seek accurate answers to your life problems and get guidance towards the right path. Whether the problem is related to love, self, life, business, money, education or work, our astrologers will do an in depth study of your birth chart to provide personalized responses along with remedies.',
              style: textStyleLight,
            ),
            SizedBox(height: 8),
            Text(
              'Choose Category',
              style: textStyleBold,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: DropdownButton<String>(
                  isExpanded: true,
                  style: textStyleLight,

                  itemHeight: 48,
                  hint: Text(
                      'Please choose a category'), // Not necessary for Option 1
                  value: _selectedCategory,
                  onChanged: (val) {
                    setState(() {
                      // _selectedCategory = val.toString();
                      // _selectedCategoryIndex = _categories
                      //     .indexWhere((element) => element.name == val?.name);
                      for (int i = 0; i < _categories.length; i++) {
                        if (val == _categories[i].name) {
                          _selectedCategoryIndex = i;
                        }
                      }
                      _selectedCategory =
                          _categories[_selectedCategoryIndex].name;
                    });
                  },
                  items: _categoryNames.map((cat) {
                    return DropdownMenuItem(
                      child: Text(cat),
                      value: cat,
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 24),
            Container(
              height: 132,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                border: new Border.all(
                  color: Colors.grey,
                ),
              ),
              child: new TextField(
                maxLength: 150,
                maxLines: 4,
                textAlign: TextAlign.start,
                decoration: new InputDecoration(
                    hintText: 'Type a question here',
                    border: InputBorder.none,
                    hintStyle: textStyleLight.copyWith(color: Colors.grey)),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Ideas what to Ask (Select Any)',
              style: textStyleBold,
            ),
            SizedBox(height: 12),
            Container(
                height:
                    _categories[_selectedCategoryIndex].suggestions.length * 65,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                      _categories[_selectedCategoryIndex].suggestions.length,
                      (index) => Column(
                            children: [
                              ListTile(
                                dense: true,
                                leading: Icon(
                                  CupertinoIcons.question_diamond,
                                  color: primary,
                                ),
                                minLeadingWidth: 20,
                                title: Text(
                                  _categories[_selectedCategoryIndex]
                                      .suggestions[index],
                                  style: textStyleLight,
                                ),
                              ),
                              Divider(color: black)
                            ],
                          )),
                )),
            SizedBox(height: 24),
            Text(
              'Seeking accurate answers to difficult questions troubling your mind? Ask credible astrologers to know what future has in store for you.',
              style: textStyleLight,
            ),
            SizedBox(height: 24),
            Container(
              color: primary.withOpacity(0.1),
              padding: EdgeInsets.all(12),
              child: Text(
                '• Personalized responses provided by our team of Vedic astrologers within 24 hours. \n• Qualified and experienced astrologers will look into your birth chart and provide the right guidance. \n• You can seek answers to any part of your life and for most pressing issues. \n• Our team of Vedic astrologers will not just pr answers but also suggest a remedial solution',
                style: textStyleLight.copyWith(color: primary),
              ),
            ),
            SizedBox(height: 72)
          ],
        )),
      );
}
