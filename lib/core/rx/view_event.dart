import 'package:rxdart/rxdart.dart';

class ViewEvent {
  final _onStart = PublishSubject<void>();
  final _onResume = PublishSubject<void>();
  final _onPause = PublishSubject<void>();
  final _onDestroy = PublishSubject<void>();

  Stream<void> get onStart => _onStart;
  Stream<void> get onResume => _onResume;
  Stream<void> get onPause => _onPause;
  Stream<void> get onDestroy => _onDestroy;

  void emitOnStart() {
    if (!_onStart.isClosed) {
      _onStart.add(null);
    }
  }

  void emitOnResume() {
    if (!_onResume.isClosed) {
      _onResume.add(null);
    }
  }

  void emitOnPause() {
    if (!_onPause.isClosed) {
      _onPause.add(null);
    }
  }

  void emitOnDestroy() {
    if (!_onDestroy.isClosed) {
      _onDestroy.add(null);
    }
  }

  void dispose() {
    _onStart.close();
    _onResume.close();
    _onPause.close();
    _onDestroy.close();
  }
}


// CompactMap => mapNotNull
// Filter => where
// CatchAndReturn => onErrorReturn