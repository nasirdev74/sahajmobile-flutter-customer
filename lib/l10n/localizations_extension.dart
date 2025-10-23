import 'app_localizations.dart';
import 'package:flutter/widgets.dart';

/// Extension on [BuildContext] which makes it easier to access
/// the current [AppLocalizations].
extension LocalizationsX on BuildContext {
  /// Retrieves the current [AppLocalizations].
  /// This is just syntactic sugar for the following:
  ///
  /// ```dart
  /// AppLocalizations.of(context);
  /// ```
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
