import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/notifications/presentation/blocs/notifications_events.dart';
import 'package:e_commerce_app_base/features/notifications/presentation/blocs/notifications_states.dart';
import 'package:e_commerce_app_base/features/notifications/presentation/models/notification_view_model.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(const NotificationsState()) {
    on<NotificationsInitialized>(_onNotificationsInitialized);
  }

  Future<void> _onNotificationsInitialized(
    NotificationsInitialized event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(state.copyWith(status: NotificationsStatus.loading));

    try {
      // Simulate a small delay as if loading from API
      await Future.delayed(const Duration(milliseconds: 300));

      // Mock data matching the screenshot
      final todayNotifications = [
        NotificationViewModel(
          id: '1',
          type: NotificationType.discount,
          title: '30% Special Discount!',
          description: 'Special promotion only valid today',
          timestamp: DateTime.now(),
        ),
        NotificationViewModel(
          id: '2',
          type: NotificationType.success,
          title: 'Your Order Has Been Taken by the Driver',
          description: 'Recenty1',
          timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        ),
        NotificationViewModel(
          id: '3',
          type: NotificationType.error,
          title: 'Your Order Has Been Canceled',
          description: '19 Jun 2023',
          timestamp: DateTime(2023, 6, 19),
        ),
      ];

      final yesterdayNotifications = [
        NotificationViewModel(
          id: '4',
          type: NotificationType.email,
          title: '35% Special Discount!',
          description: 'Special promotion only valid today',
          timestamp: DateTime.now().subtract(const Duration(days: 1)),
        ),
        NotificationViewModel(
          id: '5',
          type: NotificationType.account,
          title: 'Account Setup Successfull!',
          description: 'Special promotion only valid today',
          timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
        ),
        NotificationViewModel(
          id: '6',
          type: NotificationType.discount,
          title: 'Special Offer! 60% Off',
          description: 'Special offer for new account, valid until 20 Nov 2022',
          timestamp: DateTime(2022, 11, 20),
        ),
        NotificationViewModel(
          id: '7',
          type: NotificationType.payment,
          title: 'Credit Card Connected',
          description: 'Special promotion only valid today',
          timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 5)),
        ),
      ];

      emit(state.copyWith(
        status: NotificationsStatus.loaded,
        todayNotifications: todayNotifications,
        yesterdayNotifications: yesterdayNotifications,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: NotificationsStatus.error,
        errorMessage: 'Failed to load notifications',
      ));
    }
  }
}
