import 'package:rxdart/rxdart.dart';

class TextFieldController {
  final _event = PublishSubject<String?>();
  Stream<String?> get text => _event.stream.startWith(null);

  void handleOnChange(String? value) {
    _event.add(value);
  }

  void dispose() {
    _event.close();
  }
}