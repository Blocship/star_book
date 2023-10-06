import 'package:url_launcher/url_launcher.dart';

// TODO: Make the methods static,
// so that we don't have to create an instance of this class
class UrlLauncher {
  Future<void> developer() async {
    final Uri url = Uri.parse('https://blocship.io/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> privacyPolicy() async {
    final Uri url = Uri.parse(
        'https://qurantalk.notion.site/Privacy-Policy-for-Starbook-Mobile-App-a8fb153c39dd45dfa5b2cb9a945e3c84?pvs=4');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> starBookCommunity() async {
    final Uri url = Uri.parse('https://discord.gg/7EJv8VUGrd');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> support() async {
    final Uri url = Uri(
      scheme: 'mailto',
      path: 'hashirshoaeb@gmail.com',
      queryParameters: {
        'subject': Uri.encodeComponent('Starbook Support'),
        'body': '',
      },
    );
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
