import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/screens/myorder/components/myorder_productlist_widget.dart';
import 'package:hash_ecommerce_user_sideapp/screens/myorder/components/title_with_searchbox_myorderwidgets.dart';

class MyOrderBody extends StatelessWidget {
  const MyOrderBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleWithSearchBoxMyOrder(),
        kSizedBox20,
        Expanded(
          child: ListView.separated(
            itemCount: 5,
            itemBuilder: (context, index) {
              return const MyOrderProductListWidget();
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Color.fromARGB(255, 136, 136, 136),
              );
            },
          ),
        )
      ],
    );
  }
}
