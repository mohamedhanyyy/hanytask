import 'package:flutter/material.dart';

class OverlappingAvatars extends StatelessWidget {
  final int extraCount;

  const OverlappingAvatars({super.key, required this.extraCount});

  @override
  Widget build(BuildContext context) {
    final avatarUrls = [
      'assets/images/man.png',
      'assets/images/man2.png',
      if (extraCount != 1) 'assets/images/man.png',
    ];
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Stack(
                children: [
                  for (int i = 0; i < avatarUrls.length; i++)
                    Positioned(
                      left: i * 14,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.black,

                        child: CircleAvatar(
                          radius: 13,

                          backgroundImage: AssetImage(avatarUrls[i]),
                        ),
                      ),
                    ),

                  if (extraCount != 1)
                    Positioned(
                      left: 40,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.black,

                        child: CircleAvatar(
                          radius: 13.5,

                          backgroundColor: Color(0xff262626),
                          child: Text(
                            '+6',
                            style: TextStyle(
                              color: Color(0xffFFC268),
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Flexible(
              child: Text(
                '4 unfinished tasks',
                style: TextStyle(color: Color(0xff999999), fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
