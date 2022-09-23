import 'package:communiversity/core/my_coins/widgets/tar_heel_listtile.dart';
import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/utils/asset_path.dart';
import 'package:communiversity/widgets/custom_appbar.dart';
import 'package:communiversity/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyMesagesPage extends StatelessWidget {
  const MyMesagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dimWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customAppBar(context: context, title: 'My Messages'),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: 27.h),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: ((context, index) => MessageListTile()),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}

MessageListTile() => ListTile(
      isThreeLine: true,
      leading: Container(
        width: 53.w,
        height: 57.h,
        decoration: BoxDecoration(
          color: AppColors.cyan,
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            image: AssetImage(AssetPath.login),
            fit: BoxFit.fill,
          ),
        ),
      ),
      title: Row(
        children: <Widget>[
          Text('Frank Jordan'),
        ],
      ),
      subtitle: const Text(
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed',
          overflow: TextOverflow.ellipsis,
          maxLines: 2),
    );
