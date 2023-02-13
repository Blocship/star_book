import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const CustomTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1F1F1F),
              ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w400),
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: Color(0xFF1F1F1F),
        ),
        onTap: onTap,
      ),
    );
  }
}
