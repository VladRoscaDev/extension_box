#import "ExtensionBoxPlugin.h"
#if __has_include(<extension_box/extension_box-Swift.h>)
#import <extension_box/extension_box-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "extension_box-Swift.h"
#endif

@implementation ExtensionBoxPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftExtensionBoxPlugin registerWithRegistrar:registrar];
}
@end
