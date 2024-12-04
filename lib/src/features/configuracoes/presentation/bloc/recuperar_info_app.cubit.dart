import 'package:bloc/bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

class RecuperarInfoAppCubit extends Cubit<String> {
  RecuperarInfoAppCubit() : super('') {
    _recuperarDados();
  }

  _recuperarDados() async {
    final packageInfo = await PackageInfo.fromPlatform();
    emit('${packageInfo.version}');
  }
}
