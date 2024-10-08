import 'package:flutter/material.dart';
import '../components/my_appbar.dart';
import '../components/my_drawer.dart';
import '../components/user_tile.dart';
import '../models/message.dart';
import '../services/auth/auth_service.dart';
import '../services/chat/chat_service.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage();

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  Widget _buildUserList() {
    return StreamBuilder<List<Users>>(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading..");
        }
        return ListView(
          children: snapshot.data!
              .map<Widget>((user) => _buildUserListItem(user, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(Users user, BuildContext context) {
    if (_authService.getCurrentUser()!.email != user.email) {
      return UserTile(
        user: user,
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: user.email,
                receiverID: user.uid,
              ),
            ),
          );
          await _chatService.markMessagesAsRead(
              _authService.getCurrentUser()!.uid, user.uid);
        },
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: MyAppBar(
        title: "U S E R S",
        actions: [],
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }
}
