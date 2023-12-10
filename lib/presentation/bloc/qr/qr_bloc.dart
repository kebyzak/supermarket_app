// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'qr_state.dart';
part 'qr_event.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  QrBloc() : super(QrInitial()) {
    on<QrScanned>((event, state) async {
      emit(QrLoading());
      try {
        emit(QrSuccess(event.result));
      } catch (e) {
        emit(QrError(e.toString()));
      }
    });
  }
}
