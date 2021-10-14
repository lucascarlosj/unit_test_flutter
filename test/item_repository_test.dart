import 'package:test/test.dart';
import 'package:unit_test/item.dart';
import 'package:unit_test/item_repository.dart';

void main() {
  test('Buscar todos asyncrono forma 1 ', () async {
    // PREPARAÇÃO
    var repository = ItemRepository();

    //AÇÃO / EXECUÇÃO
    var items = await repository.buscarTodos();

    //VERIFICAÇÃO
    expect(items, isNotEmpty);
  });

  test('Buscar todos asyncrono forma 2 ', () {
    // PREPARAÇÃO
    var repository = ItemRepository();

    //AÇÃO / EXECUÇÃO
    var buscarTodos = repository.buscarTodos;

    //VERIFICAÇÃO
    expect(buscarTodos(), completion(isNotEmpty));
  });

  test('Buscar item por id ', () {
    // PREPARAÇÃO
    var repository = ItemRepository();

    //AÇÃO / EXECUÇÃO
    var item = repository.buscarPorId(1);

    //VERIFICAÇÃO
    expect(
      item,
      allOf([isNotNull, Item(name: 'Iphone', preco: 10000)]),
    );
  });
}
