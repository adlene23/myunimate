import 'package:flutter/material.dart';
import '../../core/utils/app_imports.dart';
import 'package:unimate/screens/widgets/custom_botton.dart';

class EditProfileTap extends StatefulWidget {
  const EditProfileTap({
    Key? key,
  }) : super(key: key);

  @override
  _EditProfileTapState createState() => _EditProfileTapState();
}

class _EditProfileTapState extends State<EditProfileTap> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor, // Set the app bar color to primary
        elevation: 0,
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: white), // Set the title text color to black
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: white,
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
                      colors: [
                        primaryColor,
                        secondaryColor
                      ], // Set the circle gradient colors
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
                          const CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage("assets/images/download.jpg"),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const CircleAvatar(
                              radius: 12,
                              backgroundColor:
                                  primaryColor, // Set the circle background color
                              child: Icon(
                                Icons.camera_alt,
                                size: 15,
                                color: white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Kermache Adlene",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: primaryColor),
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
                      child: buildTextField(nameController, "Name"),
                    ),
                  ),
                  const SizedBox(height: 30),
                  buildTextField(usernameController, "Username"),
                  const SizedBox(height: 30),
                  buildTextField(emailController, "Email"),
                  const SizedBox(height: 30),
                       CustomButton(
              height: 40,
              color:  gradiant ,
              textColor:  Colors.white ,
              onTap: () {
               //
              },
              text: "Save",
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
}
