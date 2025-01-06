
# echo "Running tests and setup coverage...🚀"
# melos  unit_test_and_coverage
# lcov --remove coverage/lcov.info 'lib/util/assets/*' 'lib/localization/*' 'lib/infrastructure/isar/**/collection/*' 'lib/**/*.g.dart' 'lib/domain/repository/**/entity/*.dart' -o coverage/filtered.lcov.info
# genhtml coverage/filtered.lcov.info -o coverage/html --ignore-errors source --synthesize-missing
# open coverage/html/index.html