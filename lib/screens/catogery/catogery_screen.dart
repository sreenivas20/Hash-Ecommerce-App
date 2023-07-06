import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';

class CatogeryScreen extends StatefulWidget {
  const CatogeryScreen({super.key});

  @override
  State<CatogeryScreen> createState() => _CatogeryScreenState();
}

class _CatogeryScreenState extends State<CatogeryScreen> {
  bool iSelected = false;
  int current = 0;

  void iSelectFun() {
    setState(() {
      iSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Catogery'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80.h,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: CatogerySlideWidget(
                      text: 'Casuals',
                      isSelected: current == index ? true : false),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}

class CatogerySlideWidget extends StatefulWidget {
  const CatogerySlideWidget({
    super.key,
    required this.text,
    required this.isSelected,
  });
  final String text;
  final bool isSelected;

  @override
  State<CatogerySlideWidget> createState() => _CatogerySlideWidgetState();
}

class _CatogerySlideWidgetState extends State<CatogerySlideWidget> {
  Color containerColor = const Color(0xffD9D9D9);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      height: 10.h,
      // width: 200.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.isSelected ? kPrimaryColor : containerColor),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
