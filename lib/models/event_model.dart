class EventModel {
  final String id;
  final String title;
  final String description;
  final String date;
  final String location;
  final int attendees;
  final String organizerId;
  final String? userName;
  final String category;
  final String? imageUrl;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.attendees,
    required this.organizerId,
    required this.category,
    required this.userName,
    this.imageUrl,
  });

  EventModel copyWith({
    String? id,
    String? title,
    String? description,
    String? date,
    String? location,
    int? attendees,
    String? organizerId,
    String? category,
    String? userName,
    String? imageUrl,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      location: location ?? this.location,
      attendees: attendees ?? this.attendees,
      organizerId: organizerId ?? this.organizerId,
      category: category ?? this.category,
      userName: userName ?? this.userName,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  factory EventModel.fromMap(Map<String, dynamic> map, String documentId) {
    return EventModel(
      id: documentId,
      title: map['title'],
      description: map['description'],
      date: map['date'],
      location: map['location'],
      attendees: map['attendees'],
      organizerId: map['organizerId'],
      category: map['category'],
      userName: map['userName'],
      imageUrl: map['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'location': location,
      'attendees': attendees,
      'organizerId': organizerId,
      'category': category,
      'userName': userName,
      'imageUrl': imageUrl,
    };
  }
}
