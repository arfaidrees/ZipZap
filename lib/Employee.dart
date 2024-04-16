import 'dart:async';
import 'package:flutter/material.dart';

class Order {
  final String id;
  final String name;
  bool isDelivered;

  Order({
    required this.id,
    required this.name,
    this.isDelivered = false,
  });
}

class empos extends StatefulWidget {
  @override
  os createState() => os();
}

class os extends State<empos> {
  DateTime? startTime;
  DateTime? endTime;
  bool isClockingOut = false;
  late Timer timer;
  int secondsPassed = 0;

  List<Order> orders = [
    Order(id: '1', name: 'Order 1'),
    Order(id: '2', name: 'Order 2'),
    Order(id: '3', name: 'Order 3'),
  ];

  void startTimer() {
    startTime = DateTime.now();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        secondsPassed++;
      });
    });
  }

  void stopTimer() {
    endTime = DateTime.now();
    timer.cancel();
    setState(() {
      isClockingOut = false;
    });
  }

  String formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secondsLeft = seconds % 60;
    return '$hours:$minutes:$secondsLeft';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
          actions: [
            if (startTime != null)
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Text(formatTime(secondsPassed)),
              ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.orange.shade300, Colors.orange.shade700],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(isClockingOut ? Icons.timer_off : Icons.timer),
                    color: isClockingOut ? Colors.red : Colors.green,
                    onPressed: () {
                      if (isClockingOut) {
                        stopTimer(); // Stop the timer when clocking out
                        setState(() {
                          isClockingOut = false;
                        });
                      } else {
                        startTimer(); // Start the timer when clocking in
                        setState(() {
                          isClockingOut = true;
                        });
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Orders to Deliver',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(orders[index].name),
                      trailing: IconButton(
                        icon: Icon(orders[index].isDelivered
                            ? Icons.check_circle
                            : Icons.circle),
                        onPressed: () {
                          setState(() {
                            orders[index].isDelivered = !orders[index].isDelivered;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}