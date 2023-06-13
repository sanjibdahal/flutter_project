import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyContainer extends StatefulWidget {
  MyContainer({
    super.key,
    required this.text,
    required this.duedate,
    required this.price,
  });

  String? text;
  DateTime duedate;
  double? price;

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  // var now = DateTime.now();

  // var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final difference = widget.duedate.difference(DateTime.now());
    String? duediff;
    // var duediff = difference.inDays < 1
    //     ? '${difference.inHours} hours'
    //     : '${difference.inDays} days';
    if (difference.inDays >= 1) {
      duediff = '${difference.inDays} days';
    } else if (difference.inHours >= 1) {
      duediff = '${difference.inHours} hours';
    } else if (difference.inMinutes >= 1) {
      duediff = '${difference.inMinutes} minutes';
    }
    String duedate =
        DateFormat.yMMMMd('en_US').format(widget.duedate).toString();
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      color: Colors.blue),
                  height: 35,
                  width: 4,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    "${widget.text}",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  '\$${widget.price}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              difference <= Duration.zero ? 'Missed.' : 'Due in $duediff.',
              style: TextStyle(color: Colors.redAccent, fontSize: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_month),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      duedate,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[50],
                    foregroundColor: difference <= Duration.zero
                        ? Colors.red
                        : Colors.lightBlue[600],
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 17,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        difference <= Duration.zero ? 'Missed' : 'Active',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
