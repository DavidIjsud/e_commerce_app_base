import 'package:equatable/equatable.dart';

enum NotificationType {
  discount,
  success,
  error,
  email,
  account,
  payment,
}

class NotificationViewModel extends Equatable {
  const NotificationViewModel({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.timestamp,
    this.isRead = false,
  });

  final String id;
  final NotificationType type;
  final String title;
  final String description;
  final DateTime timestamp;
  final bool isRead;

  @override
  List<Object?> get props => [id, type, title, description, timestamp, isRead];

  NotificationViewModel copyWith({
    String? id,
    NotificationType? type,
    String? title,
    String? description,
    DateTime? timestamp,
    bool? isRead,
  }) {
    return NotificationViewModel(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
    );
  }
}
