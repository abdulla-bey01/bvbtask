import '/app/helpers/extension_methods/date_time_extension.dart';
import '/data/models/data_model.dart';
import '/ui/view_models/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//i did not place the widgets in different files, i guess that it is easy to review the code in same file

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const route = '/home-screen';

  @override
  Widget build(BuildContext context) {
    final HomeScreenViewModel homeScreenViewModel =
        Get.put(HomeScreenViewModel());
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Obx(() {
        return Center(
          child: Container(
            color: Colors.teal,
            height: 500,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 500,
                    width: MediaQuery.of(context).size.width * .8,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: homeScreenViewModel.scrollController,
                      itemCount: homeScreenViewModel.dataList.length,
                      itemBuilder: (ctx, index) {
                        final data = homeScreenViewModel.dataList[index];
                        final cellWidth = MediaQuery.of(context).size.width / 5;
                        return SizedBox(
                          width: cellWidth,
                          child: Column(
                            children: [
                              Day(cellWidth: cellWidth, data: data),
                              Chart(cellWidth: cellWidth, data: data),
                              Met(cellWidth: cellWidth, data: data),
                              Jogging(cellWidth: cellWidth, data: data),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const GoalLine(),
                const PositionedInfoText(
                  top: 416,
                  text: 'MET',
                ),
                const PositionedInfoText(
                  top: 466,
                  text: 'km/jogging',
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
    required this.cellWidth,
    required this.data,
  }) : super(key: key);

  final double cellWidth;
  final DataModel data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: cellWidth,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              width: cellWidth,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 3,
                  ),
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [0, 1, 2].map((e) {
                  return Container(
                    width: cellWidth / 4,
                    height: e == 0
                        ? data.greenValue.toDouble()
                        : e == 1
                            ? data.pinkValue.toDouble()
                            : data.blueValue.toDouble(),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          e == 0
                              ? Colors.green[300]!
                              : e == 1
                                  ? Colors.pink[300]!
                                  : Colors.blue[300]!,
                          e == 0
                              ? Colors.green[900]!
                              : e == 1
                                  ? Colors.pink[900]!
                                  : Colors.blue[900]!,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GoalLine extends StatelessWidget {
  const GoalLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 330,
      left: 0,
      child: SizedBox(
        width: Get.size.width,
        child: Row(
          children: [
            ...List.generate(18, (r) => r).map((e) {
              return Padding(
                padding: const EdgeInsets.only(right: 2.0),
                child: Container(
                  height: 2,
                  width: (Get.size.width * .8) / 18,
                  color: Colors.white,
                ),
              );
            }).toList(),
            const Text(
              'Goal',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class PositionedInfoText extends StatelessWidget {
  const PositionedInfoText({
    Key? key,
    required this.top,
    this.right = 10,
    required this.text,
  }) : super(key: key);
  final double top;
  final double right;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class Jogging extends StatelessWidget {
  const Jogging({
    Key? key,
    required this.cellWidth,
    required this.data,
  }) : super(key: key);

  final double cellWidth;
  final DataModel data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: cellWidth,
      child: Center(
        child: Text(
          data.jogging.toStringAsFixed(1),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class Met extends StatelessWidget {
  const Met({
    Key? key,
    required this.cellWidth,
    required this.data,
  }) : super(key: key);

  final double cellWidth;
  final DataModel data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: cellWidth,
      child: Center(
        child: Text(
          data.met.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class Day extends StatelessWidget {
  const Day({
    Key? key,
    required this.cellWidth,
    required this.data,
  }) : super(key: key);

  final double cellWidth;
  final DataModel data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: cellWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data.date.getDayName(),
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            '${data.date.day}.${data.date.month}.',
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
