import 'package:flutter/material.dart';

class HishabYearly extends StatefulWidget {
  final String totalSale, totalBaki;
  const HishabYearly(this.totalSale, this.totalBaki);

  @override
  _HishabYearlyState createState() => _HishabYearlyState();
}

class _HishabYearlyState extends State<HishabYearly> {
  Widget partOne() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Container(
                        height: 10.0,
                        width: 10.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.green),
                      ),
                      SizedBox(width: 5.0),
                      Text('বেচা বিক্রি থেকে আয়'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text('৳${widget.totalSale}',
                        style: TextStyle(color: Colors.green)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Container(
                        height: 10.0,
                        width: 10.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.green),
                      ),
                      SizedBox(width: 5.0),
                      Text('অন্যান্য আয়'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text('৳0', style: TextStyle(color: Colors.green)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget partTwo() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Container(
                        height: 10.0,
                        width: 10.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.green),
                      ),
                      SizedBox(width: 5.0),
                      Text('মোট ইনকাম'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text('৳${widget.totalSale}',
                        style: TextStyle(color: Colors.green)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Container(
                        height: 10.0,
                        width: 10.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.red),
                      ),
                      SizedBox(width: 5.0),
                      Text('মোট খরচ', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text('৳0', style: TextStyle(color: Colors.red)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget partThree() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Container(
                        height: 10.0,
                        width: 10.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.green),
                      ),
                      SizedBox(width: 5.0),
                      Text('মোট পাওনা'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text('৳${widget.totalBaki}',
                        style: TextStyle(color: Colors.green)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Container(
                        height: 10.0,
                        width: 10.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.red),
                      ),
                      SizedBox(width: 5.0),
                      Text('মোট দেনা', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text('৳0', style: TextStyle(color: Colors.red)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            partOne(),
            partTwo(),
            partThree(),
          ],
        ),
      ),
    );
  }
}
