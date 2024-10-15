import 'package:date_app_team/features/home/presentation/screen/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProfileDetailInfomation extends StatefulWidget {
  const ProfileDetailInfomation({super.key});

  @override
  State<ProfileDetailInfomation> createState() =>
      _ProfileDetailInfomationState();
}

class _ProfileDetailInfomationState extends State<ProfileDetailInfomation> {
  List<bool> _isInterestSelected = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> _isLanguagesIKnowSelected = [
    false,
    false,
    false,
    false,
  ];
  List<bool> _isReligionSelected = [false, false, false];
  List<bool> _isRelationshipGoalSelected = [false, false, false];
  List<bool> _isVerifyProfileSelected = [false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Image.network(
              'https://picsum.photos/seed/740/600',
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            ),
            // Container với opacity 0.5
            Container(
              width: double.infinity,
              height: 500,
              color: Colors.black.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: IconButton(
                            icon: Icon(Icons.close, color: Colors.black),
                            onPressed: () {
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        HomePage(), // Replace with your home screen widget
                                  ));
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          '500 KM Away',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              margin: const EdgeInsets.only(top: 300),
              width: double.infinity,
              height: double.infinity,
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Nguyễn Thành Công (20)',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Nguyễn Thành Công đẹp trai nhất thế giới',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Interests',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: ElevatedButton.icon(
                                label: Row(
                                  children: [
                                    const Text('Travel'),
                                    const SizedBox(width: 8),
                                    Image.asset(
                                      'assets/Image/travel.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: _isInterestSelected[0]
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: _isInterestSelected[0]
                                      ? Color(0xFF960fff)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _isInterestSelected[0]
                                          ? Color(0xFF960fff)
                                          : Color(0xFFf2f2f2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isInterestSelected[0] =
                                        !_isInterestSelected[0];
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: ElevatedButton.icon(
                                label: Row(
                                  children: [
                                    const Text('Cooking'),
                                    const SizedBox(width: 8),
                                    Image.asset(
                                      'assets/Image/travel.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: _isInterestSelected[1]
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: _isInterestSelected[1]
                                      ? Color(0xFF960fff)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _isInterestSelected[1]
                                          ? Color(0xFF960fff)
                                          : Color(0xFFf2f2f2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isInterestSelected[1] =
                                        !_isInterestSelected[1];
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: ElevatedButton.icon(
                                label: Row(
                                  children: [
                                    const Text('Yoga'),
                                    const SizedBox(width: 8),
                                    Image.asset(
                                      'assets/Image/travel.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: _isInterestSelected[2]
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: _isInterestSelected[2]
                                      ? Color(0xFF960fff)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _isInterestSelected[2]
                                          ? Color(0xFF960fff)
                                          : Color(0xFFf2f2f2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isInterestSelected[2] =
                                        !_isInterestSelected[2];
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: ElevatedButton.icon(
                                label: Row(
                                  children: [
                                    const Text('Hiki'),
                                    const SizedBox(width: 8),
                                    Image.asset(
                                      'assets/Image/travel.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: _isInterestSelected[3]
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: _isInterestSelected[3]
                                      ? Color(0xFF960fff)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _isInterestSelected[3]
                                          ? Color(0xFF960fff)
                                          : Color(0xFFf2f2f2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isInterestSelected[3] =
                                        !_isInterestSelected[3];
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: ElevatedButton.icon(
                                label: Row(
                                  children: [
                                    const Text('Movies'),
                                    const SizedBox(width: 8),
                                    Image.asset(
                                      'assets/Image/travel.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: _isInterestSelected[4]
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: _isInterestSelected[4]
                                      ? Color(0xFF960fff)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _isInterestSelected[4]
                                          ? Color(0xFF960fff)
                                          : Color(0xFFf2f2f2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isInterestSelected[4] =
                                        !_isInterestSelected[4];
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: ElevatedButton.icon(
                                label: Row(
                                  children: [
                                    const Text('Gammin'),
                                    const SizedBox(width: 8),
                                    Image.asset(
                                      'assets/Image/travel.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: _isInterestSelected[5]
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: _isInterestSelected[5]
                                      ? Color(0xFF960fff)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _isInterestSelected[5]
                                          ? Color(0xFF960fff)
                                          : Color(0xFFf2f2f2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isInterestSelected[5] =
                                        !_isInterestSelected[5];
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: ElevatedButton.icon(
                                label: Row(
                                  children: [
                                    const Text('Wine'),
                                    const SizedBox(width: 8),
                                    Image.asset(
                                      'assets/Image/travel.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: _isInterestSelected[6]
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: _isInterestSelected[6]
                                      ? Color(0xFF960fff)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _isInterestSelected[6]
                                          ? Color(0xFF960fff)
                                          : Color(0xFFf2f2f2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isInterestSelected[6] =
                                        !_isInterestSelected[6];
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: ElevatedButton.icon(
                                label: Row(
                                  children: [
                                    const Text('Animals'),
                                    const SizedBox(width: 8),
                                    Image.asset(
                                      'assets/Image/travel.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: _isInterestSelected[7]
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: _isInterestSelected[7]
                                      ? Color(0xFF960fff)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _isInterestSelected[7]
                                          ? Color(0xFF960fff)
                                          : Color(0xFFf2f2f2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isInterestSelected[7] =
                                        !_isInterestSelected[7];
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Languages I Know',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: ElevatedButton.icon(
                                label: Row(
                                  children: [
                                    const Text('English'),
                                    const SizedBox(width: 8),
                                    Image.asset(
                                      'assets/Image/travel.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: _isLanguagesIKnowSelected[0]
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: _isLanguagesIKnowSelected[0]
                                      ? Color(0xFF960fff)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _isLanguagesIKnowSelected[0]
                                          ? Color(0xFF960fff)
                                          : Color(0xFFf2f2f2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isLanguagesIKnowSelected[0] =
                                        !_isLanguagesIKnowSelected[0];
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: ElevatedButton.icon(
                                label: Row(
                                  children: [
                                    const Text('English'),
                                    const SizedBox(width: 8),
                                    Image.asset(
                                      'assets/Image/travel.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: _isLanguagesIKnowSelected[0]
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: _isLanguagesIKnowSelected[0]
                                      ? Color(0xFF960fff)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _isLanguagesIKnowSelected[0]
                                          ? Color(0xFF960fff)
                                          : Color(0xFFf2f2f2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isLanguagesIKnowSelected[0] =
                                        !_isLanguagesIKnowSelected[0];
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: ElevatedButton.icon(
                                label: Row(
                                  children: [
                                    const Text('English'),
                                    const SizedBox(width: 8),
                                    Image.asset(
                                      'assets/Image/travel.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: _isLanguagesIKnowSelected[0]
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: _isLanguagesIKnowSelected[0]
                                      ? Color(0xFF960fff)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _isLanguagesIKnowSelected[0]
                                          ? Color(0xFF960fff)
                                          : Color(0xFFf2f2f2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isLanguagesIKnowSelected[0] =
                                        !_isLanguagesIKnowSelected[0];
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: ElevatedButton.icon(
                                label: Row(
                                  children: [
                                    const Text('English'),
                                    const SizedBox(width: 8),
                                    Image.asset(
                                      'assets/Image/travel.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: _isLanguagesIKnowSelected[0]
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: _isLanguagesIKnowSelected[0]
                                      ? Color(0xFF960fff)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _isLanguagesIKnowSelected[0]
                                          ? Color(0xFF960fff)
                                          : Color(0xFFf2f2f2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isLanguagesIKnowSelected[0] =
                                        !_isLanguagesIKnowSelected[0];
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Religion',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: _isReligionSelected[0]
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: _isReligionSelected[0]
                                      ? Color(0xFF960fff)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _isReligionSelected[0]
                                          ? Color(0xFF960fff)
                                          : Color(0xFFf2f2f2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isReligionSelected = [true, false, false];
                                  });
                                },
                                child: const Text('Islam'),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: _isReligionSelected[1]
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: _isReligionSelected[1]
                                      ? Color(0xFF960fff)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _isReligionSelected[1]
                                          ? Color(0xFF960fff)
                                          : Color(0xFFf2f2f2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isReligionSelected = [false, true, false];
                                  });
                                },
                                child: const Text('Hinduism'),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: _isReligionSelected[2]
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: _isReligionSelected[2]
                                      ? Color(0xFF960fff)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _isReligionSelected[2]
                                          ? Color(0xFF960fff)
                                          : Color(0xFFf2f2f2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isReligionSelected = [false, false, true];
                                  });
                                },
                                child: const Text('Taoism'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Relationship Goals',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      _isRelationshipGoalSelected[0]
                                          ? Colors.white
                                          : Colors.black,
                                  backgroundColor:
                                      _isRelationshipGoalSelected[0]
                                          ? Color(0xFF960fff)
                                          : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _isRelationshipGoalSelected[0]
                                          ? Color(0xFF960fff)
                                          : Color(0xFFf2f2f2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isRelationshipGoalSelected = [
                                      true,
                                      false,
                                      false
                                    ];
                                  });
                                },
                                child: const Text('Dating'),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      _isRelationshipGoalSelected[1]
                                          ? Colors.white
                                          : Colors.black,
                                  backgroundColor:
                                      _isRelationshipGoalSelected[1]
                                          ? Color(0xFF960fff)
                                          : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _isRelationshipGoalSelected[1]
                                          ? Color(0xFF960fff)
                                          : Color(0xFFf2f2f2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isRelationshipGoalSelected = [
                                      false,
                                      true,
                                      false
                                    ];
                                  });
                                },
                                child: const Text('Friendship'),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      _isRelationshipGoalSelected[2]
                                          ? Colors.white
                                          : Colors.black,
                                  backgroundColor:
                                      _isRelationshipGoalSelected[2]
                                          ? Color(0xFF960fff)
                                          : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _isRelationshipGoalSelected[2]
                                          ? Color(0xFF960fff)
                                          : Color(0xFFf2f2f2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isRelationshipGoalSelected = [
                                      false,
                                      false,
                                      true
                                    ];
                                  });
                                },
                                child: const Text('Casual'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Verify Profile',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: _isVerifyProfileSelected[0]
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: _isVerifyProfileSelected[0]
                                      ? Color(0xFF960fff)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _isVerifyProfileSelected[0]
                                          ? Color(0xFF960fff)
                                          : Color(0xFFf2f2f2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isVerifyProfileSelected = [true, false];
                                  });
                                },
                                child: const Text('Unverify'),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: _isVerifyProfileSelected[1]
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: _isVerifyProfileSelected[1]
                                      ? Color(0xFF960fff)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _isVerifyProfileSelected[1]
                                          ? Color(0xFF960fff)
                                          : Color(0xFFf2f2f2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isVerifyProfileSelected = [false, true];
                                  });
                                },
                                child: const Text('Verify'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
