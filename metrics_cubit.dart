import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/local_storage.dart';
import '../data/metric_model.dart';

import 'metrics_state.dart';

class MetricsCubit extends Cubit<MetricsState> {
  final LocalStorage storage;

  MetricsCubit(this.storage) : super(MetricsInitial());

  Future<void> loadMetrics() async {
    emit(MetricsLoading());

    try {
      final savedJson = await storage.loadData();

      String jsonString;

      if (savedJson != null) {
        jsonString = savedJson;
      } else {
        jsonString = await rootBundle.loadString("lib/data/sample_data.json");
        await storage.saveData(jsonString);
      }

      final decoded = jsonDecode(jsonString);
      final metrics = (decoded['metrics'] as List)
          .map((e) => Metric.fromJson(e))
          .toList();

      emit(MetricsLoaded(
        metrics: metrics,
        username: decoded['user'],
        lastUpdated: decoded['last_updated'],
      ));
    } catch (e) {
      emit(MetricsError(e.toString()));
    }
  }
}
