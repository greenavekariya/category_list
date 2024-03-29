  import 'package:flutter/material.dart';

  class CategoryShow extends StatefulWidget {
    final List<String> selectedCategory;
    final Map<String, List<String>> categorySubcategoryMap;
    final List<String> allCategories;

    CategoryShow({
      required this.selectedCategory,
      required this.categorySubcategoryMap,
      required this.allCategories,
    });

    @override
    _CategoryShowState createState() => _CategoryShowState();
  }

  class _CategoryShowState extends State<CategoryShow> {
    String? _selectedCategory;
    List<String>? _selectedSubcategories;

    @override
    void initState() {
      super.initState();
      _selectedCategory =
      widget.selectedCategory.isNotEmpty ? widget.selectedCategory[0] : null;
      _selectedSubcategories = _getSubcategoriesForSelectedCategory();
    }

    List<String>? _getSubcategoriesForSelectedCategory() {
      if (_selectedCategory == "none") {
        List<String> allSubcategories = [];
        widget.categorySubcategoryMap.values.forEach((subcategories) {
          allSubcategories.addAll(subcategories);
        });
        return allSubcategories;

      } else {
        return widget.categorySubcategoryMap[_selectedCategory!];
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Selected Categories'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: DropdownButtonFormField<String>(
                icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
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
                value: _selectedCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                    _selectedSubcategories =
                        _getSubcategoriesForSelectedCategory();
                  });
                },
                items: widget.allCategories.map<DropdownMenuItem<String>>(
                      (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _selectedSubcategories?.length ?? 0,
                itemBuilder: (context, index) {
                  String subcategory = _selectedSubcategories![index];
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Card(
                      child: ListTile(
                        title: Text(subcategory),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }

