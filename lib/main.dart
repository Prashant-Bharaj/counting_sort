import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counting Sort'),
        ),
        body: FirstScreen(),
      ),
    );
  }
}
class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}
class _FirstScreenState extends State<FirstScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController tx0 = TextEditingController();
  TextEditingController tx1 = TextEditingController();
  TextEditingController tx2 = TextEditingController();
  TextEditingController tx3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for(var i in [tx0, tx1, tx2,tx3])TextField(
            controller: i,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "write element to sort",
            ),
          ),

          FlatButton(
            onPressed: ()=> func(context,tx0,tx1,tx2,tx3,_scaffoldKey),
            child: Text('click me'),
          ),

        ],
      ),
    );

  }
}
void func(context,tx0,tx1,tx2,tx3,_scaffoldKey){
  List<String> arr = ['$tx0'.trim(),'$tx1'.trim(), '$tx2'.trim(), '$tx3'.trim()];
  print('sorted array is $arr');
  sort(arr);
  print('sorted array is $arr');

}
// void main() {
//   List<String> arr = ['1','0','g', 'e', 'e'];
//   print('input array is $arr');
//   sort(arr);
//   print("Sorted character array is $arr");
// }
sort(List<String> arr){
  // n stores the size of the given array
  int n = arr.length;
  // output array
  List<String> output=[];
  // count array which store the occurrence of each element of the array
  List<int> count=[];
  // assigning the 0 to the count array
  // the range of the count array is between 0 and max value of the array
  // here we are dealing with characters which have a maximum value 255
  // therefore size of the array is going to be 256
  /*
  note: if we have a case in which input values are between 0 to 9 only then we use the count array of size 10
   */
  for(int i = 0; i < 256; ++i)
    count.insert(i, 0);
  for(int i = 0; i < n; ++i) {
    // size of the output array is size of input array (i.e. n)
    output.insert(i, '');
    // here we check the no. of occurrence of each element in the array
    // by increasing the count array value by 1 corresponding to input array value
    count[arr[i].toString().codeUnitAt(0)]+=1;
  }
  // taking a cumulative sum of count array
  // by adding the previous value to the current element of an array and store it in count array
  // that's why we start with index 1
  for(int i = 1; i<= 255; ++i)
    count[i] += count[i-1];
  //Now we have a count array with increasing numbers
  // so, the higher value have a higher count value irrespective of its occurrences
  // here we loop in reverse order of input array
  for(int i = n-1; i >= 0; i--){
    // here we first take the last value of input array and checking the count array value corresponding to it
    // now decrease it by 1  after that at this index of an output array put last value.
    /*
    common doubt:
    maximum value of count will never we greater than n(i.e. the size of input array)
    since we have a index range(0 to n-1) that's why we are subtracting 1
     */
    output[count[arr[i].codeUnitAt(0)] - 1] = arr[i];
    //now decrease the count value
    --count[arr[i].codeUnitAt(0)];
  }
  for (int i = 0; i < n; ++i)
    arr[i] = output[i];
}
