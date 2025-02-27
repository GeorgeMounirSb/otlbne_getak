import 'package:flutter/material.dart';

class UserCartSelectTime extends StatelessWidget {
  final Function(int) selectHours, selectMinutes;
  final Function(String) selectPeriod;
  final List<int> hours, minutes;
  final List<String> periods;
  const UserCartSelectTime({super.key, required this.selectHours, required this.selectMinutes, required this.hours, required this.minutes, required this.selectPeriod, required this.periods});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("اختار الوقت", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Expanded(
            child: Row(
              children: [
                const Expanded(flex: 2, child: SizedBox()),
                Expanded(
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 40,
                    diameterRatio: 1.2,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) => selectHours(index),
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return Center(
                          child: Text(
                            hours[index].toString().padLeft(2, '0'),
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                      childCount: hours.length,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(":", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                Expanded(
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 40,
                    diameterRatio: 1.2,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) => selectMinutes(minutes[index]),
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return Center(
                          child: Text(
                            minutes[index].toString().padLeft(2, '0'),
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                      childCount: minutes.length,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 40,
                    diameterRatio: 1.2,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) => selectPeriod(periods[index]),
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return Center(
                          child: Text(
                            periods[index],
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                      childCount: periods.length,
                    ),
                  ),
                ),
                const Expanded(flex: 2, child: SizedBox()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}