class Metric {
  final String name;
  final double value;
  final String unit;
  final String status; // 'normal', 'high', 'low'
  final String range;
  final List<double> history;

  Metric({
    required this.name,
    required this.value,
    required this.unit,
    required this.status,
    required this.range,
    required this.history,
  });

  factory Metric.fromJson(Map<String, dynamic> j) {
    return Metric(
      name: j['name'] as String,
      value: (j['value'] as num).toDouble(),
      unit: j['unit'] as String,
      status: (j['status'] as String).toLowerCase(),
      range: j['range'] as String,
      history: (j['history'] as List).map((e) => (e as num).toDouble()).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'value': value,
    'unit': unit,
    'status': status,
    'range': range,
    'history': history,
  };
}
