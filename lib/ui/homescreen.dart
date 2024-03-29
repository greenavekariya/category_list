import 'package:categroy_list/ui/showdata.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> categories = ['none', 'Orange', 'Lichi', 'Graphs', 'Apple'];
   String? dropdownValue;

  TextEditingController _subcategory = TextEditingController();
  Map<String, List<String>> categorySubcategoryMap = {};


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 270),
            child: Text(
              'Category',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.all(12),
            child: DropdownButtonFormField<String>(
              icon: const Icon(Icons.arrow_drop_down, color: Colors.black,),
              iconSize: 26,
              decoration: InputDecoration(
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
              hint: Text('Select Category'),
              dropdownColor: Colors.white,
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: categories
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(right: 210),
            child: Text(
              'Sub Category',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextFormField(
              controller: _subcategory,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF00AEEF), Color(0xFF0072BC)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: () {
                    String subcategory = _subcategory.text;
                    if (dropdownValue != null && subcategory.isNotEmpty) {
                      if (categorySubcategoryMap.containsKey(dropdownValue)) {
                        categorySubcategoryMap[dropdownValue]!.add(subcategory);

                      }else if(dropdownValue != null && dropdownValue == "none" && subcategory.isNotEmpty){
                        categories.add(subcategory);

                      }
                      else {
                        categorySubcategoryMap[dropdownValue!] = [subcategory];
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryShow(
                            selectedCategory: [dropdownValue!],
                            categorySubcategoryMap: categorySubcategoryMap,
                            allCategories: categories,
                          ),
                        ),
                      );
                      _subcategory.clear();
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
