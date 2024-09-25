name: Flutter CI with secret keys

on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Set up Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.22.2'

      - name: Build the app
        run: |
          flutter pub get
          flutter build apk --release
        env:
          FIREBASE_OPTIONS_API_KEY: ${{ secrets.FIREBASE_OPTIONS_API_KEY }}
          FIREBASE_OPTIONS_APP_ID: ${{ secrets.FIREBASE_OPTIONS_APP_ID }}
