import 'package:date_app_team/core/language/localization/app_localization.dart';
import 'package:date_app_team/features/profile/bloc/profile_provider.dart';
import 'package:date_app_team/widget/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProfilePrivacyScreen extends StatefulWidget {
  const ProfilePrivacyScreen({super.key});

  @override
  State<ProfilePrivacyScreen> createState() => _ProfilePrivacyScreenState();
}

class _ProfilePrivacyScreenState extends State<ProfilePrivacyScreen> {
  late ProfileProvider profileProvider;

  @override
  void initState() {
    profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    profileProvider.blocklistaApi(context).then((value) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    profileProvider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: const BackButtons(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        title: Text(
          // "Profile & Privacy".tr,
          AppLocalizations.of(context)?.translate("Profile & Privacy") ??
              "Profile & Privacy",
          style:
              Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 20),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: profileProvider.isLoading
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      onTap: () {
                          Navigator.pushNamed(context, "/blockScreen");
                      },
                      contentPadding: EdgeInsets.zero,
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                            '${AppLocalizations.of(context)?.translate("Blocked Users")}  (${profileProvider.blocklistApi.blocklist!.length})',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold)),
                      ),
                      subtitle: Text(
                          AppLocalizations.of(context)?.translate(
                                  "The people you blocked are displayed here.") ??
                              "The people you blocked are displayed here.",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.grey, fontSize: 14)),
                      trailing: SvgPicture.asset(
                        "assets/icons/Arrow - Right 2.svg",
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).indicatorColor, BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
              color: Colors.red,
            )),
    );
  }
}
