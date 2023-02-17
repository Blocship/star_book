import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/shared/elevated_buttons.dart';

class CustomDialogBox extends StatelessWidget {
  const CustomDialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 22),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Image(image: AssetImage('assets/icons/stop.png'), height: 50),
            const SizedBox(height: 30),
            Text(
              'You’re going to delete this note!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700, color: const Color(0xFF000000)),
            ),
            const SizedBox(height: 10),
            Text(
                'By deleting this note you won’t be able to view or edit this note',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF000000).withOpacity(0.5))),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InactiveFilledButton(
                    onTap: () => context.goNamed('JournalDetailScreen'),
                    label: 'Cancel'),
                DangerFilledButton(

                    ///TOdo: Change it to pop (mainScreen or monthScreen)
                    onTap: () => context.goNamed('DialogBox'),
                    label: 'Delete Note'),
              ],
            ),
            // const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
