import 'package:flutter/widgets.dart';

extension SeparatedIterable on Iterable<Widget> {
  List<Widget> separatedBy(Widget separator) {
    final result = <Widget>[];
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      result.add(iterator.current);
      while (iterator.moveNext()) {
        result
          ..add(separator)
          ..add(iterator.current);
      }
    }
    return result;
  }
}
