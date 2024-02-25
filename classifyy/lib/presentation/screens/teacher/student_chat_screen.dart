import 'package:auto_route/auto_route.dart';
import 'package:classifyy/cubits/chat_cubit.dart';
import 'package:classifyy/models/chat/chat_message.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/inputs/text_field_chat.dart';
import 'package:classifyy/presentation/widgets/layouts/primary_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class StudentChatScreen extends StatefulWidget {
  final String studentName;

  const StudentChatScreen({super.key, required this.studentName});

  @override
  State<StudentChatScreen> createState() => _StudentChatScreenState();
}

class _StudentChatScreenState extends State<StudentChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final chatCubit = BlocProvider.of<ChatCubit>(context);

    Widget buildMessage(BuildContext context, ChatMessage chatMessage) {
      return SizedBox(
        width: ScreenSizes.widthSlabFourRel(context),
        child: Text(
          chatMessage.text,
          textAlign: chatMessage.chatMessageType == ChatMessageType.currentUser
              ? TextAlign.right
              : TextAlign.left,
        ),
      );
    }

    return PrimaryLayout(
      appBarTitle: "${widget.studentName}'s chat",
      children: [
        BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.chatMessages.length,
              itemBuilder: (context, index) {
                return buildMessage(context, state.chatMessages[index]);
              },
            );
          },
        ),
        const Expanded(child: SizedBox.shrink()),
        TextFieldChat(
          labelText: 'New message...',
          controller: _messageController,
          onPressed: () {
            chatCubit.sendMessage(_messageController.text);
            _messageController.clear();
          },
        ),
      ],
    );
  }
}
