import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hanytask/tabbar.dart';

import 'grid_view_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        bool isMobile = constraints.maxWidth < 750;

        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Padding(
              padding: EdgeInsets.only(left: isMobile ? 0 : 67),
              child: Row(
                children: [
                  if (isMobile)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SvgPicture.asset('assets/icons/menu.svg'),
                    ),
                  Image.asset('assets/images/logo.png'),
                ],
              ),
            ),
            actions: [
              if (!isMobile) CustomTabBarExample(),
              if (!isMobile)
                VerticalDivider(
                  color: Colors.grey,
                  width: 1,
                  indent: 15,
                  endIndent: 15,
                ),
              if (!isMobile) SizedBox(width: 24),
              SvgPicture.asset('assets/icons/settings.svg'),
              SizedBox(width: 24),
              SvgPicture.asset('assets/icons/notif.svg'),
              SizedBox(width: 24),
              VerticalDivider(
                color: Colors.grey,
                width: 1,
                indent: 15,
                endIndent: 15,
              ),
              SizedBox(width: 24),
              Image.asset('assets/images/man.png'),
              if (!isMobile)
                Padding(
                  padding: EdgeInsets.only(left: 12, right: 5),
                  child: Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              if (!isMobile)
                Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white),

              if (!isMobile) SizedBox(width: 80) else SizedBox(width: 24),
            ],
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              // Check if width is considered "mobile"
              bool isMobile = constraints.maxWidth < 750;

              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 16 : 80,
                  vertical: 36.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Items',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isMobile ? 24 : 32,
                          ),
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Color(0xff171717),
                          child: SvgPicture.asset('assets/icons/filter.svg'),
                        ),
                        if (!isMobile) SizedBox(width: 28),
                        if (!isMobile)
                          ElevatedButton.icon(
                            onPressed: () {},
                            label: Text(
                              "Add a New Item",
                              style: TextStyle(color: Colors.black),
                            ),
                            icon: Icon(Icons.add, color: Colors.black),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffFFC268),
                              fixedSize: Size(isMobile ? 140 : 177, 48),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Flexible(
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: 7,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isMobile ? 1 : 5,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 20,
                          mainAxisExtent: isMobile ? 330.h : 390.h,
                        ),
                        itemBuilder: (context, index) {
                          return GridViewItem(index: index);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
