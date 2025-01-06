echo "Dependencies install... 🚀"
brew tap leoafarias/fvm
brew install fvm
fvm install --setup
dart pub global activate mason_cli
brew install lcov
dart pub global activate melos
melos bs
echo "Dependencies installed 🚀"

