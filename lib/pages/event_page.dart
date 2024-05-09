import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:worldskills_ticket_mobile/models/event.dart';
import 'package:worldskills_ticket_mobile/pages/event_details_page.dart';
import 'package:worldskills_ticket_mobile/pages/records_page.dart';
import 'package:worldskills_ticket_mobile/pages/tickets_page.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late Future<List<Event>> _eventsFuture;
  FilterType _selectedFilter = FilterType.all;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _eventsFuture = ReadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Events List',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
            _buildFilterButtons(),
            FutureBuilder(
                future: _eventsFuture,
                builder: (context, data) {
                  if (data.hasError) {
                    return Center(
                      child: Text('${data.error}'),
                    );
                  }
                  if (data.hasData) {
                    List<Event> filteredEvents = _filterEvents(data.data!);
                    return Expanded(
                      child: ListView.builder(
                        itemCount: filteredEvents.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: ((context) => EventDetailsPage()),
                                  ),
                                );
                              },
                              leading: Image.asset(
                                'assets/events_resources/images/${filteredEvents[index].eventPictures?[0]}',
                                width: 100,
                                height: 200,
                                fit: BoxFit.fill,
                              ),
                              title: Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    child: Text(
                                      '${filteredEvents[index].eventTitle}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                  Text(
                                    '${filteredEvents[index].eventText}',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                      '${filteredEvents[index].eventReadStatus ? 'Read' : 'Unread'}')
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {
              _updateFilter(FilterType.all);
            },
            child: Text('All')),
        Text('/'),
        TextButton(
            onPressed: () {
              _updateFilter(FilterType.unread);
            },
            child: Text('Unread')),
        Text('/'),
        TextButton(
            onPressed: () {
              _updateFilter(FilterType.read);
            },
            child: Text('Read')),
      ],
    );
  }

  Future<List<Event>> ReadJsonData() async {
    final jsondata = await rootBundle
        .loadString('assets/events_resources/json/events_data.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => Event.fromJson(e)).toList();
  }

  List<Event> _filterEvents(List<Event> events) {
    if (_selectedFilter == FilterType.all) {
      return events;
    }
    if (_selectedFilter == FilterType.unread) {
      return events.where((event) => !event.eventReadStatus).toList();
    }
    if (_selectedFilter == FilterType.read) {
      return events.where((event) => event.eventReadStatus).toList();
    }
    return events;
  }

  void _updateFilter(FilterType filter) {
    setState(() {
      _selectedFilter = filter;
    });
  }
}

enum FilterType {
  all,
  unread,
  read,
}
