import 'package:unimate/screens/profile/setting.dart';
import '../../main.dart';
import 'edit_profile.dart';
import 'widgets/custom_post_item_widget.dart';
import 'widgets/custom_collection_widget.dart';
import 'package:flutter/material.dart';
import '../../core/utils/app_imports.dart';
import '../widgets/custom_botton.dart';
import 'widgets/custom_binary_option.dart';

class ProfileTap extends StatefulWidget {
  const ProfileTap({
    Key? key,
    this.showFollowBottomInProfile = true,
  }) : super(key: key);

  final bool showFollowBottomInProfile;

  @override
  _ProfileTapState createState() => _ProfileTapState();
}

class _ProfileTapState extends State<ProfileTap> {
  bool lr = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Setting()),
                );
              },
              icon: const Icon(
                Icons.settings,
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              AssetImage("assets/images/download.jpg"),
                        ),
                        widget.showFollowBottomInProfile
                            ? InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EditProfileTap()), // Replace EditProfileScreen with your actual widget/screen class
                                  );
                                },
                                child: const CircleAvatar(
                                  radius: 15,
                                  backgroundColor: primaryColor,
                                  child: Icon(
                                    Icons.edit,
                                    size: 15,
                                    color: white,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Adlene",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(color: primaryColor),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Contribution",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: primaryColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const Icon(Unicons.resources,
                                    size: 22, color: secondaryColor),
                                const SizedBox(height: 5),
                                Text('5',
                                    style:
                                        Theme.of(context).textTheme.titleMedium!.copyWith(color: primaryColor)),
                              ],
                            ),
                            const SizedBox(
                                width:
                                    20), // Adjust the width for the space between icons
                            Column(
                              children: [
                                const Icon(Icons.help,
                                    size: 22, color: secondaryColor),
                                const SizedBox(height: 5),
                                Text('10',
                                    style:
                                        Theme.of(context).textTheme.titleMedium!.copyWith(color: primaryColor)),
                              ],
                            ),
                            const SizedBox(
                                width:
                                    20), // Adjust the width for the space between icons
                            Column(
                              children: [
                                const Icon(Icons.school,
                                    size: 22, color: secondaryColor),
                                const SizedBox(height: 5),
                                Text('3',
                                    style:
                                        Theme.of(context).textTheme.titleMedium!.copyWith(color: primaryColor)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Posts",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: secondaryColor),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "32",
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(color: primaryColor),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Following",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: secondaryColor),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "789",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: primaryColor)
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Followers",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!.copyWith(color: secondaryColor),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "1.200",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: primaryColor)
                            ),
                          ],
                        ),
                      ],
                    ),
                    widget.showFollowBottomInProfile
                        ? CustomButton(onTap: () {}, text: "Follow")
                        : const SizedBox(
                            height: 20,
                          ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomBinaryOption(
                    textLeft: "Posts",
                    textRight: "Collections",
                    onOptionChanged: (bool isLeft) {
                      setState(() {
                        lr = isLeft;
                      });
                    },
                  ),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    childAspectRatio: 1 / 1.3,
                    children: List.generate(
                      5,
                      (index) => lr
                          ? const CustomCollectionItemWidget()
                          : const CustomPostItemWidget(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
