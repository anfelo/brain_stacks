import 'package:brain_stacks/models/models.dart';
import 'package:brain_stacks/services/services.dart';

class Global {
  // App Data
  static final String title = 'Brain Stacks';

  // Data Models
  static final Map models = {
    Topic: (data) => Topic.fromMap(data),
  };

  // Firestore References for Writes
  static final Collection<Topic> topicsRef = Collection<Topic>(path: 'topics');
}
