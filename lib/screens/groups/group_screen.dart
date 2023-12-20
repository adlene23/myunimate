import 'package:flutter/material.dart';
import '../../../core/utils/app_imports.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 430,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: 350,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/post3.jpg"))),
                ),
                Positioned(
                    left: 30,
                    top: 50,
                    child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(150, 255, 255, 255),
                            borderRadius: BorderRadius.circular(8)),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                          ),
                        ))),
                Positioned(
                    left: 25,
                    right: 25,
                    top: 250,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black26, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Ensia Family",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("200 members"),
                          const SizedBox(
                            height: 5,
                          ),
                          const Expanded(
                              child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor")),
                          ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        secondaryColor),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        primaryColor),
                                side: MaterialStateProperty.all<BorderSide>(
                                  const BorderSide(
                                      color: primaryColor, width: 1.0),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                ),
                                padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 50.0)),
                              ),
                              child: const Text("join"))
                        ],
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
