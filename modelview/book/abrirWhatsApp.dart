import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

launchWhatsAppUri(numero) async {
  final link = WhatsAppUnilink(
    phoneNumber: '${numero}',
    text: "Hey! I'm interested in your book!",
  );

  await canLaunchUrl(link.asUri());
}
