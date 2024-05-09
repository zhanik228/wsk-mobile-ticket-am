import 'package:worldskills_ticket_mobile/pages/event_page.dart';
import 'package:worldskills_ticket_mobile/pages/main_page.dart';
import 'package:worldskills_ticket_mobile/pages/records_page.dart';
import 'package:worldskills_ticket_mobile/pages/tickets_page.dart';

class AppRoutes {
  static final pages = {
    '/': (context) => const MainPage(),
    '/events': (context) => const EventsPage(),
    '/tickets': (context) => const TicketsPage(),
    '/records': (context) => const RecordsPage(),
  };

  static const events = '/events';
  static const tickets = '/tickets';
  static const records = '/records';
}
