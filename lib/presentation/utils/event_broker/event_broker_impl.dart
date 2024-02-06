part of 'event_broker.dart';

class _EventBrokerImplX implements EventBrokerX {
  final List<EventListener> listeners = [];

  /// Register any object that implements [EventListener].
  @override
  void addListener(EventListener listener) {
    listeners.add(listener);
  }

  /// [filter] can be used to select specific listeners based on some condition.
  /// If [filter] for a given listener returns `true`, that listener will be selected
  /// for this event's target.
  @override
  void emitEvent(
    EventX event, {
    EventListenersFilter? filter,
  }) {
    late final List<EventListener> specificListeners;

    if (filter != null) {
      specificListeners = listeners.where(filter).toList(growable: false);
    } else {
      specificListeners = listeners;
    }

    for (final listener in specificListeners) {
      listener.onEvent(event);
    }

    _removeOneTimeListeners();
  }

  /// Optimization function that eliminates any listeners that are ephemeral
  /// A.K.A one-time listeners that haven't added [KeepAliveEventListenerMixin]
  /// mixin with themselves.
  void _removeOneTimeListeners() {
    listeners.removeWhere(
      (listener) {
        late final bool isRemovable;

        if (listener is KeepAliveEventListenerMixin) {
          isRemovable = false;
        } else {
          isRemovable = true;
        }

        return isRemovable;
      },
    );
  }
}
