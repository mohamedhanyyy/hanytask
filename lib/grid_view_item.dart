import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'avatars.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key,required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 243,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xff262626),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 130,
                width: double.infinity,

                child: Image.asset(
                    index%2==0?'assets/images/sea.png':
                    'assets/images/img1.png', fit: BoxFit.fill),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(0xff000000).withValues(alpha: 0.6),
                  child: Icon(Icons.more_horiz, color: Colors.white, size: 18),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            width: 156.w,
            height: 28,
            decoration: BoxDecoration(
              color: Color(0xffC25F30).withValues(alpha: 0.1),
              border: Border.all(color: Color(0xffC25F30), width: 0.5),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Pending Approval",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 19, bottom: 6, left: 15, right: 15),
            child: Text(
              index==1?'Long item title highlighti...':'Item title',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/date.svg'),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    '5 Nights (Jan 16 - Jan 20, 2024)',
                    style: TextStyle(color: Color(0xff999999), fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Divider(
            indent: 15,
            endIndent: 15,
            thickness: 0.5,
            color: Colors.white.withValues(alpha: .5),
          ),
          OverlappingAvatars(extraCount: index),
        ],
      ),
    );
  }
}
