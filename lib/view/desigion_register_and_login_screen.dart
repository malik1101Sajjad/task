import 'package:flutter/material.dart';
import 'package:work_task/controller/containter/container_widget.dart';
import 'package:work_task/controller/images/imagesUrl.dart';

class DesigionScreen extends StatelessWidget {
  final String? titlename;
  const DesigionScreen({required this.titlename, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContainerWidget(
            height: 80,
            width: double.infinity,
            child: Image.asset(
              imageBg,
              fit: BoxFit.cover,
            )),
        const SizedBox(
          height: 40,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ContainerWidget(
              height: 50,
              width: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  imageIcon,
                  fit: BoxFit.cover,
                ),
              )),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                      text: 'Hello',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w300),
                      children: [
                    TextSpan(
                        text: 'GP',
                        style: TextStyle(
                            color: Colors.red.shade700,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ])),
              Text('Bringing wellness Home',
                  style: TextStyle(
                      color: Colors.red.shade700,
                      fontSize: 8,
                      fontWeight: FontWeight.w600))
            ],
          )
        ]),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(titlename ?? 'N/L',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
