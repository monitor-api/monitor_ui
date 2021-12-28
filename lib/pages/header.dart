import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monitor_ui/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: defaultPadding),
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: defaultPadding / 2,
          ),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.white10),
          ),
          child: Text(
            "APIs Monitor",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),

        const Spacer(flex: 2),
        const Expanded(
            child: SearchField()
        ),
        const SettingArea()
      ],
    );
  }
}

class SettingArea extends StatelessWidget {
  const SettingArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: defaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "icons/setting.svg",
            height: 20,
            color: Colors.white54,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: Text('Setting'),
          ),
          const Icon(Icons.keyboard_arrow_down),

        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            hintText: "Search",
            fillColor: secondaryColor,
            filled:true,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            suffixIcon: InkWell(
              onTap: () { },
              child: Container(
                padding: const EdgeInsets.all(defaultPadding * 0.75),
                margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: SvgPicture.asset("icons/search.svg"),
              ),
            )
        )
    );
  }
}
