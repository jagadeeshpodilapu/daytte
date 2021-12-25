import 'package:daytte/themes/color_styles.dart';
import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  OwnMessageCard({Key? key, required this.message, this.time = "4"})
      : super(key: key);
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Color(0xff7004E3),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 40,
                  top: 8,
                  bottom: 8,
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white
                  ),
                ),
              ),
             /*  Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      DateTime.now().toString(),
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.done_all,
                      size: 20,
                    ),
                  ],
                ),
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
