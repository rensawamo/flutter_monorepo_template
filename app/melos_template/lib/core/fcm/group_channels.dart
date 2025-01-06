import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final List<AndroidNotificationChannelGroup> notificationChannelGroups = [
  const AndroidNotificationChannelGroup(
    'group_1',
    'General Notifications',
    description: 'This group contains general notifications',
  ),
  const AndroidNotificationChannelGroup(
    'group_2',
    'Promotional Notifications',
    description: 'This group contains promotional and marketing notifications',
  ),
];

final List<AndroidNotificationChannel> notificationChannels = [
  const AndroidNotificationChannel(
    'channel_1',
    'News Alerts',
    description: 'Get the latest news updates directly in your notifications.',
    importance: Importance.high,
    groupId: 'group_1',
  ),
  const AndroidNotificationChannel(
    'channel_2',
    'Daily Reminders',
    description: 'Daily reminders for tasks and goals.',
    groupId: 'group_1',
  ),
  const AndroidNotificationChannel(
    'channel_3',
    'Special Offers',
    description: 'Exclusive deals and discounts for you.',
    importance: Importance.high,
    groupId: 'group_2',
  ),
];
