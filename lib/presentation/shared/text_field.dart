import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final String hintText;

  const PrimaryTextField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.85,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w400),
          isDense: true,
          contentPadding: const EdgeInsets.all(12.0),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}

class JournalTextField extends StatelessWidget {
  final String hintText;
  final String header;
  // final _fieldKey = GlobalKey();
  const JournalTextField({
    Key? key,
    required this.hintText,
    required this.header,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final textHeight = _fieldKey.currentContext!.findRenderObject() as  RenderBox;
    return Container(
      width: 306,
      // height: textHeight.size.height,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14),
          Text(header),
          const SizedBox(height: 14),
          SizedBox(
            width: 306,
            child: TextFormField(
              // key: _fieldKey,
              minLines: 1,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                isDense: true,
                hintText: hintText,
                contentPadding: const EdgeInsets.all(0),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectableTile extends StatelessWidget {
  final String title;
  final String? select;
  final VoidCallback onTap;

  const SelectableTile({
    Key? key,
    required this.title,
    this.select,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.85,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey),
        ),
        child: ListTile(
          onTap: onTap,
          dense: true,
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          trailing: SizedBox(
            width: screenWidth * 0.19,
            child: Row(
              children: [
                Text(
                  select ?? 'Select',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.keyboard_arrow_right,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
