import 'package:flutter/material.dart';
import '../../core/utils/app_imports.dart';
import 'package:unimate/screens/widgets/custom_botton.dart';

class CreateGroupTap extends StatefulWidget {
  const CreateGroupTap({
    Key? key,
  }) : super(key: key);

  @override
  _CreateGroupTapState createState() => _CreateGroupTapState();
}

class _CreateGroupTapState extends State<CreateGroupTap> {
  TextEditingController groupNameController = TextEditingController();
  TextEditingController categoriesController = TextEditingController();

  // Dummy list of members for demonstration
  List<String> membersList = [
    "Member 1",
    "Member 2",
    "Member 3",
    // Add more members as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          'Create Group',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [primaryColor, secondaryColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          buildGroupIcon(),
                          InkWell(
                            onTap: () {},
                            child: const CircleAvatar(
                              radius: 12,
                              backgroundColor: secondaryColor,
                              child: Icon(
                                Icons.camera_alt,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: buildTextField(groupNameController, "Group Name"),
                    ),
                  ),
                  const SizedBox(height: 30),
                  buildTextField(categoriesController, "Add members"),
                  const SizedBox(height: 30),
                  buildTextField(categoriesController, "Categories and Tags"),
                  const SizedBox(height: 30),
                   CustomButton(
              height: 40,
              color:  gradiant ,
              textColor:  Colors.white ,
              onTap: () {
               //
              },
              text: "Create Group",
            ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: secondaryColor),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secondaryColor),
          borderRadius: BorderRadius.circular(20),
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 234, 231, 231),
      ),
    );
  }

  Widget buildGroupIcon() {
    return const Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: secondaryColor,
          child: Icon(
            Icons.group,
            size: 40,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
