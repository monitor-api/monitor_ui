import 'package:flutter/material.dart';
import 'package:monitor_ui/constants.dart';

class Status extends StatelessWidget {
  final double itemWidth;
  final double itemPadding;

  final List<Map<String, Object>> entries;

  const Status({Key? key, required this.entries, required this.itemWidth, required this.itemPadding}) : super(key: key);

  @override Widget build(BuildContext context) => ListView.separated(
    padding: const EdgeInsets.only(top: 8, bottom: 8),
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) => Container(
        height: 50,
        decoration: BoxDecoration(
          color: entries[index]["color"] as Color,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white10),
        ),
        child: statusButton(index)),
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );

  TextButton statusButton(int index) => TextButton (
    onPressed: () {},
    style: buttonStyle(),
    child: statusPadding(index),
  );

  Padding statusPadding(int index) => Padding(padding: EdgeInsets.all(itemPadding), child: statusInfo(index));

  ButtonStyle buttonStyle() => ButtonStyle(shadowColor: MaterialStateProperty.all(Colors.transparent), overlayColor: MaterialStateProperty.all(Colors.transparent));

  Row statusInfo(int index) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      statusByParam(index, "name", itemWidth),
      statusByParam(index, "env", itemWidth),
      statusByParam(index, "env", itemWidth),
    ],
  );

  SizedBox statusByParam(int index, String param, double width) => SizedBox(
    width: width,
    child: Center(child: statusText(index, param)),
  );

  Text statusText(int index, String param) => Text(
    '${entries[index][param]}',
    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    overflow: TextOverflow.ellipsis,
  );
}
