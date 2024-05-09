import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:worldskills_ticket_mobile/config/app_routes.dart';
import 'package:worldskills_ticket_mobile/pages/event_page.dart';
import 'package:worldskills_ticket_mobile/pages/main_page.dart';
import 'package:worldskills_ticket_mobile/pages/records_page.dart';
import 'package:worldskills_ticket_mobile/pages/tickets_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: AppRoutes.pages,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          Navigator.of(context).pushNamed('/events');
          break;
        case 'Tickets':
          Navigator.of(context).pushNamed('/tickets');
          break;
        case 'Records':
          Navigator.of(context).pushNamed('/records');
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
      body: Container(),
    );
  }
}
