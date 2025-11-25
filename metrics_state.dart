import '../data/metric_model.dart';

abstract class MetricsState {}

class MetricsInitial extends MetricsState {}

class MetricsLoading extends MetricsState {}

class MetricsLoaded extends MetricsState {
  final List<Metric> metrics;
  final String username;
  final String lastUpdated;

  MetricsLoaded({
    required this.metrics,
    required this.username,
    required this.lastUpdated,
  });
}

class MetricsError extends MetricsState {
  final String message;
  MetricsError(this.message);
}
