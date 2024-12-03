import 'package:flutter_bloc/flutter_bloc.dart';

class IndexDashboardCubit extends Cubit<int> {
  IndexDashboardCubit() : super(0);

  void selecionarIndex(int index) {
    print("index atual: ${index}");
    emit(index);
  }

}