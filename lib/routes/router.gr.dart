// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AccountScreen]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
    : super(AccountRoute.name, initialChildren: children);

  static const String name = 'AccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AccountScreen();
    },
  );
}

/// generated route for
/// [AiToolsScreen]
class AiToolsRoute extends PageRouteInfo<void> {
  const AiToolsRoute({List<PageRouteInfo>? children})
    : super(AiToolsRoute.name, initialChildren: children);

  static const String name = 'AiToolsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return  AiToolsScreen();
    },
  );
}

/// generated route for
/// [DocumentDetailsScreen]
class DocumentDetailsRoute extends PageRouteInfo<DocumentDetailsRouteArgs> {
  DocumentDetailsRoute({
    Key? key,
    required DocumentItem document,
    List<PageRouteInfo>? children,
  }) : super(
         DocumentDetailsRoute.name,
         args: DocumentDetailsRouteArgs(key: key, document: document),
         initialChildren: children,
       );

  static const String name = 'DocumentDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DocumentDetailsRouteArgs>();
      return DocumentDetailsScreen(key: args.key, document: args.document);
    },
  );
}

class DocumentDetailsRouteArgs {
  const DocumentDetailsRouteArgs({this.key, required this.document});

  final Key? key;

  final DocumentItem document;

  @override
  String toString() {
    return 'DocumentDetailsRouteArgs{key: $key, document: $document}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DocumentDetailsRouteArgs) return false;
    return key == other.key && document == other.document;
  }

  @override
  int get hashCode => key.hashCode ^ document.hashCode;
}

/// generated route for
/// [DocumentFolderScreen]
class DocumentFolderRoute extends PageRouteInfo<DocumentFolderRouteArgs> {
  DocumentFolderRoute({
    Key? key,
    required String folderName,
    List<PageRouteInfo>? children,
  }) : super(
         DocumentFolderRoute.name,
         args: DocumentFolderRouteArgs(key: key, folderName: folderName),
         initialChildren: children,
       );

  static const String name = 'DocumentFolderRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DocumentFolderRouteArgs>();
      return DocumentFolderScreen(key: args.key, folderName: args.folderName);
    },
  );
}

class DocumentFolderRouteArgs {
  const DocumentFolderRouteArgs({this.key, required this.folderName});

  final Key? key;

  final String folderName;

  @override
  String toString() {
    return 'DocumentFolderRouteArgs{key: $key, folderName: $folderName}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DocumentFolderRouteArgs) return false;
    return key == other.key && folderName == other.folderName;
  }

  @override
  int get hashCode => key.hashCode ^ folderName.hashCode;
}

/// generated route for
/// [FileDetailsScreen]
class FileDetailsRoute extends PageRouteInfo<FileDetailsRouteArgs> {
  FileDetailsRoute({
    Key? key,
    required AutoGridItemModel item,
    List<PageRouteInfo>? children,
  }) : super(
         FileDetailsRoute.name,
         args: FileDetailsRouteArgs(key: key, item: item),
         initialChildren: children,
       );

  static const String name = 'FileDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FileDetailsRouteArgs>();
      return FileDetailsScreen(key: args.key, item: args.item);
    },
  );
}

class FileDetailsRouteArgs {
  const FileDetailsRouteArgs({this.key, required this.item});

  final Key? key;

  final AutoGridItemModel item;

  @override
  String toString() {
    return 'FileDetailsRouteArgs{key: $key, item: $item}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FileDetailsRouteArgs) return false;
    return key == other.key && item == other.item;
  }

  @override
  int get hashCode => key.hashCode ^ item.hashCode;
}

/// generated route for
/// [GenerateFaxNumberScreen]
class GenerateFaxNumberRoute extends PageRouteInfo<void> {
  const GenerateFaxNumberRoute({List<PageRouteInfo>? children})
    : super(GenerateFaxNumberRoute.name, initialChildren: children);

  static const String name = 'GenerateFaxNumberRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GenerateFaxNumberScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [NewFaxScreen]
class NewFaxRoute extends PageRouteInfo<void> {
  const NewFaxRoute({List<PageRouteInfo>? children})
    : super(NewFaxRoute.name, initialChildren: children);

  static const String name = 'NewFaxRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NewFaxScreen();
    },
  );
}

/// generated route for
/// [ProfileDetailScreen]
class ProfileDetailRoute extends PageRouteInfo<void> {
  const ProfileDetailRoute({List<PageRouteInfo>? children})
    : super(ProfileDetailRoute.name, initialChildren: children);

  static const String name = 'ProfileDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileDetailScreen();
    },
  );
}

/// generated route for
/// [ShellScreen]
class ShellRoute extends PageRouteInfo<void> {
  const ShellRoute({List<PageRouteInfo>? children})
    : super(ShellRoute.name, initialChildren: children);

  static const String name = 'ShellRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ShellScreen();
    },
  );
}

/// generated route for
/// [SubscriptionsScreen]
class SubscriptionsRoute extends PageRouteInfo<void> {
  const SubscriptionsRoute({List<PageRouteInfo>? children})
    : super(SubscriptionsRoute.name, initialChildren: children);

  static const String name = 'SubscriptionsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SubscriptionsScreen();
    },
  );
}

/// generated route for
/// [TemplateScreen]
class TemplateRoute extends PageRouteInfo<void> {
  const TemplateRoute({List<PageRouteInfo>? children})
    : super(TemplateRoute.name, initialChildren: children);

  static const String name = 'TemplateRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TemplateScreen();
    },
  );
}
