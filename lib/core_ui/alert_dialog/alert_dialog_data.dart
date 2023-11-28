class AlertDialogData {
  String title;
  String message;
  List<AlertDialogAction>? actions;

  AlertDialogData({
    required this.title,
    required this.message,
    List<AlertDialogAction>? actions,
  }) : actions = actions ?? [AlertDialogAction.cancel()];

  AlertDialogData.success(String value)
      : title = "Success",
        message = value,
        actions = [AlertDialogAction.ok()];

  AlertDialogData.error(String value)
      : title = "Error",
        message = value,
        actions = [AlertDialogAction.cancel()];

  AlertDialogData.fail(String value)
      : title = "Fail",
        message = value,
        actions = [AlertDialogAction.tryAgain()];
}

class AlertDialogAction {
  String title;
  Function(void)? action;

  AlertDialogAction({
    required this.title,
    this.action,
  });

  AlertDialogAction.ok() : title = "OK";

  AlertDialogAction.cancel() : title = "Cancel";

  AlertDialogAction.tryAgain() : title = "Try Again";
}
