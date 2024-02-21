part of 'announcement_cubit.dart';

sealed class AnnouncementState {
  final List<Announcement> announcements;

  final String errorMessage;

  const AnnouncementState({
    this.errorMessage = '',
    this.announcements = const [],
  });
}

final class AnnouncementInitial extends AnnouncementState {
  const AnnouncementInitial();
}

final class AnnouncementLoading extends AnnouncementState {
  const AnnouncementLoading();
}

final class AnnouncementSuccess extends AnnouncementState {
  const AnnouncementSuccess({super.announcements});
}

final class AnnouncementFailure extends AnnouncementState {
  const AnnouncementFailure({super.errorMessage});
}