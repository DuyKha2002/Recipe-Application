import 'package:flutter/material.dart';
import 'package:recipe/models/comment.dart';
import 'package:recipe/models/user.dart';

class CommentSection extends StatefulWidget {
  final List<Comment> comments;

  const CommentSection({Key? key, required this.comments}) : super(key: key);

  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final TextEditingController _userCommentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Comments",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.comments.length,
          itemBuilder: (context, index) {
            final comment = widget.comments[index];
            return ListTile(
              title: Text(comment.userName),
              subtitle: Text(comment.userComment),
            );
          },
        ),
        const SizedBox(height: 10),
        if (AuthService.isLoggedIn()) ...[
          TextField(
            controller: _userCommentController,
            decoration: const InputDecoration(
              labelText: "Your Comment",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              if (_userCommentController.text.isNotEmpty) {
                setState(() {
                  widget.comments.add(
                    Comment(
                      userName: AuthService.currentUser!.userName,
                      userComment: _userCommentController.text,
                    ),
                  );
                  _userCommentController.clear();
                });
              }
            },
            child: const Text("Add Comment"),
          ),
        ] else ...[
          const Text(
            "You must be logged in to comment.",
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
          ),
        ],
      ],
    );
  }
}
