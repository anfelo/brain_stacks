import 'package:brain_stacks/models/models.dart';

class CardStackService {
  List<CardStack>? _currentStacks;

  List<CardStack>? get currentStacks => _currentStacks;

  void setCurrentStacks(List<CardStack> stacks) {
    _currentStacks = stacks;
  }

  CardStack? getNextStack(CardStack prev) {
    if (_currentStacks != null) {
      var prevIndex = _currentStacks!.indexOf(prev);
      return prevIndex >= 0 && prevIndex + 1 < _currentStacks!.length
          ? _currentStacks![prevIndex + 1]
          : null;
    }
    return null;
  }
}
