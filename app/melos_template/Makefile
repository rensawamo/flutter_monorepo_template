.PHONY: pod
pod:
	cd ios && pod update && pod install

.PHONY: splash
splash:
	dart run flutter_native_splash:remove && dart run flutter_native_splash:create

.PHONY: splash_remove
splash_remove:
	dart run flutter_native_splash:remove

.PHONY: icon
icon:
	dart run flutter_launcher_icons

.PHONY: release_build_aab
release_build_aab:
	flutter build appbundle --release --obfuscate --split-debug-info=obfuscate/android --dart-define-from-file=dart_defines/prod.env

.PHONY: release_build_ios
release_build_ios:
	flutter build ipa --release --obfuscate --split-debug-info=obfuscate/ios --dart-define-from-file=dart_defines/prod.env