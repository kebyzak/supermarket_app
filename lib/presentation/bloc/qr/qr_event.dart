part of 'qr_bloc.dart';

abstract class QrEvent extends Equatable {
  const QrEvent();

  @override
  List<Object> get props => [];
}

class QrScanned extends QrEvent {
  final Barcode result;

  const QrScanned(this.result);

  @override
  List<Object> get props => [result];
}
