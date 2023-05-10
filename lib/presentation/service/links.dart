import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  Future<void> developer() async {
    final Uri url = Uri.parse('https://blocship.io/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> privacyPolicy() async {
    final Uri url = Uri.parse(
        'https://github.com/hashirshoaeb/star_book/blob/dev/PRIVACY%26POLICY.md');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> starBookCommunity() async {
    /// TODO: Add Url
    final Uri url = Uri.parse('');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
