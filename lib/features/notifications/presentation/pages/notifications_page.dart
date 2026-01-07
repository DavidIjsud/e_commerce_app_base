import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/features/notifications/presentation/blocs/notifications_bloc.dart';
import 'package:e_commerce_app_base/features/notifications/presentation/blocs/notifications_events.dart';
import 'package:e_commerce_app_base/features/notifications/presentation/blocs/notifications_states.dart';
import 'package:e_commerce_app_base/features/notifications/presentation/widgets/notification_section.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) {
        final bloc = Get.injector<NotificationsBloc>();
        bloc.add(const NotificationsInitialized());
        return bloc;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: colors.neutral100,
              size: 20,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            l10n.notification_page_title,
            style: typography.heading5Bold.copyWith(
              color: colors.neutral100,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<NotificationsBloc, NotificationsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.isError) {
              return Center(
                child: Text(
                  state.errorMessage ?? 'An error occurred',
                  style: typography.bodyMediumRegular.copyWith(
                    color: colors.neutral60,
                  ),
                ),
              );
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state.todayNotifications.isNotEmpty)
                    NotificationSection(
                      title: l10n.notification_section_today,
                      notifications: state.todayNotifications,
                    ),
                  if (state.yesterdayNotifications.isNotEmpty)
                    NotificationSection(
                      title: l10n.notification_section_yesterday,
                      notifications: state.yesterdayNotifications,
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
