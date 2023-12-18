import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_library/pages/profile_page/repo/models/user.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitial;
  const factory ProfileState.loading() = ProfileLoading;
  const factory ProfileState.loaded({required User? user}) = ProfileLoaded;
  const factory ProfileState.error() = ProfileError;
}
