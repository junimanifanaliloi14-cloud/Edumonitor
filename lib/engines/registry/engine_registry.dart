import '../contract/subject_engine.dart';
import '../biology/biology_engine.dart';
import '../chemistry/chemistry_engine.dart';
import '../generic/generic_engine.dart';
import '../math/math_engine.dart';
import '../physics/physics_engine.dart';

/// Holds all registered engines. Engines cannot access repositories directly.
class EngineRegistry {
  EngineRegistry(List<SubjectEngine> engines)
    : _engines = List<SubjectEngine>.unmodifiable(engines);

  final List<SubjectEngine> _engines;

  List<SubjectEngine> get all => _engines;

  SubjectEngine? bySubjectId(String subjectId) {
    for (final engine in _engines) {
      if (engine.subjectId == subjectId) return engine;
    }
    return null;
  }
}

/// The default registry with the five MVP engines registered.
/// Generic is the only one intended to be fully implemented in MVP.
EngineRegistry buildDefaultRegistry() {
  return EngineRegistry(const <SubjectEngine>[
    GenericEngine(),
    MathEngine(),
    PhysicsEngine(),
    BiologyEngine(),
    ChemistryEngine(),
  ]);
}
