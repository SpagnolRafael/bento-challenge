import 'package:bento_challenge/shareds/app_button.dart';
import 'package:bento_challenge/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppImageViewer extends StatefulWidget {
  const AppImageViewer(
      {super.key, this.imageUrl, this.imageBytes, this.urlsImages});
  final List<String>? urlsImages;
  final String? imageUrl;
  final List<int>? imageBytes;

  void push(BuildContext context) async {
    Navigator.push<PageRouteBuilder>(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
          opacity: animation,
          child: AppImageViewer(imageUrl: imageUrl, imageBytes: imageBytes),
        ),
      ),
    );
  }

  @override
  State<AppImageViewer> createState() => _AppImageViewerState();
}

class _AppImageViewerState extends State<AppImageViewer> {
  Widget? image;
  @override
  void initState() {
    super.initState();
    image = Image.asset(widget.imageUrl!);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.top]);
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey800,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
                child: AppButton.action(
              color: AppColors.blue800,
              icon: const Icon(
                Icons.close,
                color: AppColors.primary,
                size: 14,
              ),
              onTap: () => Navigator.pop(context),
            )),
          ),
        ],
      ),
      body: InteractiveViewer(
        maxScale: 10,
        child: Center(
            child: image ??
                Container(
                    width: double.infinity,
                    color: AppColors.grey800,
                    height: 200,
                    child: const Icon(Icons.error))),
      ),
    );
  }
}
