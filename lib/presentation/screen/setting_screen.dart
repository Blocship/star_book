import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Settings',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight * 0.04),
          CustomTile(
              title: 'Starbook Community',
              subtitle: 'Know who’s using starbook app',
              onTap: () {}),
          CustomTile(
              title: 'About Developer',
              subtitle: 'Person info who developed this amazing app',
              onTap: () {}),
          CustomTile(
              title: 'Privacy & Terms',
              subtitle: 'All your data and personal info terms',
              onTap: () {}),
          CustomTile(
              title: 'License Agreement',
              subtitle: 'Your licensed agreement with starbook',
              onTap: () {}),
          SizedBox(height: screenHeight * 0.34),
          Text(
            'App version 2.0',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          const BlocShipTile(),
          const SizedBox(height: 10),
          const UxerShipTile(),
        ],
      ),
    );
  }
}

class BlocShipTile extends StatelessWidget {
  const BlocShipTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('assets/icons/blocship_logo.png'),
          width: 16,
        ),
        const SizedBox(width: 6),
        RichText(
          textScaleFactor: MediaQuery.of(context).textScaleFactor,
          text: TextSpan(
            text: 'Powered by ',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w400),
            children: [
              TextSpan(
                text: 'Blocship',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF1F1F1F),
                      decoration: TextDecoration.underline,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class UxerShipTile extends StatelessWidget {
  const UxerShipTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('assets/icons/ux_logo.png'),
          width: 22,
        ),
        const SizedBox(width: 6),
        RichText(
          textScaleFactor: MediaQuery.of(context).textScaleFactor,
          text: TextSpan(
            text: 'Design & Crafted with ',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w400),
            children: [
              const WidgetSpan(
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 17,
                ),
              ),
              TextSpan(
                  text: ' by ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w400)),
              TextSpan(
                text: 'Uxership',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF1F1F1F),
                      decoration: TextDecoration.underline,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

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
              fontWeight: FontWeight.w600, color: const Color(0xFF1F1F1F)),
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
        onTap: () => onTap,
      ),
    );
  }
}
