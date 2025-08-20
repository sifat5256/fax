import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fax/theme.dart';
import 'package:flutter/material.dart';

import '../../routes/router.dart';
import 'document_folder/document_folder_screen.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class FileItem {
  final String name;
  final String date;
  final String pages;
  final String? status;
  final IconData? icon;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final String? image;

  const FileItem({
    required this.name,
    required this.date,
    required this.pages,
    this.status,
    this.icon,
    this.iconColor,
    this.iconBackgroundColor,
    this.image,
  });
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  void initState() {
    super.initState();
    _filteredFiles = _allFiles;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _folderNameController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _filteredFiles = _allFiles.where((file) {
        return file.name.toLowerCase().contains(
          _searchController.text.toLowerCase(),
        );
      }).toList();
    });
  }

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildFixedHeader(),
            _buildFileCount(),
            Divider(
              color: AppColors.lightGrey,
            ),
            Expanded(child: _buildScrollableList()),
          ],
        ),
      ),
    );
  }

  Widget _buildFixedHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(child: _buildSearchBar()),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.sort, color: Colors.grey.shade400),
          hintText: 'Search faxes...',
          hintStyle: TextStyle(color: AppColors.grey, fontSize: 16),
          prefixIcon: Icon(Icons.search, color: AppColors.grey, size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildAddFolderButton() {
    return IconButton(
      onPressed: _showCreateFolderDialog,
      icon: const Icon(Icons.add_circle_outline,
          color: AppColors.primaryColor, size: 20),
      padding: EdgeInsets.zero,
    );
  }

  Widget _buildFileCount() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: AppColors.primaryColor, size: 16),
              const SizedBox(width: 8),
              Text(
                '${_filteredFiles.length} Files, ${_filteredFiles.where((f) => f.icon == Icons.folder).length} Folders',
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            children: [_buildAddFolderButton()],
          )
        ],
      ),
    );
  }

  Widget _buildScrollableList() {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        controller: _scrollController,
        padding: const EdgeInsets.all(0),
        itemCount: _filteredFiles.length,
        separatorBuilder: (context, index) =>
            Divider(height: 1, color: Colors.grey.shade200, endIndent: 20, indent: 20),
        itemBuilder: (context, index) {
          return _buildFileItem(_filteredFiles[index]);
        },
      ),
    );
  }

  Widget _buildFileItem(FileItem file) {
    return Container(
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: _buildFileIcon(file),
        title: _buildFileTitle(file),
        subtitle: _buildFileSubtitle(file),
        trailing: _buildFileStatus(file),
        onTap: () {
          if (file.icon == Icons.folder) {
            context.pushRoute(DocumentFolderRoute(folderName: file.name));
          } else {
            context.pushRoute(DocumentDetailsRoute(
              document: DocumentItem(
                name: file.name,
                date: file.date,
                pages: file.pages,
                status: file.status,
                image: file.image ?? 'assets/images/1.jpg',
              ),
            ));
          }
        },
      ),
    );
  }

  Widget _buildFileIcon(FileItem file) {
    if (file.icon != null) {
      // This is a folder
      return Container(
        width: 50,
        height: 70,
        decoration: BoxDecoration(
          color: file.iconBackgroundColor ?? Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(file.icon, color: file.iconColor, size: 24),
      );
    } else {
      // This is a file with image
      return Container(
        color: Colors.grey.shade200,
        width: 50,
        height: 70,
        child: Container(
          width: 50,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(file.image ?? 'assets/images/1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }
  }

  Widget _buildFileTitle(FileItem file) {
    return Text(
      file.name,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildFileSubtitle(FileItem file) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            file.date,
            style: TextStyle(fontSize: 14, color: AppColors.grey),
          ),
          const SizedBox(height: 2),
          Text(
            file.pages,
            style: TextStyle(fontSize: 14, color: AppColors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildFileStatus(FileItem file) {
    if (file.status == null) return const SizedBox.shrink();

    Color statusColor;
    switch (file.status) {
      case 'received':
        statusColor = AppColors.primaryColor;
        break;
      case 'sent':
        statusColor = AppColors.green;
        break;
      default:
        statusColor = AppColors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        file.status!,
        style: TextStyle(
          color: statusColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}