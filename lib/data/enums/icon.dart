enum IconMetric {
  diskSpace,
  mail,
  mongo,
  ping,
}

extension IconWithUrl on IconMetric {
  String get url {
    switch (this) {
      case IconMetric.diskSpace: return "https://cdn-icons-png.flaticon.com/512/2291/2291956.png";
      case IconMetric.mail: return "https://cdn-icons-png.flaticon.com/512/3161/3161085.png";
      case IconMetric.mongo: return "https://cdn-icons-png.flaticon.com/512/1664/1664316.png";
      case IconMetric.ping: return "https://cdn-icons-png.flaticon.com/512/4403/4403165.png";
    }
  }
}