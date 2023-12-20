import 'package:flutter/material.dart';
import '../../../core/utils/app_imports.dart';
import '../../widgets/comment._card.dart';

class CommentPageSpecialty extends StatefulWidget {
  const CommentPageSpecialty({super.key});

  @override
  _CommentPageSpecialtyState createState() => _CommentPageSpecialtyState();
}

class _CommentPageSpecialtyState extends State<CommentPageSpecialty> {
  List<Comment> comments = [
    Comment(
      profileImage: 'assets/images/profile1.jpg',
      username: 'User1',
      text: 'This is the first comment',
      likes: 10,
      dislikes: 3,
      replies: [
        Comment(
            profileImage: 'assets/images/profile1.jpg',
            username: 'User2',
            text: 'Reply to first comment'),
        Comment(
            profileImage: 'assets/images/profile3.jpg',
            username: 'user4',
            text: 'Second reply')
      ],
    ),
    Comment(
      profileImage: 'assets/images/profile4.jpg',
      username: 'User3',
      text:
          'Another comment here but it\'s very long to test the text wrapping',
      likes: 5,
      dislikes: 1,
    ),
    // Add more comments as needed
  ];

  dynamic profileImage = const AssetImage("assets.images/profile1");

  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              'Q&A',
              style:Theme.of(context).textTheme.headline2!.copyWith(color: secondaryColor),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (BuildContext context, int index) {
                  return CommentWidget(comments[index]);
                },
              ),
            ),
            const Divider(height: 1, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      style:  Theme.of(context).textTheme.bodyLarge!.copyWith(color: primaryColor),
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: 'Write a question ...',
                        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: primaryColor),
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: primaryColor)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: primaryColor),
                    ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        comments.add(
                          Comment(
                            profileImage: 'assets/images/profile2.jpg',
                            username: 'CurrentUser',
                            text: _commentController.text,
                          ),
                        );
                        _commentController.clear();
                      });

                      FocusScope.of(context).unfocus();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          secondaryColor), // Change background color
                      foregroundColor: MaterialStateProperty.all<Color>(
                          primaryColor), // Change font color
                      side: MaterialStateProperty.all<BorderSide>(
                        const BorderSide(
                            color: primaryColor,
                            width: 1.0), // Change border color
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Set the border radius
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 12.0), // Adjust padding
                      ),
                    ),
                    child: const Text(
                      "Post",
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
