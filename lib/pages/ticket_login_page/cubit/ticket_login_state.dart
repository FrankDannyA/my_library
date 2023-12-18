import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_login_state.freezed.dart';

@freezed
abstract class TicketLoginState with _$TicketLoginState {
  const factory TicketLoginState.initial() = TicketLoginInitial;
  const factory TicketLoginState.loading() = TicketLoginLoading;
  const factory TicketLoginState.loaded() = TicketLoginLoaded;
  const factory TicketLoginState.error() = TicketLoginError;
}
