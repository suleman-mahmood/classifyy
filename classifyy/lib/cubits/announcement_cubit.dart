import 'package:bloc/bloc.dart';
import 'package:classifyy/models/announcement/announcement.dart';
import 'package:classifyy/models/user/user.dart';
import 'package:classifyy/repositories/repository.dart';

part 'announcement_state.dart';

class AnnouncementCubit extends Cubit<AnnouncementState> {
  final Repository repository;

  AnnouncementCubit(this.repository) : super(const AnnouncementInitial());

  Future<void> fetchAnnouncements(int startIndex, int endIndex) async {
    emit(const AnnouncementLoading());

    final announcements = await repository.fetchAnnouncements(
      startIndex,
      endIndex,
    );

    emit(AnnouncementSuccess(announcements: announcements));
  }

  Future<void> createAnnouncement(String text) async {
    emit(AnnouncementLoading(announcements: state.announcements));

    await repository.createAnnouncement(text);

    final announcement = Announcement(
      id: '4',
      text: text,
      createdAt: DateTime.now(),
      announcerId: 'user_1',
      announcerRole: UserRole.teacher,
    );

    emit(AnnouncementSuccess(
      announcements: state.announcements + [announcement],
    ));
  }
}
