import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.widget,
    this.height = 170,
    this.onTap, this.text = 'info',
  });

  final Widget widget;
  final Function? onTap;
  final double? height;
  final String? text;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: double.infinity,
          height: height,
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(4, 6),
                  blurRadius: 10,
                ),
              ],
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(colors: [
                Color(0xff6989F5),
                Color(0xff906ef5),
              ])),
          child: Row(
            children: [
              Expanded(child: widget),
              onTap != null
                  ? SizedBox(
                      width: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                         const Icon(Icons.arrow_forward_ios),
                          Text(text!)
                        ],
                      ),
                    )
                  : Container()
            ],
          )),
    );
  }
}
