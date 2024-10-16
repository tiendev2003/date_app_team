import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterShowScreen extends StatefulWidget {
  final VoidCallback onClose;

  const FilterShowScreen({super.key, required this.onClose});

  @override
  _FilterShowScreenState createState() => _FilterShowScreenState();
}

class _FilterShowScreenState extends State<FilterShowScreen> {
  double _currentSliderValue = 0;
  RangeValues _currentRangeValues = const RangeValues(18, 30);
  List<bool> _isGenderSelected = [true, false, false];
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
    return Container(
      margin: const EdgeInsets.only(top: 100),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: widget.onClose,
                  ),
                ),
                const Center(
                  child: Text(
                    'Filter & Show',
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                top: 100, bottom: 80, left: 10, right: 10),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Adjust this value as needed
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Distance Range',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${_currentSliderValue.toStringAsFixed(2)}KM',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Color(0xFF960fff),
                        inactiveTrackColor: Color(0xFFEAEAEA),
                        thumbColor: Color(0xFF960fff),
                        overlayColor: Color(0xFF960fff).withOpacity(0.2),
                        valueIndicatorColor: Color(0xFF960fff),
                      ),
                      child: Slider(
                        value: _currentSliderValue,
                        min: 0,
                        max: 500,
                        divisions: 500,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Age Range',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${_currentRangeValues.start.round()}-${_currentRangeValues.end.round()}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Color(0xFF960fff),
                        inactiveTrackColor: Color(0xFFEAEAEA),
                        thumbColor: Color(0xFF960fff),
                        overlayColor: Color(0xFF960fff).withOpacity(0.2),
                        valueIndicatorColor: Color(0xFF960fff),
                      ),
                      child: RangeSlider(
                        values: _currentRangeValues,
                        min: 18,
                        max: 70,
                        divisions: 52,
                        labels: RangeLabels(
                          _currentRangeValues.start.round().toString(),
                          _currentRangeValues.end.round().toString(),
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValues = values;
                          });
                        },
                      ),
                    ),
                    const Text(
                      'Search Preferences',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: _isGenderSelected[0]
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: _isGenderSelected[0]
                                  ? Color(0xFF960fff)
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                  color: _isGenderSelected[0]
                                      ? Color(0xFF960fff)
                                      : Color(0xFFf2f2f2),
                                ),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _isGenderSelected = [true, false, false];
                              });
                            },
                            child: const Text('Man'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: _isGenderSelected[1]
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: _isGenderSelected[1]
                                  ? Color(0xFF960fff)
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                  color: _isGenderSelected[1]
                                      ? Color(0xFF960fff)
                                      : Color(0xFFf2f2f2),
                                ),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _isGenderSelected = [false, true, false];
                              });
                            },
                            child: const Text('Woman'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: _isGenderSelected[2]
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: _isGenderSelected[2]
                                  ? Color(0xFF960fff)
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                  color: _isGenderSelected[2]
                                      ? Color(0xFF960fff)
                                      : Color(0xFFf2f2f2),
                                ),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _isGenderSelected = [false, false, true];
                              });
                            },
                            child: const Text('Both'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Interests',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
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
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
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
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
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
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
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
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
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
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
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
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
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
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
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
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
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
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
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
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
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
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
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
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: _isRelationshipGoalSelected[0]
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: _isRelationshipGoalSelected[0]
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
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: _isRelationshipGoalSelected[1]
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: _isRelationshipGoalSelected[1]
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
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: _isRelationshipGoalSelected[2]
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: _isRelationshipGoalSelected[2]
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
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
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
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
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF960fff).withOpacity(0.4),
                              foregroundColor: const Color(0xFF960fff),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Reset',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF960fff),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
