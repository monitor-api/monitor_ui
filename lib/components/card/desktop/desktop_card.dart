import 'package:monitor_ui/data/health.dart';
import 'package:monitor_ui/data/info.dart';
import 'package:monitor_ui/responsive.dart';
import 'package:universal_html/html.dart';
import 'package:flutter/material.dart';
import 'package:monitor_ui/constants.dart';

class DesktopCard extends StatefulWidget {
  final Health health;
  final Info info;

  const DesktopCard({
    Key? key,
    required this.health,
    required this.info,
  }) : super(key: key);

  @override State<DesktopCard> createState() => _DesktopCardState();
}

class _DesktopCardState extends State<DesktopCard> {
  final SizedBox heightSpacer = const SizedBox(height: 15);
  final SizedBox widthSpacer = const SizedBox(width: 15);

  late Color gitLinkColor = Colors.white;

  @override Widget build(BuildContext context) => Container(
      decoration: boxDecoration(),
      child: content()
  );

  Widget content() => SizedBox(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        primary: Colors.transparent,
      ),
      onPressed: () {  },
      child: Column(
        children: [
          topSide(),
          heightSpacer,
          const Divider(),
          heightSpacer,
          bottomSide(),
          heightSpacer,
        ],
      ),
    ),
  );

  Widget bottomSide() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: widget.health.components.entries.map((e) => component(e.key, e.value)).toList(),
  );

  Widget component(
    String key,
    String value
  ) => Column(
    children: [
      Text(key, style: const TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)),
      heightSpacer,
      Container(
        width: 70,
        height: 70,
        padding: const EdgeInsets.all(8),
        decoration: boxDecoration(defaultColor: statusColor(value)),
        child: Image.network(url(key)),
      ),
    ],
  );

  Container topSide() => Container(
      padding: const EdgeInsets.only(top: 20, left: 20),
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              lineCreator("Name", widget.info.name ?? widget.health.name),
              heightSpacer,
              lineCreator("Version", widget.info.version ?? ""),
              heightSpacer,
              lineCreator("Group", widget.info.group ?? ""),
              heightSpacer,
              status(),
              heightSpacer,
              lineCreator("Environment", widget.health.environment),
              heightSpacer,
              gitLink(),
              heightSpacer,
              lineCreator("Branch", widget.info.branch ?? ""),
              heightSpacer,
              lineCreator("Commit", widget.info.commit ?? ""),
            ],
          ),
        ],
      )
  );

  BoxDecoration boxDecoration({ Color defaultColor = secondaryColor }) => BoxDecoration(
    color: defaultColor,
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    border: Border.all(color: Colors.transparent),
  );

  Row gitLink() => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("Git", style: TextStyle(fontWeight: FontWeight.bold)),
      widthSpacer,
      InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        onHover: (isHovered) { setState(() => isHovered ? gitLinkColor = primaryColor : gitLinkColor = Colors.white); },
        onTap: () => window.open(widget.health.gitLink, 'new tab'),
        child: SizedBox(
          width: linkWidth(),
          child: Text(
            widget.health.gitLink,
            textAlign: TextAlign.left,
            style: TextStyle(color: gitLinkColor),
            overflow: TextOverflow.ellipsis,

          ),
        ),
      ),
    ],
  );

  double linkWidth() {
    if (widget.health.gitLink.length > (Responsive.width(context) / 5.1)) {
      return Responsive.width(context) / 5.1;
    }
    return widget.health.gitLink.length * 8.5;
  }

  Widget lineCreator(
    String label,
    String value
  ) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      widthSpacer,
      Text(value, textAlign: TextAlign.left),
    ],
  );

  Row environment() => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("Environment", style: TextStyle(fontWeight: FontWeight.bold)),
      widthSpacer,
      Text(widget.health.environment, textAlign: TextAlign.left),
    ],
  );

  Row status() => Row(
    children: [
      const Text("Status", style: TextStyle(fontWeight: FontWeight.bold)),
      widthSpacer,
      Container(
        height: 25,
        width: 70,
        decoration: BoxDecoration(
          color: statusColor(widget.health.status),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white10),
        ),
        child: Center(child: Text(widget.health.status.toUpperCase())),
      ),
    ],
  );

  Color statusColor(String? status) => status != null ? status == "UP" ? success : danger : Colors.transparent;

  String url(String? name) {
    switch (name) {
      case "diskSpace": return "https://cdn-icons-png.flaticon.com/512/2291/2291956.png";
      case "mail": return "https://cdn-icons-png.flaticon.com/512/3161/3161085.png";
      case "mongo": return "https://cdn-icons-png.flaticon.com/512/1664/1664316.png";
      case "ping": return "https://cdn-icons-png.flaticon.com/512/4403/4403165.png";
    }
    return "https://cdn-icons-png.flaticon.com/512/551/551227.png";
  }
}
