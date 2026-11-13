import 'package:edumonitor/core/result/result.dart';
import 'package:edumonitor/engines/contract/capability.dart';
import 'package:edumonitor/engines/contract/generation.dart';
import 'package:edumonitor/engines/registry/engine_registry.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final registry = buildDefaultRegistry();

  group('Engine registry', () {
    test('contains exactly five engines', () {
      expect(registry.all.length, 5);
    });

    test('subjectIds are the expected five', () {
      final ids = registry.all.map((e) => e.subjectId).toSet();
      expect(ids, <String>{
        'generic',
        'math',
        'physics',
        'biology',
        'chemistry',
      });
    });

    test('every engine has non-empty subjectId and semver engineVersion', () {
      final semver = RegExp(r'^\d+\.\d+\.\d+$');
      for (final engine in registry.all) {
        expect(
          engine.subjectId,
          isNotEmpty,
          reason: 'engine missing subjectId',
        );
        expect(
          semver.hasMatch(engine.engineVersion),
          isTrue,
          reason:
              'engine ${engine.subjectId} version=${engine.engineVersion} is not semver',
        );
      }
    });

    test('every engine declares Compatibility', () {
      for (final engine in registry.all) {
        final c = engine.compatibility;
        expect(c.minAppVersion, isNotEmpty);
        expect(c.maxAppVersion, isNotEmpty);
        expect(c.questionSchemaVersion, greaterThanOrEqualTo(1));
      }
    });

    test('every engine returns EngineHealth', () {
      for (final engine in registry.all) {
        final h = engine.healthCheck();
        expect(h, isA<EngineHealth>());
      }
    });

    test('every engine returns Result from generate()', () async {
      for (final engine in registry.all) {
        final r = await engine.generate(
          GenerationRequest(
            subjectId: engine.subjectId,
            knowledgeIds: const <String>[],
            targetCount: 1,
            seed: 42,
          ),
        );
        expect(
          r,
          isA<Result<GenerationResult, dynamic>>(),
          reason: 'engine ${engine.subjectId} generate() not Result',
        );
      }
    });
  });
}
