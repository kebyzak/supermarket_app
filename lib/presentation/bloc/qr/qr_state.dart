part of 'qr_bloc.dart';

abstract class QrState extends Equatable {
  const QrState();

  @override
  List<Object> get props => [];
}

class QrInitial extends QrState {}

class QrLoading extends QrState {}

class QrSuccess extends QrState {
  final Barcode result;

  const QrSuccess(this.result);

  @override
  List<Object> get props => [result];
}

class QrError extends QrState {
  final String error;

  const QrError(this.error);

  @override
  List<Object> get props => [error];
}
