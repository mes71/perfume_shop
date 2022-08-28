import 'package:flutter/material.dart';
import 'package:perfume_shop/generated/assets.dart';

class SideMenu extends StatefulWidget {
  final int selectedMenu;
  final dynamic Function(int) onSelected;

  const SideMenu(
      {Key? key, required this.selectedMenu, required this.onSelected})
      : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final mTheme = Theme.of(context);
    final styleMenuSelected =
        mTheme.textTheme.labelLarge!.copyWith(color: mTheme.primaryColor);
    final styleMenu = mTheme.textTheme.labelMedium;

    return LayoutBuilder(builder: (context, constraint) {
      return NavigationRail(
        leading: GestureDetector(
          onTap: (){},
          child: CircleAvatar(
            backgroundImage: AssetImage(Assets.assetsMava),
            radius: 25,
          ),
        ),
        trailing: Column(
          children: [
            Icon(Icons.chevron_right),
            Icon(Icons.search),

          ],
        ),
        selectedIndex: widget.selectedMenu,
        elevation: 1,
        onDestinationSelected: widget.onSelected,
        labelType: NavigationRailLabelType.none,
        backgroundColor: Colors.white,
        destinations: <NavigationRailDestination>[
          // navigation destinations
          NavigationRailDestination(
            icon: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  'Perfume',
                  style: styleMenu,
                )),
            selectedIcon: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  'Perfume',
                  style: styleMenuSelected,
                )),
            label: Text('Perfume'),
          ),
          NavigationRailDestination(
              icon: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    'E.d.Perfume',
                    style: styleMenu,
                  )),
              selectedIcon: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    'E.d.Perfume',
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: styleMenuSelected,
                  )),
              label: Text('E.d.Perfume'),
              padding: EdgeInsets.symmetric(vertical: 12)),
          NavigationRailDestination(
              icon: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    'E.d.Toilette',
                    style: styleMenu,
                  )),
              selectedIcon: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    'E.d.Toilette',
                    style: styleMenuSelected,
                  )),
              label: Text('E.d.Toilette'),
              padding: EdgeInsets.symmetric(vertical: 12)),
          NavigationRailDestination(
              icon: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    'E.d.Cologne',
                    style: styleMenu,
                  )),
              selectedIcon: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    'E.d.Cologne',
                    style: styleMenuSelected,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  )),
              label: Text('E.d.Cologne'),
              padding: EdgeInsets.symmetric(vertical: 12)),
          NavigationRailDestination(
              icon: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    'E.d.Fraiche',
                    style: styleMenu,
                  )),
              selectedIcon: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    'E.d.Fraiche',
                    style: styleMenuSelected,
                  )),
              label: Text('E.d.Fraiche'),
              padding: EdgeInsets.symmetric(vertical: 12)),
        ],
        selectedIconTheme: IconThemeData(color: Colors.white),
        unselectedIconTheme: IconThemeData(color: Colors.black),
        selectedLabelTextStyle: TextStyle(color: Colors.white),
        groupAlignment: 1,
      );
    });
  }
}
