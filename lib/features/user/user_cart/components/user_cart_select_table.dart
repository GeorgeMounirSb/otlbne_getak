import 'package:flutter/material.dart';

class UserCartSelectTable extends StatelessWidget {
  final int selectedNumber;
  final Function(int) selectNumber;
  const UserCartSelectTable({super.key, required this.selectedNumber, required this.selectNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if(selectedNumber > 0)
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: Image.asset(
            selectedNumber < 7 ? 'assets/images/table${selectedNumber + 1}.png' : 'assets/images/table7.png',
            key: ValueKey<int>(selectedNumber),
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 16),
        const Text("عدد الأشخاص", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => selectNumber(selectedNumber + 1),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              '$selectedNumber',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 16),
            InkWell(
              onTap: (selectedNumber > 0) ? () => selectNumber(selectedNumber - 1) : () {},
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: const Icon(Icons.remove, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}