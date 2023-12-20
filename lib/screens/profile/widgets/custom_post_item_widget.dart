import 'dart:ui';

import 'package:unimate/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../core/utils/app_imports.dart';

class CustomPostItemWidget extends StatefulWidget {
  const CustomPostItemWidget(
      {Key? key, this.showUser = false, this.postname = "ENSIA"})
      : super(key: key);
  final bool showUser;
  final String postname;

  @override
  State<CustomPostItemWidget> createState() => _CustomPostItemWidgetState();
}

class _CustomPostItemWidgetState extends State<CustomPostItemWidget> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 165,
      height: 265,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name and profail picture
          widget.showUser == true
              ? InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileTap(
                                showFollowBottomInProfile: true,
                              )),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            "assets/images/pic1.png",
                            height: 32,
                            width: 32,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Calum Lewis",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox(),

          // post image and favorite botton
          Stack(
            children: [
              //post image
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    onTap: () {
                      /*
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PostItemScreen()));
                    */
                    },
                    child: Image.asset(
                      "assets/images/download.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Favorite botton
              Positioned(
                top: 20,
                right: 20,
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          favorite = !favorite;
                        });
                      },
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7)),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white.withOpacity(0.10),
                              ),
                              child: Center(
                                child: favorite == false
                                    ? const Icon(
                                        IconlyBroken.heart,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        IconlyBold.heart,
                                        color: Colors.red,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // post name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.postname,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: primaryColor),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "23 shots",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: secondaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
