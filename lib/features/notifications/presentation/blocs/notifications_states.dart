import 'package:equatable/equatable.dart';
import 'package:e_commerce_app_base/features/notifications/presentation/models/notification_view_model.dart';

enum NotificationsStatus { initial, loading, loaded, error }

class NotificationsState extends Equatable {
  const NotificationsState({
    this.status = NotificationsStatus.initial,
    this.todayNotifications = const [],
    this.yesterdayNotifications = const [],
    this.errorMessage,
  });

  final NotificationsStatus status;
  final List<NotificationViewModel> todayNotifications;
  final List<NotificationViewModel> yesterdayNotifications;
  final String? errorMessage;

  bool get isLoading => status == NotificationsStatus.loading;
  bool get isLoaded => status == NotificationsStatus.loaded;
  bool get isError => status == NotificationsStatus.error;

  @override
  List<Object?> get props => [
        status,
        todayNotifications,
        yesterdayNotifications,
        errorMessage,
      ];

  NotificationsState copyWith({
    NotificationsStatus? status,
    List<NotificationViewModel>? todayNotifications,
    List<NotificationViewModel>? yesterdayNotifications,
    String? errorMessage,
  }) {
    return NotificationsState(
      status: status ?? this.status,
      todayNotifications: todayNotifications ?? this.todayNotifications,
      yesterdayNotifications:
          yesterdayNotifications ?? this.yesterdayNotifications,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
