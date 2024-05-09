import 'package:flutter/material.dart';
import 'package:worldskills_ticket_mobile/models/event.dart';
import 'package:worldskills_ticket_mobile/pages/event_details_page.dart';
import 'package:worldskills_ticket_mobile/pages/event_page.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  GlobalKey<NavigatorState> eventsNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: eventsNavigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context) {
            if (settings.name == '/eventDetails') {
              return EventDetailsPage();
            }
            return EventsPage();
          });
        });
  }
}
