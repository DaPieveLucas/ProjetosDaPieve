import 'package:flutter/material.dart';
import 'package:pay_flow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:pay_flow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/bottom_seet/bottom_sheet_widget.dart';
import 'package:pay_flow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarCode) {
        Navigator.pushReplacementNamed(context, "/insert_boleto");
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Stack(
          children: <Widget>[
            ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.showCamera) {
                  return Container(
                    child: controller.cameraController!.buildPreview(),
                  );
                } else {
                  return Container();
                }
              },
            ),
            RotatedBox(
              quarterTurns: 1,
              child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    backgroundColor: Colors.black,
                    title: Text(
                      'Escaneie o código de barras do boleto',
                      style: TextStyles.buttonBackground,
                    ),
                    centerTitle: true,
                    leading: BackButton(
                      color: AppColors.background,
                    ),
                  ),
                  body: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  bottomNavigationBar: SetLabelButtons(
                    primaryLabel: 'Inserir o código do boleto',
                    primaryOnPressed: () {
                      Navigator.pushReplacementNamed(context, "/insert_boleto");
                    },
                    secondaryLabel: 'Adicionar da galeria',
                    secondaryOnPressed: () {},
                  )),
            ),
            ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.hasError) {
                  return BottomSheetWidget(
                    title: 'Não foi possível identificar um código de barras.',
                    subTitle:
                        'Tente escanear novamente ou digite o código do seu boleto',
                    primaryLabel: 'Escanear novamente',
                    primaryOnPressed: () {
                      controller.scanWithCamera();
                    },
                    secondaryLabel: 'Digitar código',
                    secondaryOnPressed: () {
                      Navigator.pushReplacementNamed(context, "/insert_boleto");
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ));
  }
}
