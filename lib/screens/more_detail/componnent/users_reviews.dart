import 'package:flutter/material.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../constants.dart';

class UsersReviewsComments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          LocalKeys.COMMENT.tr(),
          style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColor),
        ),
        spaceH(10),
        ListView.separated(
          itemCount: 10,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              color: Theme.of(context).primaryColor,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/Profile Image.png"),
                      ),
                    ),
                    spaceW(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Ahmed Amr",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor),
                        ),
                        Text("12 Aug 2021",
                            style: Theme.of(context).textTheme.bodyText1),
                        SizedBox(
                          width: 260,
                          child: Text(
                              "Services is perfect , and product is good ",
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ],
    );
  }
}
