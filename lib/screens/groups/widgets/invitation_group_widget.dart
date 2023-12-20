import 'package:flutter/material.dart';
import '../../../core/utils/app_imports.dart';
import '../../widgets/custom_botton.dart';


class InvitaionGroupCard extends StatefulWidget {
  const InvitaionGroupCard({Key? key}) : super(key: key);

  @override
  State<InvitaionGroupCard> createState() => _InvitaionGroupCardState();
}

class _InvitaionGroupCardState extends State<InvitaionGroupCard> {
  bool accept = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/images/download.jpg",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/group_overview'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ensia Legends",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: primaryColor),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "computer science",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: secondaryColor),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "5 min ago.",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: backcolor2),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10), // Adjust the left padding
                child: CustomButton(
                  height: 40,
                  color: accept ? gradiant : gradiant2,
                  textColor: accept ? Colors.white : primaryColor,
                  onTap: () {
                    setState(() {
                      accept = !accept;
                    });
                  },
                  text: accept ? "Accept" : "Accepted",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
