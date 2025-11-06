import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

mixin SafeSetStateMixin<T extends StatefulWidget> on State<T> {

  void safeSetState(VoidCallback fn) {
    if (mounted) {
      if (WidgetsBinding.instance.schedulerPhase == SchedulerPhase.persistentCallbacks) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) setState(fn);
        });
      } else {
        setState(fn);
      }
    }
  }

}