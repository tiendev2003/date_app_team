import 'package:flutter/material.dart';
import '../data/model/notification_model.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for demonstration
    final notificationModel = NotificationModel(
      notificationData: [
        NotificationDatum(
          id: "1",
          uid: "user1",
          datetime: DateTime.now(),
          title: "Sample Title 1",
          description: "Sample Description 1",
        ),
        NotificationDatum(
          id: "2",
          uid: "user2",
          datetime: DateTime.now(),
          title: "Sample Title 2",
          description: "Sample Description 2",
        ),
      ],
      responseCode: "200",
      result: "Success",
      responseMsg: "Data fetched successfully",
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Notifications"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: notificationModel.notificationData?.length ?? 0,
        itemBuilder: (context, index) {
          final notification = notificationModel.notificationData![index];
          return ListTile(
            title: Text(
              notification.title ?? "No Title",
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.description ?? "No Description",
                ),
                Text(notification.datetime?.toIso8601String() ?? "No Date"),
              ],
            ),
            trailing: Text(
              notification.datetime != null
                  ? "${notification.datetime!.day}/${notification.datetime!.month}/${notification.datetime!.year}"
                  : "No Date",
            ),
          );
        },
      ),
    );
  }
}
