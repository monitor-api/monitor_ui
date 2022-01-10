class Health {
  final String name;
  final String status;
  final String environment;
  final String gitLink;
  final Map<String, String> components;

  Health({
    required this.name,
    required this.status,
    required this.environment,
    required this.gitLink,
    required this.components,
  });
}