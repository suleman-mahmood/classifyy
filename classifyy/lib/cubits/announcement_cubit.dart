import 'package:bloc/bloc.dart';
import 'package:classifyy/models/announcement/announcement.dart';
import 'package:classifyy/repositories/repository.dart';

part 'announcement_state.dart';

class AnnouncementCubit extends Cubit<AnnouncementState> {
  final Repository repository;

  AnnouncementCubit(this.repository) : super(const AnnouncementInitial());

  Future<void> fetchAnnouncements(
    int startIndex,
    int endIndex, {
    String? classId,
    String? studentId,
  }) async {
    emit(const AnnouncementLoading());

    final announcements = await repository.fetchAnnouncements(
      startIndex,
      endIndex,
      classId: classId,
      studentId: studentId,
    );

    emit(AnnouncementSuccess(announcements: announcements));
  }

  Future<void> createAnnouncement(String text,
      {String? classId, int startIndex = 0, int endIndex = 100}) async {
    emit(AnnouncementLoading(announcements: state.announcements));

    await repository.createAnnouncement(text, classId);
    final announcements = await repository.fetchAnnouncements(
      startIndex,
      endIndex,
      classId: classId,
    );

    emit(AnnouncementSuccess(announcements: announcements));
  }
}
