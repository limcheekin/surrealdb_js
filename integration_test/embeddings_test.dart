import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:surrealdb_js/surrealdb_js.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final db = Surreal();
  //Tests run with local SurrealDB instance started with the command below:
  //surreal start memory --log trace --allow-all --auth --user root --pass root
  setUpAll(() async {
    await db.connect('http://127.0.0.1:8000/rpc');
    await db.use(namespace: 'surreal', database: 'surreal');
    await db.signin({'username': 'root', 'password': 'root'});
  });

  final random = Random();
  const count = 384;
  const min = -1.0;
  const max = 1.0;

  testWidgets('embedding test', (WidgetTester tester) async {
    const sql = '''
REMOVE TABLE IF EXISTS embeddings;
DEFINE TABLE embeddings SCHEMALESS;
DEFINE FIELD id ON embeddings TYPE record;
DEFINE FIELD content ON embeddings TYPE string;
DEFINE FIELD embedding ON embeddings TYPE array<float>;
DEFINE FIELD metadata ON embeddings TYPE option<object>;
DEFINE INDEX embeddings_mtree_index ON embeddings
FIELDS embedding MTREE DIMENSION 384 DIST COSINE TYPE F32;
''';

    await db.query(sql);
    const loop = 40;
    const capacity = 40; // default
    for (var i = 0; i < loop; i++) {
      await db.query('''
CREATE ONLY embeddings:$i
CONTENT {"content":"content $i",
"embedding":[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
"metadata":{"source":"source","id":"id"}};''');
    }

    for (var i = 0; i < loop; i++) {
      final randomDecimals = List.generate(count, (_) {
        // Generate a random decimal number between 0.0 and 1.0
        final randomDecimal = random.nextDouble();
        // Scale it to the range [-1.0, 1.0]
        return min + (randomDecimal * (max - min));
      });
      await db.query('''
UPDATE ONLY embeddings:$i MERGE {"content":"(12:10) What do I mean by that? Well, lets just take the analogy of hunger. There are mechanical mechanisms that tell us when we should eat. For instance, you have neurons, nerve cells in your gut that signal how stretched or nonstretched the walls of your stomach are, how full or how empty your gut is, and send that information to the brain to make you feel to some extent hungry or not hungry.",
"embedding":$randomDecimals,
"metadata":{"source":"/tmp/tmp53klj8c6","id":"4945474c420c"}}''');
      if ((i + 1) % capacity == 0) {
        await db.query('REBUILD INDEX embeddings_mtree_index ON embeddings;');
      }
    }
  });
}
