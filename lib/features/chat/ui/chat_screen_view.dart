import 'package:awfar_captain/features/chat/ui/widget/message_model.dart';
import 'package:flutter/material.dart';

class ChatScreenView extends StatefulWidget {
  const ChatScreenView({super.key});

  @override
  State<ChatScreenView> createState() => _ChatScreenViewState();
}

class _ChatScreenViewState extends State<ChatScreenView> {
  String id = "0";
  ScrollController scrollController = ScrollController();
  TextEditingController messageController = TextEditingController();

  List<MessageModel> message = [
    MessageModel(
      receiverId: "0",
      senderId: "1",
      content: "السلام عليكم",
      dateTime: "1",
    ),
    MessageModel(
      receiverId: "1",
      senderId: "0",
      content: "عليكم السلام، كيف استطيع مساعدك اليوم",
      dateTime: "2",
    ),
    MessageModel(
      receiverId: "0",
      senderId: "1",
      content: "السلام عليكم",
      dateTime: "3",
    ),
    MessageModel(
      receiverId: "1",
      senderId: "0",
      content: "عليكم السلام، كيف استطيع مساعدك اليوم",
      dateTime: "4",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الدردشه لمساعده الطالب",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0XFF57B4D7),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18.0),
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (message[index].senderId == id) {
                    return buildMyMessage(context, message[index]);
                  }
                  return buildMessage(context, message[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 14.0,
                ),
                itemCount: message.length,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0XFF57B4D7).withOpacity(0.5),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: 'Type your message here...',
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Color(0XFF57B4D7),
                            width: 1.5,
                          ),
                        ),
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12.0),
                        hintStyle: const TextStyle(
                          color: Colors.black45,
                          fontSize: 16.0,
                        ),
                      ),
                      style: const TextStyle(color: Colors.black),
                      maxLines: null,
                    ),
                  ),
                  FloatingActionButton.small(
                    heroTag: "emoji",
                    focusColor: Colors.transparent,
                    foregroundColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    hoverElevation: 0.0,
                    elevation: 0.0,
                    onPressed: () {},
                    child: const Icon(
                      Icons.emoji_emotions_outlined,
                      color: Colors.black54,
                    ),
                  ),
                  FloatingActionButton.small(
                    heroTag: "image",
                    backgroundColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    foregroundColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverElevation: 0.0,
                    elevation: 0.0,
                    onPressed: () {},
                    child: const Icon(
                      Icons.image_outlined,
                      color: Colors.black54,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: 35.0,
                    width: 35.0,
                    child: FloatingActionButton(
                      heroTag: "send",
                      onPressed: () {},
                      elevation: 7.0,
                      backgroundColor: Colors.black38,
                      child: const Icon(
                        Icons.send,
                        color: Color(0XFF57B4D7),
                        size: 22.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMyMessage(context, MessageModel message) => Align(
    alignment: AlignmentDirectional.topStart,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(15.0),
          topEnd: Radius.circular(15.0),
          topStart: Radius.circular(15.0),
        ),
        color: Color(0XFF57B4D7),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message.content,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    ),
  );

  Widget buildMessage(context, MessageModel message) => Align(
    alignment: AlignmentDirectional.topEnd,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadiusDirectional.only(
          bottomStart: Radius.circular(15.0),
          topEnd: Radius.circular(15.0),
          topStart: Radius.circular(15.0),
        ),
        color: Colors.grey[300],
      ),
      child: Column(
        children: [
          Text(
            message.content,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ],
      ),
    ),
  );
}