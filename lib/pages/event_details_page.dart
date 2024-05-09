import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:worldskills_ticket_mobile/models/event.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Text('Event Details'),
            Spacer(),
            Text(
              'title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text('text'),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget getPictures(int imageCount, List<String>? images) {
    List<Widget> imagesToDisplay = [];
    for (var i = 0; i < imageCount; i++) {
      var toArr = Image.asset(
        'assets/events_resources/images/${images?[i]}',
        width: 120,
        height: 128,
        fit: BoxFit.fill,
      );
      imagesToDisplay.add(toArr);
      imagesToDisplay.add(SizedBox(
        width: 8,
      ));
    }
    return Row(
      children: imagesToDisplay,
    );
  }
}
