enum Icon {
  diskSpace,
  mail,
  mongo,
  ping,
}

extension IconWithUrl on Icon {
  String get url {
    switch (this) {
      case Icon.diskSpace: return "https://cdn-icons-png.flaticon.com/512/2291/2291956.png";
      case Icon.mail: return "https://cdn-icons-png.flaticon.com/512/3161/3161085.png";
      case Icon.mongo: return "https://cdn-icons-png.flaticon.com/512/1664/1664316.png";
      case Icon.ping: return "https://cdn-icons-png.flaticon.com/512/4403/4403165.png";
    }
  }
}