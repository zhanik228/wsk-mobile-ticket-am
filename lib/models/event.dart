class Event {
  String? eventId;
  String? eventTitle;
  String? eventText;
  bool eventReadStatus;
  List<String>? eventPictures;

  Event(
      {this.eventId,
      this.eventTitle,
      this.eventText,
      required this.eventReadStatus,
      this.eventPictures});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventId: json['eventid'],
      eventTitle: json['eventTitle'],
      eventText: json['eventText'],
      eventReadStatus: json['eventReadStatus'],
      eventPictures: List<String>.from(json['eventPictures']),
    );
  }
}
