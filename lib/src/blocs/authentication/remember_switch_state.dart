// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'remember_switch_cubit.dart';

@immutable
abstract class RememberSwitchState {}

class RememberSwitchInitial extends RememberSwitchState {}

class SwitchChanged extends RememberSwitchState {
  final bool value;
  SwitchChanged({
    required this.value,
  });
}
