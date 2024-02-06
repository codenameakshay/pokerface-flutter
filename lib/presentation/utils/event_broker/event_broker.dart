part 'event_broker_impl.dart';

typedef EventListenersFilter = bool Function(EventListener listener);

/// [EventX] represents an event that can be emitted via [EventBrokerX] to
/// its listeners.
class EventX<T> {
  const EventX({
    this.extraData,
  });

  final T? extraData;
}

abstract class EventBrokerX {
  static EventBrokerX shared = _EventBrokerImplX();

  /// Register any object that implements [EventListener].
  void addListener(EventListener listener);

  /// [filter] can be used to select specific listeners based on some condition.
  /// If [filter] for a given listener returns `true`, that listener will be selected
  /// for this event's target.
  void emitEvent(
    EventX event, {
    EventListenersFilter? filter,
  });
}

abstract class EventListener {
  String get identifier => 'event_listener';

  void onEvent(EventX event);
}

/// Optimization mixin that informs [EventBrokerX] to not eliminate listeners
/// that are marked with it.
///
/// This is useful to free up any listeners that are
/// only listening to a one time event and then don't have to be listener anymore.
/// Otherwise, keeping a reference to this listener won't let it to be deallocated
/// from memory.
mixin KeepAliveEventListenerMixin {}
