//import 'authentication_test.dart' as authentication;
//import 'info_for_ns_test.dart' as info_for_ns;
import 'embeddings_test.dart' as embeddings;
import 'patch_test.dart' as patch;
import 'surrealdb_js_test.dart' as surrealdb_js;
import 'transaction_test.dart' as transaction;

void main() {
  //authentication.main();
  //info_for_ns.main();
  patch.main();
  surrealdb_js.main();
  transaction.main();
  embeddings.main();
}
