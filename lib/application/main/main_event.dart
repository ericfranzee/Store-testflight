part of 'main_bloc.dart';

@freezed
abstract class MainEvent with _$MainEvent {
  const factory MainEvent.changeIndex(
      {required int index}) = ChangeIndex;

  const factory MainEvent.changeForYou(
      {required bool value}) = ChangeForYou;

  const factory MainEvent.showSearch(
      {required bool value}) = ShowSearch;
}
