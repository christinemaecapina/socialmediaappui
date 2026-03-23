import 'package:flutter/material.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> allSearches = [
    'Niana Guerrero',
    'Cong TV',
    'Zeinab Harake',
    'Ivana Alawi',
    'Vice Ganda',
    'Donnalyn Bartolome',
    'Andrea Brillantes',
    'Bella Poarch',
  ];

  late List<String> filteredSearches;

  @override
  void initState() {
    super.initState();
    filteredSearches = List.from(allSearches);
  }

  void _filterSearches(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredSearches = List.from(allSearches);
      } else {
        filteredSearches = allSearches
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _clearSearch() {
    _searchController.clear();
    _filterSearches('');
  }

  void _removeSearchItem(int index) {
    setState(() {
      filteredSearches.removeAt(index);
    });
  }

  void _clearAll() {
    setState(() {
      filteredSearches.clear();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0,
        title: Container(
          height: 36,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              const SizedBox(width: 8),
              const Icon(Icons.search, color: Colors.grey, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  autofocus: true,
                  onChanged: _filterSearches,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              if (_searchController.text.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.cancel, color: Colors.grey, size: 18),
                  onPressed: _clearSearch,
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => _filterSearches(_searchController.text),
            child: const Text(
              'Search',
              style: TextStyle(
                  color: Color(0xffea4359),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recommended searches',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                GestureDetector(
                  onTap: _clearAll,
                  child: const Text(
                    'Clear all',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: filteredSearches.isEmpty
                  ? const Center(child: Text('No results found'))
                  : ListView.builder(
                      itemCount: filteredSearches.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: Row(
                            children: [
                              const Icon(Icons.access_time,
                                  color: Colors.grey, size: 20),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Text(
                                  filteredSearches[index],
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black87),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _removeSearchItem(index),
                                child: const Icon(Icons.close,
                                    color: Colors.grey, size: 20),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
