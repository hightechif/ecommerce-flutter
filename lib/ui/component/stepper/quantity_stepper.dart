import 'package:flutter/material.dart';

class QuantityStepper extends StatefulWidget {
  final Function(int) onQtyChanged;

  const QuantityStepper({super.key, required this.onQtyChanged});

  @override
  State<QuantityStepper> createState() => _QuantityStepperState();
}

class _QuantityStepperState extends State<QuantityStepper> {
  int _quantity = 1;
  bool _isActive = true;

  void _increment() => {setState(() => _quantity++)};

  void _decrement() {
    if (_quantity == 1) {
      setState(() => _isActive = false);
    }
    setState(() => _quantity = _quantity > 1 ? _quantity - 1 : 1);
  }

  @override
  void initState() {
    super.initState();
    setState(() => _isActive = true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              _decrement();
              widget.onQtyChanged(_isActive ? _quantity : 0);
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text('$_quantity', style: TextStyle(fontSize: 16)),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _increment();
              widget.onQtyChanged(_quantity);
            },
          ),
        ],
      ),
    );
  }
}
