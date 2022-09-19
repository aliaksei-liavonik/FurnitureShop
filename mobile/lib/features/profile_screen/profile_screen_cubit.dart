import 'package:cqrs/cqrs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:logging/logging.dart';

part 'profile_screen_cubit.freezed.dart';

class ProfileScreenCubit extends Cubit<ProfileScreenState> {
  ProfileScreenCubit({
    required CQRS cqrs,
  })  : _cqrs = cqrs,
        super(const ProfileScreenInitialState());

  final CQRS _cqrs;

  final _logger = Logger('ProfileScreenCubit');

  Future<void> fetch() async {
    state.maybeMap(
      success: (state) =>
          emit(ProfileScreenLoadingState(userInfo: state.userInfo)),
      orElse: () => emit(const ProfileScreenLoadingState()),
    );

    await _fetch();
  }

  Future<void> _fetch() async {
    try {
      final res = await _cqrs.get(UserInfo());
      emit(ProfileScreenSuccessState(userInfo: res));
    } catch (err, st) {
      _logger.severe('Cant get user info', err, st);
      emit(ProfileScreenErrorState(error: err.toString()));
    }
  }

  Future<void> updateProfile({
    String? username,
    String? name,
    String? surname,
    String? address,
  }) async {
    state.maybeMap(
      success: (state) =>
          emit(ProfileScreenLoadingState(userInfo: state.userInfo)),
      orElse: () => emit(const ProfileScreenLoadingState()),
    );
    try {
      final res = await _cqrs.run(
        UpdateProfile(
          firstname: name,
          surname: surname,
          username: username,
          address: address,
        ),
      );

      if (res.success) {
        await _fetch();
      }
    } catch (err, st) {
      _logger.severe("can't update profile", err, st);
      emit(ProfileScreenErrorState(error: err.toString()));
    }
  }

  Future<void> addFunds(int fundsToAdd) async {
    final state = this.state;
    if (state is! ProfileScreenSuccessState) {
      return;
    }

    try {
      final res = await _cqrs.run(
        AddFunds(
          fundsToAdd: fundsToAdd,
        ),
      );

      if (res.success) {
        await _fetch();
      }
    } catch (err, st) {
      _logger.severe("can't update profile", err, st);
      emit(ProfileScreenErrorState(error: err.toString()));
    }
  }
}

@freezed
class ProfileScreenState with _$ProfileScreenState {
  const factory ProfileScreenState.initial() = ProfileScreenInitialState;
  const factory ProfileScreenState.loading({
    UserInfoDTO? userInfo,
  }) = ProfileScreenLoadingState;
  const factory ProfileScreenState.success({
    required UserInfoDTO userInfo,
  }) = ProfileScreenSuccessState;
  const factory ProfileScreenState.error({
    required String error,
  }) = ProfileScreenErrorState;
}
