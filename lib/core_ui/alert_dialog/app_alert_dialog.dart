import 'package:flutter/material.dart';
import 'package:flutter_demo/core/base/base_view_state.dart';
import 'package:flutter_demo/core_ui/alert_dialog/alert_dialog_data.dart';
import 'package:flutter_demo/core_ui/button/app_button.dart';
import 'package:flutter_demo/resources/app_text_style.dart';

class AppAlertDialog extends StatelessWidget {
  final AlertDialogData data;

  const AppAlertDialog({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: _alertContentView(),
    );
  }

  Widget _alertContentView() {
    return Container(
      height: 180,
      width: 300,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(data.title, style: AppTextStyle.osR18),
          SizedBox(height: 12),
          Text(data.message, style: AppTextStyle.osR14, textAlign: TextAlign.center,),
          SizedBox(height: 12),
          Row(
            children: [
              AppButton(title: data.actions?.first.title ?? "Cancel"),
            ],
          )
        ],
      ),
    );
  }
}

extension BaseViewAlert on BaseViewState {
  showSuccessAlert({required String message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AppAlertDialog(
        data: AlertDialogData.success(message),
      ),
    );
  }

  showErrorAlert({required String message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AppAlertDialog(
        data: AlertDialogData.error(message),
      ),
    );
  }

  showFailAlert({required String message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AppAlertDialog(
        data: AlertDialogData.fail(message),
      ),
    );
  }

  showAlert({
    required String title,
    required String message,
    List<AlertDialogAction>? actions,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AppAlertDialog(
        data: AlertDialogData(
          title: title,
          message: message,
          actions: actions ?? [AlertDialogAction.ok()],
        ),
      ),
    );
  }
}
