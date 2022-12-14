import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class CreatePostContainer extends StatelessWidget {
  final User? currentUser;
  const CreatePostContainer({Key? key, this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser!.imageUrl, isActive: true),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                  child: TextField(
                decoration: InputDecoration.collapsed(
                    hintText: 'What\'s on your mind?'),
              ))
            ],
          ),
          const Divider(
            height: 10.0,
            thickness: 0.5,
          ),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                    onPressed: () => print('Add to Story'),
                    icon: const Icon(Icons.videocam, color: Colors.red),
                    label: Text('Live')),
                const VerticalDivider(
                  width: 8.0,
                ),
                TextButton.icon(
                    onPressed: () => print('Add to Story'),
                    icon: const Icon(Icons.photo, color: Colors.green),
                    label: Text('Photo')),
                const VerticalDivider(
                  width: 8.0,
                ),
                TextButton.icon(
                    onPressed: () => print('Add to Story'),
                    icon: const Icon(Icons.video_call,
                        color: Colors.purpleAccent),
                    label: Text('Live')),
                const VerticalDivider(
                  width: 8.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
