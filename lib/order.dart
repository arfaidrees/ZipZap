import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  String _selectedOption = 'Ongoing';

  Widget _buildTaskContainer(String option) {
    if (option == 'Ongoing') {
      return Container(
        color: Colors.white,
        child: Center(
          child: Text(
            'Ongoing orders',
            style: TextStyle(
              fontSize: 20,
              color: _selectedOption == 'Ongoing' ? Colors.orange : Colors.black,
            ),
          ),
        ),
      );
    } else {
      return Container(
        color: option == 'Completed'
            ? Colors.white
            : option == 'Canceled'
            ? Colors.white
            : Colors.orange,
        child: Center(
          child: Text(
            '$option orders',
            style: TextStyle(
              fontSize: 20,
              color: _selectedOption == option ? Colors.orange : Colors.white,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Orders'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedOption = 'Ongoing';
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _selectedOption == 'Ongoing' ? Colors.orange : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      'Ongoing',
                      style: TextStyle(
                        color: _selectedOption == 'Ongoing' ? Colors.orange : Colors.grey,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedOption = 'Completed';
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _selectedOption == 'Completed' ? Colors.orange : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      'Completed',
                      style: TextStyle(
                        color: _selectedOption == 'Completed' ? Colors.orange : Colors.grey,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedOption = 'Canceled';
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _selectedOption == 'Canceled' ? Colors.orange : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      'Canceled',
                      style: TextStyle(
                        color: _selectedOption == 'Canceled' ? Colors.orange : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildTaskContainer(_selectedOption),
          ),
        ],
      ),
    );
  }
}
