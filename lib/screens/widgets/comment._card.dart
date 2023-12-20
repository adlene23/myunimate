import 'package:flutter/material.dart';
import '../../../core/utils/app_imports.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;

  const CommentWidget(this.comment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: primaryColor, width: 2, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(comment.profileImage),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "User",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(color: primaryColor),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "5 min ago",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(color: backcolor2)
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  comment.text,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: primaryColor),
                  
                ),
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: const Text("reply" ,style: TextStyle(color: secondaryColor),)),
              IconButton(
                icon: const Icon(Icons.arrow_circle_up_rounded),
                onPressed: () {
                  // Handle upvoting
                },
              ),
              Text('${comment.likes}'),
              IconButton(
                icon: const Icon(Icons.arrow_circle_down_rounded),
                onPressed: () {
                  // Handle downvoting
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text('${comment.dislikes}'),
              ),
            ],
          ),
          if (comment.replies != null)
            ...comment.replies!.map((reply) {
              return Container(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: CommentWidget(reply));
            }).toList(),
        ],
      ),
    );
  }
}

class Comment {
  final String profileImage;
  final String username;
  final String text;
  final int likes;
  final int dislikes;
  final List<Comment>? replies;

  Comment({
    required this.profileImage,
    required this.username,
    required this.text,
    this.likes = 0,
    this.dislikes = 0,
    this.replies,
  });
}
