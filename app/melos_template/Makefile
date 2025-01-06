
.PHONY: upgrade
upgrade:
	flutter pub upgrade --major-versions

.PHONY: splash
splash:
	flutter pub run flutter_native_splash:create

.PHONY: e2e
e2e:
	patrol test -t  integration_test/runner_test.dart --dart-define-from-file=dart_defines/prod.env --coverage --verbose

.PHONY: e2e_build
e2e_build:
	patrol build android integration_test/runner_test.dart --dart-define-from-file=dart_defines/prod.env


.PHONY: icon
icon:
	flutter pub run flutter_launcher_icons

.PHONY: release_build_android
release_build_android:
	flutter build apk --release  --obfuscate --split-debug-info=obfuscate/android --dart-define=flavor=prod

.PHONY: release_build_ios
release_build_ios:
	flutter build ipa --release --obfuscate --split-debug-info=obfuscate/ios --dart-define=flavor=prod