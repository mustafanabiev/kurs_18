import 'package:flash_chat/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: userModel.isMe! ? const Color(0xffE6FBCB) : Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: const Radius.circular(25),
          bottomRight: const Radius.circular(25),
          topLeft: userModel.isMe!
              ? const Radius.circular(25)
              : const Radius.circular(0),
          topRight: !userModel.isMe!
              ? const Radius.circular(25)
              : const Radius.circular(0),
        ),
      ),
      margin: EdgeInsets.only(
        top: 10,
        left: userModel.isMe! ? size.width / 3.5 : 4,
        right: !userModel.isMe! ? size.width / 3.5 : 4,
      ),
      padding: EdgeInsets.symmetric(
        vertical: !userModel.isMe! ? 6 : 16,
        horizontal: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!userModel.isMe!)
                  Text(
                    userModel.user,
                    style: const TextStyle(fontSize: 16, color: Colors.red),
                  ),
                Text(
                  userModel.sms,
                  style: const TextStyle(fontSize: 16),
                  textAlign: userModel.isMe! ? TextAlign.end : TextAlign.start,
                ),
              ],
            ),
          ),
          Text(
            DateFormat('dd/MM/yy (hh:mm)').format(userModel.dateTime),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
