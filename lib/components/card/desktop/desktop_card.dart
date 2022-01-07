import 'package:universal_html/html.dart';
import 'package:flutter/material.dart';
import 'package:monitor_ui/constants.dart';
import 'package:monitor_ui/data/enums/status.dart';

class DesktopCard extends StatefulWidget {
  final String name;
  final Status status;
  final String environment;
  final String gitLink;

  const DesktopCard({
    Key? key,
    required this.name,
    required this.status,
    required this.environment,
    required this.gitLink
  }) : super(key: key);

  @override State<DesktopCard> createState() => _DesktopCardState();
}

class _DesktopCardState extends State<DesktopCard> {
  final SizedBox heightSpacer = const SizedBox(height: 20);
  final SizedBox widthSpacer = const SizedBox(width: 20);

  late Color gitLinkColor = Colors.white;

  @override Widget build(BuildContext context) => Container(
      width: double.infinity,
      height: 200,
      decoration: boxDecoration(),
      child: content()
  );

  ElevatedButton content() => ElevatedButton(
    style: ButtonStyle(
      shadowColor: MaterialStateProperty.all(Colors.transparent),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
    ),
    onPressed: () {  },
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
        ),
      ],
    ),
  );

  BoxDecoration boxDecoration() => BoxDecoration(
    color: secondaryColor,
    borderRadius: const BorderRadius.all(Radius.circular(15)),
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
        child: Text(
          widget.gitLink,
          textAlign: TextAlign.left,
          style: TextStyle(color: gitLinkColor),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );

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
          color: widget.status == Status.up ? success : danger,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white10),
        ),
        child: Center(
          child: Text(widget.status.name.toUpperCase()),
        ),
      ),
    ],
  );
}
