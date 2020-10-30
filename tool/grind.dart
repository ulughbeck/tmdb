// ignore_for_file: avoid_print
// ignore_for_file: unawaited_futures
// ignore_for_file: unnecessary_raw_strings

import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'package:grinder/grinder.dart';

String get flutter => io.Platform.isWindows ? r'flutter.bat' : r'flutter';

void main(List<String> args) => grind(args);

//
// Utils
//

@DefaultTask('Update local pub')
Future<void> pubGet() => _logProcessOutput(
      flutter,
      <String>['pub', 'get'],
    );

@Task('Run all tests')
Future<void> test() => _logProcessOutput(
      flutter,
      <String>['test'],
    );

@Task('Clean cache and build files')
Future<void> clean() => _logProcessOutput(
      flutter,
      <String>['packages', 'run', 'build_runner', 'clean'],
    ).whenComplete(() => _logProcessOutput(
          flutter,
          <String>['clean'],
        ));

@Task('Generate localisations from remote Google Sheet')
Future<void> genLocales() async {
  // final args = context.invocation.arguments;
  // final gsheet = args.getOption('gsheet') ??
  //     '1k9_7MPzZAJd70fzfCoUzDsvmMZZQsJMGZ35fv4Mdvgo';

  // final result = await LocalisationGen.generateLocalisationFiles(
  //   pathToSave: 'assets/locale/',
  //   pathToCredentials: 'assets/res/credentials.json',
  //   spreadsheetId: gsheet,
  // );
}

@Depends(pubGet)
@Task('Generate launcher icons for iOS & Android')
Future<void> genLauncherIcons() => _logProcessOutput(
      flutter,
      <String>[
        'pub',
        'run',
        'build_runner',
        'flutter_launcher_icons:main',
      ],
    );

//
// Run
//

@Task('Launch web debug')
Future<void> runDebugWeb() => _logProcessOutput(
      flutter,
      <String>[
        'run',
        '-d',
        'chrome',
        '--debug',
        '--web-hostname',
        'localhost',
        '--web-port',
        '5000'
      ],
    );

@Task('Launch web release')
Future<void> runReleaseWeb() => _logProcessOutput(
      flutter,
      <String>[
        'run',
        '-d',
        'chrome',
        '--debug',
        '--web-hostname',
        'localhost',
        '--web-port',
        '5000'
      ],
    );

@Task('Launch android/ios debug')
Future<void> runDebug() => _logProcessOutput(
      flutter,
      <String>[
        'run',
        '--debug',
      ],
    );

@Task('Launch android/ios release')
Future<void> runRelease() => _logProcessOutput(
      flutter,
      <String>[
        'run',
        '--release',
      ],
    );

//
// Build
//

@Task('Build release app for all platform')
@Depends(clean, pubGet, cgRun, test)
Future<void> build() => Future.wait(
      <Future<void>>[
        buildAndroid(),
        buildIos(),
        buildWeb(),
      ],
    );

@Task('Build android release')
Future<void> buildAndroid() => _logProcessOutput(
      flutter,
      <String>[
        'build',
        'appbundle',
        '--target-platform',
        'android-arm,android-arm64,android-x64',
        '--release',
        '--analyze-size'
      ],
    );

@Task('Build ios release')
Future<void> buildIos() => _logProcessOutput(
      flutter,
      <String>[
        'build',
        'ios',
        '--no-pub',
        '--no-codesign',
        '--release',
        '--analyze-size'
      ],
    );

@Task('Build web release')
Future<void> buildWeb() => _logProcessOutput(
      flutter,
      <String>['build', 'web', '--release'],
    );

//
// Code generation
//

@Depends(pubGet)
@Task('Run build_runner code generation once')
Future<void> cgRun() => _logProcessOutput(
      flutter,
      <String>[
        'pub',
        'run',
        'build_runner',
        'build',
        '--delete-conflicting-outputs'
      ],
    );

@Depends(pubGet)
@Task('Run build_runner code generation and watch')
Future<void> cgWatch() => _logProcessOutput(
      flutter,
      <String>[
        'pub',
        'run',
        'build_runner',
        'watch',
      ],
    );

/// Execute comand with arguments
Future<void> _logProcessOutput(String executable, List<String> args) async {
  final process = await io.Process.start(
    executable,
    args,
  );
  process.stdout.forEach((message) {
    log(utf8.decode(message));
  });
  process.stderr.forEach((message) {
    log('\x1B[31m${utf8.decode(message)}\x1B[0m');
  });
}
