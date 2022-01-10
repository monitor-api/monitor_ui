import 'package:monitor_ui/responsive.dart';
import 'package:universal_html/html.dart';
import 'package:flutter/material.dart';
import 'package:monitor_ui/constants.dart';

class DesktopCard extends StatefulWidget {
  final String name;
  final String status;
  final String environment;
  final String gitLink;
  final Map<String, String> components;

  const DesktopCard({
    Key? key,
    required this.name,
    required this.status,
    required this.environment,
    required this.gitLink,
    required this.components
  }) : super(key: key);

  @override State<DesktopCard> createState() => _DesktopCardState();
}

class _DesktopCardState extends State<DesktopCard> {
  final SizedBox heightSpacer = const SizedBox(height: 20);
  final SizedBox widthSpacer = const SizedBox(width: 20);

  late Color gitLinkColor = Colors.white;

  @override Widget build(BuildContext context) => Container(
      height: 200,
      decoration: boxDecoration(),
      child: content()
  );

  Widget content() => SizedBox(
    width: Responsive.width(context) / 2.1,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        primary: Colors.transparent,
      ),
      onPressed: () {  },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leftSide(),
          Column(
            children: [
              heightSpacer,
              Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    padding: const EdgeInsets.all(8),
                    decoration: boxDecoration(defaultColor: statusColor(widget.components.entries.toList()[0]?.value)),
                    child: Image.network(url(widget.components.entries.toList()[0]?.key)),
                  ),
                  widthSpacer,
                  Container(
                    width: 70,
                    height: 70,
                    padding: const EdgeInsets.all(8),
                    decoration: boxDecoration(defaultColor: statusColor(widget.components.entries.toList()[1]?.value)),
                    child: Image.network(url(widget.components.entries.toList()[1]?.key)),
                  )
                ],
              ),
              heightSpacer,
              Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    padding: const EdgeInsets.all(8),
                    decoration: boxDecoration(defaultColor: statusColor(widget.components.entries.toList()[2]?.value)),
                    child: Image.network(url(widget.components.entries.toList()[2]?.key)),
                  ),
                  widthSpacer,
                  Container(
                    width: 70,
                    height: 70,
                    padding: const EdgeInsets.all(8),
                    decoration: boxDecoration(defaultColor: statusColor(widget.components.entries.toList()[3]?.value)),
                    child: Image.network(url(widget.components.entries.toList()[3]?.key)),
                  )
                ],
              )
            ],
          )
        ],
      ),
    ),
  );

  Container leftSide() => Container(
      padding: const EdgeInsets.only(top: 20, left: 20),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          heightSpacer,
          status(),
          heightSpacer,
          environment(),
          heightSpacer,
          gitLink()
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
      const Text("Gitlab", style: TextStyle(fontWeight: FontWeight.bold)),
      widthSpacer,
      InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        onHover: (isHovered) { setState(() => isHovered ? gitLinkColor = primaryColor : gitLinkColor = Colors.white); },
        onTap: () => window.open(widget.gitLink, 'new tab'),
        child: SizedBox(
          width: linkWidth(),
          child: Text(
            widget.gitLink,
            textAlign: TextAlign.left,
            style: TextStyle(color: gitLinkColor),
            overflow: TextOverflow.ellipsis,

          ),
        ),
      ),
    ],
  );

  double linkWidth() {
    if (widget.gitLink.length > (Responsive.width(context) / 5.1)) {
      return Responsive.width(context) / 5.1;
    }
    return widget.gitLink.length * 8.5;
  }

  Row environment() => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("Environment", style: TextStyle(fontWeight: FontWeight.bold)),
      widthSpacer,
      Text(widget.environment, textAlign: TextAlign.left),
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
          color: statusColor(widget.status),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white10),
        ),
        child: Center(child: Text(widget.status.toUpperCase())),
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
    return "https://cdn-icons-png.flaticon.com/512/1664/1664316.png";
  }
}
