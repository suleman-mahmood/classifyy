import 'package:auto_route/auto_route.dart';
import 'package:classifyy/cubits/chat_cubit.dart';
import 'package:classifyy/models/chat/chat_message.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/inputs/text_field_chat.dart';
import 'package:classifyy/presentation/widgets/layouts/primary_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class StudentChatScreen extends StatefulWidget {
  final String studentName;
  final String otherUserId;

  const StudentChatScreen({
    super.key,
    required this.studentName,
    required this.otherUserId,
  });

  @override
  State<StudentChatScreen> createState() => _StudentChatScreenState();
}

class _StudentChatScreenState extends State<StudentChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final chatCubit = BlocProvider.of<ChatCubit>(context);

    Widget buildMessage(BuildContext context, ChatMessage chatMessage,
        {bool loading = false}) {
      return Opacity(
        opacity: loading ? 0.5 : 1,
        child: SizedBox(
          width: ScreenSizes.widthSlabFourRel(context),
          child: Text(
            chatMessage.text,
            textAlign: chatMessage.chatMessageType == ChatMessageType.currentUser
                ? TextAlign.right
                : TextAlign.left,
          ),
        ),
      )
          .animate(onPlay: (controller) => controller.repeat())
          .shimmer(duration: loading ? 1.seconds : 0.seconds);
    }

    return PrimaryLayout(
      appBarTitle: "${widget.studentName}'s chat",
      children: [
        BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            if (state is ChatLoading) {
              return buildMessage(
                context,
                ChatMessage(
                  id: '1',
                  text: 'Some message',
                  sentAt: DateTime.now().subtract(5.minutes),
                  chatMessageType: ChatMessageType.currentUser,
                ),
                loading: true,
              );
            }
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
            chatCubit.sendMessage(_messageController.text, widget.otherUserId);
            _messageController.clear();
          },
        ),
      ],
    );
  }
}
