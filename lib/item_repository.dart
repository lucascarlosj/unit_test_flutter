import 'package:unit_test/item.dart';

abstract class IItemRepository {
  Future<List<Item>> buscarTodos();
  List<Item> buscarTodosSync();
  Item buscarPorId(int id);
}

class ItemRepository implements IItemRepository {
  @override
  Item buscarPorId(int id) {
    return Item(name: 'Iphone', preco: 10000);
  }

  @override
  Future<List<Item>> buscarTodos() async {
    final items = [
      Item(name: 'Android', preco: 2000),
      Item(name: 'Iphone', preco: 10000),
      Item(name: 'Carregador', preco: 200)
    ];

    await Future.delayed(Duration(seconds: 1));
    return items;
  }

  @override
  List<Item> buscarTodosSync() {
    final items = [
      Item(name: 'Android', preco: 2000),
      Item(name: 'Iphone', preco: 10000),
      Item(name: 'Carregador', preco: 200)
    ];

    return items;
  }
}
