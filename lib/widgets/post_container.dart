import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                const SizedBox(
                  height: 4.0,
                ),
                Text(post.caption),
                post.imageUrl != null
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        height: 6.0,
                      ),
              ],
            ),
          ),
          post.imageUrl != ""
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(
                    imageUrl: post.imageUrl,
                  ),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: _PostStats(post: post),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _PostButton(
                icon: Icon(
                  MdiIcons.thumbUpOutline,
                  color: Colors.grey[600],
                  size: 20,
                ),
                label: "Like",
                onTap: () => {},
              ),
              _PostButton(
                icon: Icon(
                  MdiIcons.commentOutline,
                  color: Colors.grey[600],
                  size: 20,
                ),
                label: "Comment",
                onTap: () => {},
              ),
              _PostButton(
                icon: Icon(
                  MdiIcons.shareOutline,
                  color: Colors.grey[600],
                  size: 20,
                ),
                label: "Share",
                onTap: () => {},
              )
            ],
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post? post;
  const _PostHeader({Key? key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post!.user.imageUrl),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post!.user.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post!.timeAgo} • ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                        fontSize: 12.0),
                  ),
                  Icon(Icons.public, color: Colors.grey[600], size: 12.0)
                ],
              )
            ],
          ),
        ),
        IconButton(
            onPressed: () => print("add more"), icon: Icon(Icons.more_horiz)),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post? post;
  const _PostStats({Key? key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
                color: Palette.facebookBlue, shape: BoxShape.circle),
            child: Icon(
              Icons.thumb_up,
              size: 10.0,
              color: Colors.white,
            )),
        const SizedBox(
          width: 4.0,
        ),
        Expanded(
          child: Text(
            '${post!.likes}',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        Text(
          '${post!.comments} Comments',
          style: TextStyle(color: Colors.grey[600]),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          '${post!.shares} Shares',
          style: TextStyle(color: Colors.grey[600]),
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon? icon;
  final String? label;
  final VoidCallback? onTap;
  const _PostButton({Key? key, this.icon, this.label, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onTap,
        icon: icon!,
        label: Text(
          label!,
          style: TextStyle(color: Colors.grey[600]),
        ));
  }
}
