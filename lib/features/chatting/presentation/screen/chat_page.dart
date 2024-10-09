// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'package:date_app_team/features/chatting/bloc/chatting_provider.dart';
import 'package:date_app_team/features/home/bloc/home_provier.dart';
import 'package:date_app_team/features/premium/bloc/premium_provider.dart';
import 'package:date_app_team/features/profile/bloc/detailprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChattingPage extends StatefulWidget {
  final String resiverUserId;
  final String resiverUseremail;
  final String proPic;
  const ChattingPage(
      {super.key,
      required this.resiverUserId,
      required this.resiverUseremail,
      required this.proPic});

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  late ChattingProvider chattingProvider;
  late PremiumProvider premiumProvider;
  late DetailProvider detailProvider;
  late HomeProvider homeProvider;

  @override
  void initState() {
    super.initState();

    chattingProvider = Provider.of<ChattingProvider>(context, listen: false);

    detailProvider = Provider.of<DetailProvider>(context, listen: false);

    chattingProvider.isMeassageAvalable(widget.resiverUserId);
    chattingProvider
        .updateUid(Provider.of<HomeProvider>(context, listen: false).uid);
    chattingProvider.isUserOnlie(chattingProvider.uid!, true);
    Provider.of<PremiumProvider>(context, listen: false)
        .planDataApi(context, widget.resiverUserId);
  }

  @override
  void dispose() {
    super.dispose();
    chattingProvider.isUserOnlie(chattingProvider.uid!, false);

    // chattingProvider.scrollController.dispose();
  }

  var selectedRadioTile;
  String rejectmsg = "";

  List cancelList = [
    {"id": 1, "title": "Harassment"},
    {"id": 2, "title": "Inappropriate Content"},
    {"id": 3, "title": "Violation of Terms"},
    {"id": 4, "title": "Offensive Language"},
    {"id": 5, "title": "Disrespectful Behavior"},
    {"id": 6, "title": "Threats"},
    {"id": 7, "title": "Catfishing"},
    {"id": 7, "title": "Unwanted Advances"},
    {"id": 7, "title": "Unsolicited Explicit Content"},
    {"id": 7, "title": "Privacy Concerns"},
    {"id": 7, "title": "Scam or Spam"},
    {"id": 7, "title": "Something else"},
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    chattingProvider = Provider.of<ChattingProvider>(context);
    premiumProvider = Provider.of<PremiumProvider>(context);
    detailProvider = Provider.of<DetailProvider>(context);
    homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(),
    );
  }
}
