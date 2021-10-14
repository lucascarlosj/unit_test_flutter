import 'package:unit_test/item.dart';
import 'package:unit_test/item_repository.dart';

class ItemService {
  IItemRepository repository;

  ItemService({
    required this.repository,
  });

  Future<List<Item>> buscarTodos() => repository.buscarTodos();
  List<Item> buscarTodosSync() => repository.buscarTodosSync();
  Item buscarPorId(int id) => repository.buscarPorId(id);
}
