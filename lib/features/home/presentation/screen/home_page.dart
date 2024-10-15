import 'package:date_app_team/features/home/presentation/screen/profile_infomation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../filter_show/screen/filter_show_screen.dart';
import '../../../notification/screen/notification_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showFilter = false;

  void _filterToggleOverlay() {
    setState(() {
      _showFilter = !_showFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.network(
                            'https://picsum.photos/seed/833/600',
                            fit: BoxFit.cover),
                      ),
                      const Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: Alignment(-1, 0),
                              child: Text('Hello',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Align(
                              alignment: Alignment(-1, 0),
                              child: Text('Nguyễn Thành Công',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                          ],
                        ),
                      )),
                      IconButton(
                        iconSize: 330,
                        icon: SvgPicture.asset(
                          'assets/icons/notificationicon.svg',
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationScreen(),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/Filter.svg',
                        ),
                        onPressed: _filterToggleOverlay,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                HomeContentBody(),
              ],
            ),
            if (_showFilter) ...[
              const Opacity(
                opacity: 0.5,
                child: ModalBarrier(dismissible: false, color: Colors.black),
              ),
              FilterShowScreen(onClose: _filterToggleOverlay),
            ]
          ],
        ),
      ),
    );
  }
}

class HomeContentBody extends StatefulWidget {
  const HomeContentBody({super.key});

  @override
  State<HomeContentBody> createState() => _HomeContentBodyState();
}

class _HomeContentBodyState extends State<HomeContentBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 535,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProfileDetailInfomation(),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF000000).withOpacity(0.0),
                      Color(0xFF960FFF),
                    ],
                  ).createShader(rect);
                },
                blendMode: BlendMode.srcATop,
                child: Image.network(
                  'https://picsum.photos/seed/740/600',
                  width: 300,
                  height: 500,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Align(
                    alignment: Alignment(1, 0),
                    child: CircularPercentageIndicator(percentage: 75)),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                        width: 100,
                        child: Text(
                          'Nguyễn Thành Công',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            letterSpacing: 0.0,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFFFFF),
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        )),
                    const Expanded(
                        child: Text(
                      ',21',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        letterSpacing: 0.0,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                      ),
                    )),
                    Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF1A1D1F),
                      ),
                      child: const Center(
                        child: Text(
                          '48.KM',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              letterSpacing: 0.0,
                              fontSize: 14,
                              color: Color(0xFFFFFFFF),
                              overflow: TextOverflow.ellipsis),
                          maxLines: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  'Tôi đang cần tìm kiếm một người bạn nữ để cùng đi chơi chơi chơi',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    letterSpacing: 0.0,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFFFFFFFF),
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF1A1D1F),
                    ),
                    child: IconButton(
                      onPressed: () {
                        print('Button pressed');
                      },
                      icon: const Icon(Icons.close_sharp),
                      color: const Color(0xFFFFA500),
                      iconSize: 30,
                    ),
                  ),
                  Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF1A1D1F),
                      ),
                      child: IconButton(
                        onPressed: () {
                          print('Button pressed');
                        },
                        icon: const Icon(Icons.favorite),
                        color: const Color(0xFFE86AFF),
                        iconSize: 40,
                      )),
                  Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF1A1D1F),
                      ),
                      child: IconButton(
                        onPressed: () {
                          print('Button pressed');
                        },
                        icon: const Icon(Icons.wechat),
                        color: const Color(0xFF960FFF),
                        iconSize: 40,
                      ))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CircularPercentageIndicator extends StatelessWidget {
  final double percentage;

  const CircularPercentageIndicator({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularProgressIndicator(
          value: percentage / 100,
          strokeWidth: 5,
          backgroundColor: Colors.grey.withOpacity(0.3),
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
        ),
        Text(
          '${percentage.toInt()}%',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
