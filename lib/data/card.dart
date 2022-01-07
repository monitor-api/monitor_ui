import 'package:monitor_ui/data/enums/status.dart';

class Card {
  final String name;
  final Status status;
  final String environment;
  final String gitLink;

  Card({
    required this.name,
    required this.status,
    required this.environment,
    required this.gitLink
  });
}