import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:worldskills_ticket_mobile/pages/event_details_page.dart';
import 'package:worldskills_ticket_mobile/pages/event_page.dart';
import 'package:worldskills_ticket_mobile/pages/records_page.dart';
import 'package:worldskills_ticket_mobile/pages/tickets_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  QuickActions quickActions = QuickActions();

  void setQuickActions() {
    quickActions.setShortcutItems([
      const ShortcutItem(type: 'Events', localizedTitle: 'Events Page'),
      const ShortcutItem(type: 'Tickets', localizedTitle: 'Tickets Page'),
      const ShortcutItem(type: 'Records', localizedTitle: 'Records Page')
    ]);
  }

  void handleNavigation() {
    quickActions.initialize((type) {
      switch (type) {
        case 'Events':
          setState(() {
            currentIndex = 0;
          });
          break;
        case 'Tickets':
          setState(() {
            currentIndex = 1;
          });
          break;
        case 'Records':
          setState(() {
            currentIndex = 2;
          });
          break;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setQuickActions();
    handleNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket_outlined), label: 'Tickets'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_camera_front), label: 'Records'),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        iconSize: 0,
      ),
    );
  }

  final pages = [
    EventsPage(),
    TicketsPage(),
    RecordsPage(),
  ];
}
