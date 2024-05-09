import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:worldskills_ticket_mobile/pages/event_page.dart';
import 'package:worldskills_ticket_mobile/pages/records_page.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('Tickets Page'),
    ));
  }
}
