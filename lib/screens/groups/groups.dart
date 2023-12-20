import 'package:flutter/material.dart';

import 'package:unimate/screens/groups/create_group.dart';
import 'widgets/invitation_group_widget.dart';
import 'widgets/group_widget_card.dart';
import 'widgets/suggestion_group_widget.dart';
import '../../core/utils/app_imports.dart';

class GroupesScreen extends StatefulWidget {
  const GroupesScreen({
    Key? key,
  }) : super(key: key);

  @override
  _GroupesScreenState createState() => _GroupesScreenState();
}

class _GroupesScreenState extends State<GroupesScreen> {

  List suggestions = ["sendrequest", "sendrequest"];
  List groups = ["join", "join", "join"];
  List requests = ["accept", "accept", "accept", "accept"];

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Groups',
            style: TextStyle(color: primaryColor, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Unicons.edit,
                color: primaryColor,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateGroupTap()),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                TextField(
            decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            labelText: 'Search',
            labelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(color: backcolor2),
            hintText: 'Enter search text',
            hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(color: backcolor2),
            prefixIcon: const Icon(Icons.search, color: primaryColor, ),
            suffixIcon: const Icon(Icons.filter_alt_rounded, color: primaryColor,),
            border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: primaryColor),
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
  ),
),

                const SizedBox(
                  height: 10,
                ),

                // Three Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildButton("Invitations", context),
                    buildButton("Your Groups", context),
                    buildButton("Suggestions", context),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),

                // Invitations List
                Row(
                  children: [
                    Text(
                      "Invitations",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(color: primaryColor),
                    ),
                    Text(
                      " 3",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: secondaryColor),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),
                buildInvitationsList(),

                const SizedBox(
                  height: 5,
                ),

                // Your Groups List
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Your Groups",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(color: primaryColor),
                  ),
                ),
                buildYourGroupsList(),

                const SizedBox(
                  height: 5,
                ),

                // Suggestions List
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Suggestions",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(color: primaryColor),
                  ),
                ),
                buildSuggestionsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton(String listName, BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: backcolor,
        foregroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(listName),
    );
  }

  // Replace your existing buildInvitationsList(), buildYourGroupsList(), and buildSuggestionsList() functions with the following:

  Widget buildInvitationsList() {
    return ListView.builder(
      controller: _scrollController,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: groups.length,
      itemBuilder: (context, index) {
        return const InvitaionGroupCard();
      },
    );
  }

  Widget buildYourGroupsList() {
    return ListView.builder(
      controller: _scrollController,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: groups.length,
      itemBuilder: (context, index) {
        return const GroupCard();
      },
    );
  }

  Widget buildSuggestionsList() {
    return ListView.builder(
      controller: _scrollController,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: groups.length,
      itemBuilder: (context, index) {
        return const SuggestionGroupCard();
      },
    );
  }
}
