import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ///
  /// Invokes the action associated with the given [Intent]
  ///
  /// Will throw if no ambient [Actions] widget is found, or if the given
  /// `intent` doesn't map to an action in any of the [Actions.actions] maps
  /// that are found.
  ///
  /// Returns true if an action was successfully invoked.
  ///
  Object? invokeAction<T extends Intent>(T intent) =>
      Actions.invoke(this, intent);

  ///
  /// Returns The state from the closest instance of this class that encloses the given context.
  ///
  /// It is used for validating forms
  ///
  FormState? get form => Form.of(this);

  ///
  /// Returns The current [Locale] of the app as specified in the [Localizations] widget.
  ///
  Locale get locale => Localizations.localeOf(this);

  ///
  /// Returns an instance of [MediaQueryData]
  /// which can be use to get information about the screen
  ///
  /// If there is no [MediaQuery] in scope, then this will throw an exception.
  ///
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ///
  /// The size of the media in logical pixels (e.g, the size of the screen).
  /// This is not the same as screenSize in pixels.
  ///
  /// If you need this to be in pixels you can multiply it by [mediaQuery.devicePixelRatio]
  /// Or use the [window] object from [dart:ui]
  ///
  Size get screenSize => this.mediaQuery.size;

  ///
  /// The parts of the display that are partially obscured by system UI
  /// typically by the hardware display "notches" or the system status bar.
  ///
  /// useful for example if you need to know the size of the status bar in android
  ///
  EdgeInsets get screenPadding => this.mediaQuery.padding;

  ///
  /// Returns The state from the closest instance of this class that encloses the given context.
  ///
  /// It is used for routing in flutter
  ///
  NavigatorState get navigator => Navigator.of(this);

  ///
  /// Pushes the built widget to the screen using the material fade in animation
  ///
  /// Will return a value when the built widget calls [pop]
  ///
  Future<T?> push<T>(WidgetBuilder builder) {
    return this.navigator.push<T>(MaterialPageRoute(builder: builder));
  }

  ///
  /// Removes the top most Widget in the navigator's stack
  ///
  /// Will return the [result] to the caller of [push]
  ///
  void pop<T>([T? result]) => this.navigator.pop<T>(result);

  ///
  /// Returns The state from the closest instance of this class that encloses the given context.
  ///
  /// It is used for showing widgets on top of everything.
  ///
  OverlayState? get overlay => Overlay.of(this);

  ///
  /// Insert the given widget into the overlay.
  /// The newly inserted widget will always be at the top.
  ///
  OverlayEntry addOverlay(WidgetBuilder builder) {
    var entry = OverlayEntry(builder: builder);
    this.overlay?.insert(entry);
    return entry;
  }

  ///
  /// Returns the closest instance of [ScaffoldState] in the widget tree,
  /// which can be use to get information about that scaffold.
  ///
  /// If there is no [Scaffold] in scope, then this will throw an exception.
  ///
  ScaffoldState get scaffold => Scaffold.of(this);

  ///
  /// Shows a [SnackBar] at the bottom of the scaffold.
  ///
  /// If you call this function too quickly, the new snackbar is added to a
  /// queue and displayed when the current one disappears.
  ///
  void showSnackBar(SnackBar snackbar) => this.scaffold.showSnackBar(snackbar);

  @Deprecated('use [showSnackBar] instead')
  void showSnackbar(SnackBar snackbar) => this.showSnackbar(snackbar);

  ///
  /// The data from the closest [Theme] instance that encloses the given
  /// context.
  ///
  ThemeData get theme => Theme.of(this);

  ///
  /// Material design text theme.
  ///
  TextTheme get textTheme => this.theme.textTheme;

  ///
  /// The foreground color for widgets (knobs, text, overscroll edge effect, etc).
  ///
  /// Accent color is also known as the secondary color.
  ///
  Color get accentColor => this.theme.accentColor;

  ///
  /// The background color for major parts of the app (toolbars, tab bars, etc).
  ///
  Color get primaryColor => this.theme.primaryColor;

  ///
  /// A color that contrasts with the [primaryColor].
  ///
  Color get backgroundColor => this.theme.backgroundColor;

  ///
  /// The default color of [MaterialType.canvas] [Material].
  ///
  Color get canvasColor => this.theme.canvasColor;
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
}
