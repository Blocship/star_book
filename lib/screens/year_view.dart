import 'package:flutter/cupertino.dart';
import 'package:star_book/utils/date.dart';
import 'package:star_book/utils/screen_sizes.dart';
import 'package:star_book/widgets/year.dart';

class YearView extends StatefulWidget {
  YearView({
    @required this.context,
    @required this.initialDate,
    @required this.firstDate,
    @required this.lastDate,
  });
  final BuildContext context;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  @override
  _YearViewState createState() => _YearViewState();
}

class _YearViewState extends State<YearView> {
  Year _getYearView(int year) {
    return Year(
      context: context,
      year: year,
      monthNames: getMonthList(),
    );
  }
  @override
  Widget build(BuildContext context) {
    final int _itemCount = widget.lastDate.year - widget.firstDate.year + 1;

    // Makes sure the right initial offset is calculated so the listview
    // jumps to the initial year.
    final double _initialOffset =
        (widget.initialDate.year - widget.firstDate.year) *
            getYearViewHeight(context);
    final ScrollController _scrollController =
    ScrollController(initialScrollOffset: _initialOffset);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoDynamicColor.resolve(
          CupertinoColors.systemBackground,
          context,
        ),
        border: null,
      ),
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 16.0),
        controller: _scrollController,
        itemCount: _itemCount,
        itemBuilder: (BuildContext context, int index) {
          final int year = index + widget.firstDate.year;
          return _getYearView(year);
        },
      ),
    );
  }
}
