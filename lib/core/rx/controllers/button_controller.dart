import 'package:rxdart/rxdart.dart';

class ButtonController {
  final _event = PublishSubject<void>();
  Stream<void> get onTap => _event.stream;

  void handleOnTap() {
    _event.add(null);
  }

  void dispose() {
    _event.close();
  }
}