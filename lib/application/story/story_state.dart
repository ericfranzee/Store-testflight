part of 'story_bloc.dart';

@freezed
class StoryState with _$StoryState {
  const factory StoryState({
    @Default([]) List<List<StoryModel?>?> story,
    @Default(true) bool isLoading,
  }) = _StoryState;
}
