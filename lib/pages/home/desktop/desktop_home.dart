import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:monitor_ui/components/card/desktop/desktop_card.dart';
import 'package:monitor_ui/constants.dart';
import 'package:monitor_ui/data/health.dart';
import 'package:monitor_ui/data/info.dart';
import 'package:monitor_ui/header/desktop/desktop_header.dart';
import 'package:monitor_ui/responsive.dart';
import 'package:http/http.dart' as http;

class DesktopHome extends StatefulWidget {

  const DesktopHome({Key? key}) : super(key: key);

  @override State<DesktopHome> createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
  final Duration periodicityOfCall = const Duration(seconds: 3);

  late final List<Map<String, dynamic>> envByValue;
  late final List<Timer> timers;

  late Map<String, Health> health = {};
  late Map<String, Info> info = {};
  late Map<String, bool> callByApiName = {};

  bool isOnTop = false;
  bool upTopText = false;

  @override void initState() {
    super.initState();
    List<dynamic> envApis = jsonDecode(const String.fromEnvironment("API", defaultValue: "[]"));
    envByValue = envApis.map((e) => e as Map<String, dynamic>).toList();
    envByValue.forEach(healthCaller);
    envByValue.forEach(infoCaller);
    /* PERIODIC CALL */
    timers = envByValue.map(timerCaller).toList();
  }

  Timer timerCaller(envVar) => Timer.periodic(periodicityOfCall, (timer) async => healthCaller(envVar));

  healthCaller(Map<String, dynamic> envVar) async {
    String key = "${envVar["name"]}-${envVar["env"]}";

    if (callByApiName[key] ?? false) return;

    if (mounted) setState(() => callByApiName[key] = true);

    String body = (await http.get(Uri.parse(envVar["path"] + "/health"), headers: { "Accept": "application/json" }).timeout(const Duration(minutes: 10))).body;

    if (mounted) setState(() => callByApiName[key] = false);

    Map<String, dynamic> keyValue = jsonDecode(body) ?? {};
    Map<String, dynamic> componentKeyValue = keyValue["components"] ?? {};

    Map<String, String> statusByComponent = { for (var e in componentKeyValue.keys) e : componentKeyValue[e]["status"] } ;

    if (mounted) setState(() => health[key] = apiCreator(envVar, keyValue["status"], statusByComponent));
  }

  infoCaller(Map<String, dynamic> envVar) async {

    String body = (await http.get(Uri.parse(envVar["path"] + "/info")).timeout(const Duration(minutes: 10))).body;

    Map<String, dynamic> keyValue = jsonDecode(body) ?? {};

    Map<String, dynamic> git = keyValue["git"] ?? {};
    Map<String, dynamic> commit = git["commit"] ?? {};
    Map<String, dynamic> build = keyValue["build"] ?? {};

    String key = "${envVar["name"]}-${envVar["env"]}";

    if (mounted) setState(() => info[key] = Info(name: build["name"], branch: git["branch"], commit: commit["id"], version: build["version"], group: build["group"]));
  }

  @override void dispose() {
    super.dispose();
    cancelTimers();
  }

  void cancelTimers() { for (var element in timers) { element.cancel(); } }

  Health apiCreator(e, String status, Map<String, String> componentKeyValue) => Health(
    name: e["name"],
    status: status,
    environment: e["env"],
    gitLink: e["gitLink"],
    components: componentKeyValue
  );

  final ScrollController _controller = ScrollController();

  void _scrollUp() {
    _controller.animateTo(
      _controller.position.minScrollExtent,
      duration: const Duration(seconds: 3),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override Widget build(BuildContext context) => Scaffold(
    floatingActionButton: floatingActionButton(),
    body: Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        height: Responsive.height(context),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: nestedScrollView(),
        ),
      ),
    ),
  );

  NestedScrollView nestedScrollView() => NestedScrollView(
    controller: _controller,
    headerSliverBuilder: (context, innerBoxIsScrolled) => [const SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: bgColor,
      title: DesktopHeader(),
      floating: true,
      expandedHeight: 100,
      toolbarHeight: 53,
      stretch: true,
    )],
    body: listView(),
  );

  Widget listView() => NotificationListener<ScrollUpdateNotification>(
    onNotification: (notification) {
      if (notification.metrics.pixels != 0) {
        if ((isOnTop == false || upTopText == false)) {
          setState(() {
            isOnTop = true;
            upTopText = true;
          });
        }
      } else if (isOnTop == true || upTopText == true) {
        setState(() {
          isOnTop = false;
          upTopText = false;
        });
      }
      return true;
    },
    child: ListView.separated(
      itemCount: 50,
      itemBuilder: (context, index) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: health.values.map((e) => sizedContent(context, cardCreator(e, info["${e.name}-${e.environment}"] ?? Info()))).toList(),
      ),
      separatorBuilder: (BuildContext context, int index) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ sizedContent(context, const Divider(height: 30)) ],
      ),
    ),
  );

  SizedBox sizedContent(BuildContext context, Widget child) {
    double width = Responsive.width(context) / 3;
    return SizedBox(
      width: width > 400 ? width : 400,
      child: child,
    );
  }

  Row floatingActionButton() => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [ actionButton(Icons.arrow_upward, _scrollUp) ],
  );

  FloatingActionButton actionButton(
    IconData icon,
    VoidCallback onPressed,
  ) => FloatingActionButton.extended(
    backgroundColor: secondaryColor,
    onPressed: isOnTop ? onPressed : null,
    label: AnimatedDefaultTextStyle(
      child: const Text('TOP  '),
      style : upTopText ? const TextStyle(fontSize: 17, fontWeight: FontWeight.w600) : const TextStyle(fontSize: 0.1),
      duration: const Duration(milliseconds: 200),
    ),
    icon: Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 3),
      child: Icon(icon),
    ),
  );

  DesktopCard cardCreator(Health health, Info info) => DesktopCard(health: health, info: info);
}
