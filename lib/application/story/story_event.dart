part of 'story_bloc.dart';

@freezed
abstract class StoryEvent with _$StoryEvent {
  const factory StoryEvent.fetchStory(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller}) = FetchStory;




}
