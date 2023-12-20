import 'package:flutter/material.dart';
import 'package:unimate/screens/bookmark.dart';
import '../../../core/utils/app_imports.dart';
import '../../models/post_model.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    NetworkImage? cardImage;
    if (widget.post.imageUrl != null) cardImage = NetworkImage(widget.post.imageUrl!);
    var postText = widget.post.content;

    return Card(
      elevation: 0,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: null,
              radius: 25,
            ),
            title:  Text(
              "Summers Fin",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(color: primaryColor),
            ),
            subtitle: Text(
              "30 minutes ago",
              style:
                  Theme.of(context).textTheme.labelSmall!.copyWith(color: backcolor2),
            ),
            trailing: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return const BookmarkPage(); // Call the HalfPage widget here
                    },
                  );
                },
                icon: const Icon(Unicons.bookmark_border)),
          ),
          if (cardImage != null)
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: cardImage, fit: BoxFit.cover),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              height: MediaQuery.of(context).size.width * 0.95 * 9 / 16,
              width: MediaQuery.of(context).size.width * 0.95,
            ),
          Container(
            margin: const EdgeInsets.only(left: 1),
            padding: const EdgeInsets.fromLTRB(16, 16, 32, 16),
            alignment: Alignment.centerLeft,
            child: Text(
              postText,
              style:  Theme.of(context).textTheme.bodyMedium!.copyWith(color: backcolor2),
            ),
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 45)),
              Row(children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Unicons.up_circle,
                      color: secondaryColor,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Unicons.down_circle,
                      color: gray,
                    )),
              ]),
              const Spacer(
                flex: 1,
              ),
              Text(
                "8 likes",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(color: backcolor2),
              ),
              const Spacer(
                flex: 1,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/comments');
                },
                icon: const Icon(Unicons.comment,color: primaryColor,),
                color: gray,
              ),
              const Padding(padding: EdgeInsets.only(left: 48)),
            ],
          )
        ],
      ),
    );
  }
}
