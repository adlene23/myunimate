import 'package:flutter/material.dart';
import 'package:unimate/screens/widgets/custom_botton.dart';

import '../widgets/app_bar.dart';

class ResourceScreen extends StatefulWidget {
  const ResourceScreen({super.key});

  @override
  _ResourceScreenState createState() => _ResourceScreenState();
}

class _ResourceScreenState extends State<ResourceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UniAppBar(appTitle: "Td Algebra matrices"),
      body: Column(
        children: [
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(24),
                    child: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.jfjdsfhjbajbdfhjbad.\n\n https://www.math.stonybrook.edu/~aknapp/download/b2-alg-inside.pdf",
                      style: TextStyle(fontSize: 18),
                    )),
              )
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  padding: 0,
                  height: 40,
                  width: 90,
                  onTap: () {}, 
                  text: "Rate"),
                const SizedBox(
                  width: 10,
                ),
                CustomButton(
                  padding: 0,
                  height: 40,
                  width: 180,
                  onTap: () {}, 
                  text: "Add to Collection"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
