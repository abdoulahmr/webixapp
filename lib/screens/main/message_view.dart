import "package:digital_app/config.dart";
import "package:digital_app/functions/fetchData.dart";
import "package:digital_app/functions/submit_data.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

class MessageView extends StatefulWidget {
  final String requestID;
  final String userID;
  const MessageView({super.key, required this.requestID, required this.userID});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Webix Services",
          style: TextStyle(
            color: AppColors().primaryColor, fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<dynamic>?>(
              stream: fetchMessages(widget.requestID),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No messages found.'));
                }

                final messages = snapshot.data!;
                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: messages[index]['user_id'] == 3
                            ? Colors.grey.withOpacity(0.1)
                            : AppColors().secondaryColor.withOpacity(0.3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.05),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(messages[index]['message']),
                        subtitle: Text(
                          DateFormat('dd/MM/yyyy HH:mm').format(
                            DateFormat('EEE, dd MMM yyyy HH:mm:ss z').parse(messages[index]['created_at']),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          color: AppColors().primaryColor,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: messageController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Type a message',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.send,
                color: AppColors().secondaryColor,
              ),
              onPressed: () {
                sendMessage(
                  messageController.text,
                  int.parse(widget.userID),
                  int.parse(widget.requestID),
                  context,
                );
                messageController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
