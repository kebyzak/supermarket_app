// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:supermarket_app/generated/l10n.dart';
import 'package:supermarket_app/presentation/widgets/app_button.dart';
import 'package:supermarket_app/presentation/bloc/qr/qr_bloc.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QrBloc(),
      child: const QrScreenBody(),
    );
  }
}

class QrScreenBody extends StatefulWidget {
  const QrScreenBody({super.key});

  @override
  _QrScreenBodyState createState() => _QrScreenBodyState();
}

class _QrScreenBodyState extends State<QrScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).qrScanner),
      ),
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(flex: 1, child: _buildQrInfo(context)),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return BlocBuilder<QrBloc, QrState>(
      builder: (context, state) {
        if (state is QrInitial) {
          return _buildQrScanner(context);
        } else if (state is QrSuccess) {
          return _buildQrResult(context, state.result);
        }
        return Container();
      },
    );
  }

  Widget _buildQrScanner(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return QRView(
      key: GlobalKey(debugLabel: 'QR'),
      onQRViewCreated: (controller) {
        controller.scannedDataStream.listen((result) {
          BlocProvider.of<QrBloc>(context).add(QrScanned(result));
        });
      },
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) =>
          _onPermissionSet(context, ctrl, p, BlocProvider.of<QrBloc>(context)),
    );
  }

  Widget _buildQrInfo(BuildContext context) {
    return BlocBuilder<QrBloc, QrState>(
      builder: (context, state) {
        if (state is QrSuccess) {
          return Text('Data: ${state.result.code}');
        }
        return Text(S.of(context).scanACode);
      },
    );
  }

  void _onPermissionSet(
      BuildContext context, QRViewController ctrl, bool p, QrBloc bloc) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).noPermission),
        ),
      );
    }
  }

  Widget _buildQrResult(BuildContext context, Barcode result) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Data: ${result.code}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          AppButton(
            text: S.of(context).scanAgain,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const QrScreen(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
