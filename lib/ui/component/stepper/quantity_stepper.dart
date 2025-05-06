import 'package:flutter/material.dart';

class QuantityStepper extends StatefulWidget {
  const QuantityStepper({super.key});

  @override
  State<QuantityStepper> createState() => _QuantityStepperState();
}

class _QuantityStepperState extends State<QuantityStepper> {
  int _quantity = 1;

  void _increment() => setState(() => _quantity++);

  void _decrement() =>
      setState(() => _quantity = _quantity > 1 ? _quantity - 1 : 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: Icon(Icons.remove), onPressed: _decrement),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text('$_quantity', style: TextStyle(fontSize: 16)),
          ),
          IconButton(icon: Icon(Icons.add), onPressed: _increment),
        ],
      ),
    );
  }
}
