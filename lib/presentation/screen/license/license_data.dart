part of 'license_agreement_screen.dart';

/// This is a collection of licenses and the packages to which they apply.
/// [packageLicenseBindings] records the m+:n+ relationship between the license
/// and packages as a map of package names to license indexes.
class _LicenseData {
  final List<LicenseEntry> licenses = <LicenseEntry>[];
  final Map<String, List<int>> packageLicenseBindings = <String, List<int>>{};
  final List<String> packages = <String>[];

  // Special treatment for the first package since it should be the package
  // for delivered application.
  String? firstPackage;

  void addLicense(LicenseEntry entry) {
    // Before the license can be added, we must first record the packages to
    // which it belongs.
    for (final String package in entry.packages) {
      _addPackage(package);
      // Bind this license to the package using the next index value. This
      // creates a contract that this license must be inserted at this same
      // index value.
      packageLicenseBindings[package]!.add(licenses.length);
    }
    licenses.add(entry); // Completion of the contract above.
  }

  /// Add a package and initialize package license binding. This is a no-op if
  /// the package has been seen before.
  void _addPackage(String package) {
    if (!packageLicenseBindings.containsKey(package)) {
      packageLicenseBindings[package] = <int>[];
      firstPackage ??= package;
      packages.add(package);
    }
  }

  /// Sort the packages using some comparison method, or by the default manner,
  /// which is to put the application package first, followed by every other
  /// package in case-insensitive alphabetical order.
  void sortPackages([int Function(String a, String b)? compare]) {
    packages.sort(compare ??
        (String a, String b) {
          // Based on how LicenseRegistry currently behaves, the first package
          // returned is the end user application license. This should be
          // presented first in the list. So here we make sure that first package
          // remains at the front regardless of alphabetical sorting.
          if (a == firstPackage) {
            return -1;
          }
          if (b == firstPackage) {
            return 1;
          }
          return a.toLowerCase().compareTo(b.toLowerCase());
        });
  }
}
