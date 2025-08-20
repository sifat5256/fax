import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fax/theme.dart';
import 'package:flutter/material.dart';

import '../../../routes/router.dart';
import '../home_screen.dart';

@RoutePage()
class DocumentFolderScreen extends StatefulWidget {
  final String folderName;
  const DocumentFolderScreen({super.key, required this.folderName});

  @override
  State<DocumentFolderScreen> createState() => _DocumentFolderScreenState();
}

class DocumentItem {
  final String name;
  final String date;
  final String pages;
  final String? status;
  final String image;

  const DocumentItem({
    required this.name,
    required this.date,
    required this.pages,
    this.status,
    required this.image,
  });
}

class _DocumentFolderScreenState extends State<DocumentFolderScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<DocumentItem> _filteredDocuments = _allDocuments;

  static const List<DocumentItem> _allDocuments = [
    DocumentItem(
      name: 'Item 1',
      date: '2025-07-11',
      pages: '24 pages',
      status: 'received',
      image: 'assets/images/1.jpg',
    ),
    DocumentItem(
      name: 'Item 2',
      date: '2025-07-10',
      pages: '8 pages',
      status: 'sent',
      image: 'assets/images/2.jpg',
    ),
    DocumentItem(
      name: 'Item 3',
      date: '2025-07-09',
      pages: '3 pages',
      status: 'received',
      image: 'assets/images/1.jpg',
    ),
    DocumentItem(
      name: 'Item 4',
      date: '2025-07-08',
      pages: '15 pages',
      status: 'received',
      image: 'assets/images/2.jpg',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _filteredDocuments = _allDocuments.where((doc) {
        return doc.name.toLowerCase().contains(
          _searchController.text.toLowerCase(),
        );
      }).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        title: Text(widget.folderName),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            _SearchHeader(controller: _searchController),
            _DocumentCount(count: _filteredDocuments.length),
            Expanded(child: _DocumentList(
              controller: _scrollController,
              documents: _filteredDocuments,
            )),
          ],
        ),
      ),
    );
  }
}

// Extracted Widgets
class _SearchHeader extends StatefulWidget {
  final TextEditingController controller;
  const _SearchHeader({required this.controller});

  @override
  State<_SearchHeader> createState() => _SearchHeaderState();
}
final TextEditingController _searchController = TextEditingController();
final TextEditingController _folderNameController = TextEditingController();
final ScrollController _scrollController = ScrollController();
List<FileItem> _allFiles = [
  const FileItem(
    name: 'Documents Folder',
    date: '2025-07-11',
    pages: '3 pages',
    icon: Icons.folder,
    iconColor: AppColors.primaryColor,
    iconBackgroundColor: AppColors.lightBlue,
  ),
  const FileItem(
    name: 'Tax Returns 2024',
    date: '2025-07-11',
    pages: '12 pages',
    status: 'received',
    image: 'assets/images/1.jpg',
  ),
  const FileItem(
    name: 'Medical Records',
    date: '2025-07-10',
    pages: '8 pages',
    status: 'sent',
    image: 'assets/images/2.jpg',
  ),
  const FileItem(
    name: 'Insurance Claims',
    date: '2025-07-09',
    pages: '5 pages',
    status: 'received',
    image: 'assets/images/1.jpg',
  ),
  const FileItem(
    name: 'Legal Partners LLC',
    date: 'Yesterday, 4:15 PM',
    pages: '8 pages',
    status: 'received',
    image: 'assets/images/2.jpg',
  ),
];

List<FileItem> _filteredFiles = [];




class _SearchHeaderState extends State<_SearchHeader> {
  void _showCreateFolderDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: AlertDialog(
            title: const Text(
              'Create New Folder',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: _folderNameController,
                decoration: InputDecoration(
                  hintText: 'Enter folder name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400), // Grey 400 border
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400), // Grey 400 when enabled
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400), // Grey 400 when focused
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                autofocus: true,
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade100, // Grey 100 background
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        _folderNameController.clear();
                      },
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        if (_folderNameController.text.trim().isNotEmpty) {
                          _createNewFolder(_folderNameController.text.trim());
                          Navigator.of(context).pop();
                          _folderNameController.clear();
                        }
                      },
                      child: const Text('Create'),
                    ),
                  ),
                ],
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
    );
  }

  void _createNewFolder(String folderName) {
    setState(() {
      _allFiles.insert(0, FileItem(
        name: folderName,
        date: 'Just now',
        pages: '0 pages',
        icon: Icons.folder,
        iconColor: AppColors.primaryColor,
        iconBackgroundColor: AppColors.lightBlue,
      ));
      _filteredFiles = _allFiles.where((file) {
        return file.name.toLowerCase().contains(
          _searchController.text.toLowerCase(),
        );
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.lightGrey,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: 'Search documents...',
                  hintStyle: TextStyle(color: AppColors.grey, fontSize: 16),
                  prefixIcon: Icon(Icons.search, color: AppColors.grey, size: 20),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: IconButton(
              onPressed:  _showCreateFolderDialog,
              icon: const Icon(Icons.add, color: AppColors.grey, size: 20),
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}

class _DocumentCount extends StatelessWidget {
  final int count;
  const _DocumentCount({required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: AppColors.lightGrey,
      child: Row(
        children: [
          Icon(Icons.info_outline, color: AppColors.primaryColor, size: 16),
          const SizedBox(width: 8),
          Text(
            '$count Documents',
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _DocumentList extends StatelessWidget {
  final ScrollController controller;
  final List<DocumentItem> documents;
  const _DocumentList({required this.controller, required this.documents});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        controller: controller,
        padding: EdgeInsets.zero,
        itemCount: documents.length,
        separatorBuilder: (_, __) =>  Divider(height: 1, color: Colors.grey.shade200, indent: 20,endIndent: 20,),
        itemBuilder: (context, index) => _DocumentListItem(item: documents[index]),
      ),
    );
  }
}

class _DocumentListItem extends StatelessWidget {
  final DocumentItem item;
  const _DocumentListItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(item.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(item.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.date),
          Text(item.pages),
        ],
      ),
      trailing: item.status != null ? _StatusBadge(status: item.status!) : null,
      onTap: () {
        context.pushRoute(DocumentDetailsRoute(document: item));
      },
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final color = status == 'received' ? AppColors.primaryColor
        : status == 'sent' ? AppColors.green
        : AppColors.grey;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}