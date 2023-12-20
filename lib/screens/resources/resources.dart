import 'package:flutter/material.dart';
import '../../../core/utils/app_imports.dart';
import '../widgets/custom_botton.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({super.key});

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: const Text("Resources",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child:   TextField(
  decoration: InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    labelText: 'Search',
    labelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(color: backcolor2),
    hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(color: backcolor2),
    hintText: 'Enter search text',
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
)
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 10, // Replace with your actual item count
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 8.0, // Spacing between columns
                  mainAxisSpacing: 8.0, // Spacing between rows
                ),
                itemBuilder: (BuildContext context, int index) {
                  // Replace this container with your actual grid item widget
                  return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: backcolor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Td algebra: matrices",
                                style: TextStyle(fontSize: 14),
                              ),
                              Icon(Icons.add)
                            ],
                          ),
                          const Text(
                            "some description of this great resource in matrices and their applications",
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Specialty",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "artifical intellignece",
                                    style: TextStyle(fontSize: 10),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "type:",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "pdf",
                                    style: TextStyle(fontSize: 10),
                                  )
                                ],
                              )
                            ],
                          ),
                          CustomButton(
                            color: gradiant,
                              padding: 0,
                              height: 35,
                              width: 100,
                              onTap: () {
                                Navigator.pushNamed(context, '/resource');
                              },
                              text: "view"),
                        ],
                      ));
                }),
          )
        ],
      ),
    );
  }
}
