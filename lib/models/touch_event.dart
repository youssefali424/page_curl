import 'dart:ui';

enum TouchEventType { END, START, MOVE }

class TouchEvent {
  TouchEventType _eventType;
  Offset _offset;

  TouchEvent(this._eventType, this._offset);

  TouchEventType get event => _eventType;

  double get dx => _offset.dx;
  double get dy => _offset.dy;
}
