part of 'main_bloc.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(0) int selectIndex,
    @Default(true) bool selectForYou,
    @Default(true) bool isShowSearch,
  }) = _MainState;
}
