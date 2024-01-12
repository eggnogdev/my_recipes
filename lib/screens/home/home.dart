import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.more_vert_rounded,
            size: 24.0,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.code_rounded,
              size: 24.0,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text(
                    'Source code',
                  ),
                  content: const Text(
                    'View the full source code on Codeberg!',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        launchUrl(
                          Uri.parse('https://codeberg.org/eggnog/my_recipies'),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      child: const Text(
                        'Go!',
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.favorite_outline,
              size: 24.0,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text(
                    'Send some love!',
                  ),
                  content: const Text(
                    'Do you like this app and would like to support development? Consider donating!',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        launchUrl(
                          Uri.parse('https://ko-fi.com/eggnogdev'),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      child: const Text(
                        'Go!',
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: ListView.builder(
          itemBuilder: (context, index) => [
            Container(
              margin: const EdgeInsets.only(
                top: 32.0,
                bottom: 20.0,
              ),
              child: Text(
                'MYRecipies',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ][index],
          itemCount: 2,
        ),
      ),
    );
  }
}
