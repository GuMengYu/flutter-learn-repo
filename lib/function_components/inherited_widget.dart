import 'package:flutter/material.dart';

// class InheritedProvider<T> extends InheritedWidget {
//   InheritedProvider({
//     required this.data,
//     required Widget child,
//   }): super(child: child)

//   final T data;

//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//     // TODO: implement updateShouldNotify
//     true;
//   }
// }

class ChangeNotifer implements Listenable {
  List listeners = [];
  @override
  void addListener(VoidCallback listener) {
    listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    listeners.remove(listener);
  }

  void notifyListeners() {
    //通知所有监听器，触发监听器回调
    listeners.forEach((item) => item());
  }
}
