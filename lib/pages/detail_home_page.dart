import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/cake.dart';

class DetailHome extends StatefulWidget {
  final Cake cake;

  const DetailHome({super.key, required this.cake});

  static const routeName = '/detail-home';

  @override
  State<DetailHome> createState() => _DetailHomeState();
}

class _DetailHomeState extends State<DetailHome> {
  Color _defaultColor = Colors.grey;
  bool _isLikeTapped = false;
  bool _isReviewTapped = false;
  bool _isShareTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Column(
          spacing: 16,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              color: Colors.white,
              padding: EdgeInsets.only(bottom: 16),
              child: Image.asset(widget.cake.image),
            ),
            Container(
              width: double.infinity,
              height: 4,
              color: Color(0xFFF4CEB7),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  spacing: 16,
                  children: [
                    Text(
                      widget.cake.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.cake.description,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -3),
                    blurRadius: 2,
                    spreadRadius: 1,
                    color: Colors.black.withValues(alpha: 0.1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isLikeTapped = !_isLikeTapped;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/icons/like_icon.svg',
                        width: 28,
                        height: 28,
                        colorFilter: ColorFilter.mode(
                          (_isLikeTapped) ? Colors.red : _defaultColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isReviewTapped = !_isReviewTapped;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/icons/review_icon.svg',
                        width: 28,
                        height: 28,
                        colorFilter: ColorFilter.mode(
                          (_isReviewTapped) ? Colors.blue : _defaultColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isShareTapped = !_isShareTapped;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/icons/share_icon.svg',
                        width: 28,
                        height: 28,
                        colorFilter: ColorFilter.mode(
                          (_isShareTapped) ? Colors.green : _defaultColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
