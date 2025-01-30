import 'package:flutter/material.dart';

class CancelOrderConfirm extends StatefulWidget {
  const CancelOrderConfirm({super.key});

  @override
  State<CancelOrderConfirm> createState() => _CancelOrderConfirmState();
}

class _CancelOrderConfirmState extends State<CancelOrderConfirm> {
  final List<String> _reasons = [
    "I changed my mind",
    "I accidentally placed the order",
    "This is a duplicate order",
    "I placed the wrong order",
    "Others"
  ];


  final List<bool> _selectedReasons = List.generate(5, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            margin: EdgeInsets.only(top: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                Center(child: Text("Cancel Order",style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),)),
                SizedBox(height: 12,),
                const Text(
                  "You can cancel your order anytime before it is confirmed by our staff.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Why do you want to cancel your order?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                // Dynamic list of reasons with checkboxes
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _reasons.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.black, 
                          
                          activeColor: Colors.white,
                          
                          value: _selectedReasons[index],
                          onChanged: (bool? value) {
                            setState(() {
                              _selectedReasons[index] = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            _reasons[index],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                    
                      ),
                      onPressed: () {
                        Navigator.pop(context); 
                      },
                      child: const Text("Skip"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      onPressed: () {
                        // Handle confirmation logic here
                        List<String> selectedReasons = [];
                        for (int i = 0; i < _reasons.length; i++) {
                          if (_selectedReasons[i]) {
                            selectedReasons.add(_reasons[i]);
                          }
                        }
                      
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Cancellation Reasons"),
                              content: Text(
                                selectedReasons.isNotEmpty
                                    ? selectedReasons.join("\n")
                                    : "No reasons selected.",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text("Confirm"
                      ,
                      style: TextStyle(
                        color:Colors.black,
                        fontSize: 16, fontWeight: FontWeight.w400),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
