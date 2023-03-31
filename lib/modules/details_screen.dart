import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_games/models/giveaways_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailsScreen extends StatefulWidget {
  final Giveaways giveaway;
  const DetailsScreen({super.key, required this.giveaway});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.giveaway.title}')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: '${widget.giveaway.image}',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${widget.giveaway.description}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 204, 204, 204),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Text(
                      'Platforms : ${widget.giveaway.platforms}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 204, 204, 204),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: Text(
                      'instructions : \n \n   ${widget.giveaway.instructions}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 204, 204, 204),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  launchUrlString('${widget.giveaway.openGiveawayUrl}');
                },
                child: const Text('Go to giveaway'),
              ),
              TextButton(
                onPressed: () {
                  copyToClipboard('${widget.giveaway.openGiveawayUrl}');
                },
                child: const Text('Copy Link'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text)).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Copied!')));
    });
  }
}
