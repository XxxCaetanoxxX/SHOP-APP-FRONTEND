import 'package:bloc/bloc.dart';

class DarkModeSwitchCubit extends Cubit<bool> {
  DarkModeSwitchCubit() : super(false);

  mudarSwitch(bool valor) => emit(valor);
}
