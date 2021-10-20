import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Files
import '../styles/style.dart';
import 'my_container.dart';

class GroupAction {
  final String label;
  final IconData icon;
  final Function onTap;

  GroupAction({
    this.label,
    this.icon,
    this.onTap,
  });
}

class _GroupActionTile extends StatelessWidget {
  final GroupAction action;
  final int index;
  final int totalLength;

  _GroupActionTile({
    @required this.action,
    @required this.index,
    @required this.totalLength,
  });

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      boxDecoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: (index == 0) ? Radius.circular(8) : Radius.zero,
          bottom: (index == totalLength - 1) ? Radius.circular(8) : Radius.zero,
        ),
        color: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.tertiarySystemBackground,
          context,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            action.label,
            style: TextStyle(
                color: c.CupertinoDynamicColor.resolve(
              c.CupertinoColors.label,
              context,
            )),
          ),
          Icon(
            action.icon,
            color: c.CupertinoDynamicColor.resolve(
              c.CupertinoColors.tertiaryLabel,
              context,
            ),
          ),
        ],
      ),
      onTap: action.onTap,
    );
    ;
  }
}

class GroupActionContainer extends StatelessWidget {
  final String header;
  final List<GroupAction> actionList;

  GroupActionContainer({
    this.header,
    @required this.actionList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (header != null)
          Container(
            padding: EdgeInsets.fromLTRB(29, 17, 0, 8),
            child: Text(
              header.toUpperCase(),
              style: Style.footerNoteSecondary(context),
            ),
          ),
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _GroupActionTile(
                action: actionList[index],
                index: index,
                totalLength: actionList.length,
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.fromLTRB(32, 0, 16, 0),
                child: Divider(
                  height: 0,
                  thickness: 1,
                  color: c.CupertinoDynamicColor.resolve(
                    c.CupertinoColors.separator,
                    context,
                  ),
                ),
              );
            },
            itemCount: actionList.length),
      ],
    );
  }
}
