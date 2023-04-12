import 'package:flutter/material.dart';

class CustomCardDetalle extends StatelessWidget {
  const CustomCardDetalle({
    super.key,
    required this.widget,
    this.height = 230,
    this.onTap,
    this.text = 'info', required this.eliminar,
  });

  final Widget widget;
  final Function? onTap;
  final Function eliminar;

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
          child: Column(
            children: [
              Expanded(child: widget),
              Container(
                decoration: BoxDecoration(
                   border:  Border.all(color: Colors.white,)
                ),
                width: double.infinity,
                height: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(text!),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              
              ),
             IconButton(onPressed: (){}, icon: const Icon(Icons.delete_forever, color: Colors.red,size: 35,))
            ],
          )),
    );
  }
}
