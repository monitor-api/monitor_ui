import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monitor_ui/Utils.dart';
import 'package:monitor_ui/constants.dart';

class StatusByEnvironment extends StatelessWidget {
  const StatusByEnvironment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.fromLTRB(defaultPadding, 0, 0, 0),
      shrinkWrap: true,
      crossAxisCount: 5,
      crossAxisSpacing: defaultPadding,
      childAspectRatio: MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height / 1.5),
      children: const [
        StatusItem(color: Colors.orangeAccent, title: "hello word", iconTitle: "warning", svgImg: "icons/bell-fill.svg"),
        StatusItem(color: Colors.redAccent, title: "hello word", iconTitle: "warning", svgImg: "icons/bell-fill.svg"),
        StatusItem(color: Colors.greenAccent, title: "hello word", iconTitle: "warning", svgImg: "icons/bell-fill.svg"),
        StatusItem(color: Colors.deepPurple, title: "hello word", iconTitle: "warning", svgImg: "icons/bell-fill.svg"),
        StatusItem(color: Colors.lightBlue, title: "hello word", iconTitle: "warning", svgImg: "icons/bell-fill.svg"),
      ],
    );
  }
}

class StatusItem extends StatelessWidget {
  final Color color;
  final String svgImg;
  final String iconTitle;
  final String title;
  const StatusItem({
    Key? key, required this.color, required this.svgImg, required this.iconTitle, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecorationWithBorder(color: secondaryColor, radius: 7),
      child: Row(
        children: [
          Container(
            decoration: boxDecorationWithBorder(color: color, radius: 7),
            height: MediaQuery.of(context).size.height / 1.5 ,
            width: 60,
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Center(
                  child: SvgPicture.asset(
                    svgImg,
                    color: Colors.white,
                    height: 20,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  iconTitle,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white54
              ),
            ),
          )
        ],
      ),
    );
  }
}
