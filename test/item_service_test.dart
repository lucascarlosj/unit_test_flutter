import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:unit_test/item.dart';
import 'package:unit_test/item_repository.dart';
import 'package:unit_test/item_service.dart';

// ! FORMA RUIM DE FAZER MOCK
/* class ItemRepositoryFake implements ItemRepository {
  @override
  Item buscarPorId(int id) {
    return Item(name: 'Test', preco: 10);
  }

  @override
  Future<List<Item>> buscarTodos() async {
  return <Item>[];
  }

  @override
  List<Item> buscarTodosSync() {
    return [];
  }
  
} */

class ItemRepositoryFake extends Mock implements IItemRepository {}

void main() {
  late IItemRepository itemRepository;

// Metodo executado antes do teste
  setUp(() {
    itemRepository = ItemRepositoryFake();
  });

  test('Buscar todos os items', () async {
    // Quando o betodo buscarTodos for invocado ele vai retornar uma list de items vazia
    when(() => itemRepository.buscarTodos()).thenAnswer((_) async => <Item>[]);
    // PREPARAÇÃO
    var service = ItemService(repository: itemRepository);

    final items = await service.buscarTodos();

    expect(items, <Item>[]);
  });

  test('Buscar todos os items retorna Exception', () async {
    // Quando o metodo buscarTodos for invocado ele vai retornar uma list de items vazia
    when(() => itemRepository.buscarTodos()).thenThrow(Exception());
    // PREPARAÇÃO
    var service = ItemService(repository: itemRepository);

    final call = service.buscarTodos;

    expect(() => call(), throwsException);
  });

  test('Buscar todos os items retorna Exception', () async {
    // Quando o metodo buscarTodos for invocado ele vai retornar uma list de items vazia
    when(() => itemRepository.buscarTodos()).thenThrow(Exception());
    // PREPARAÇÃO
    var service = ItemService(repository: itemRepository);

    final call = service.buscarTodos;

    expect(() => call(), throwsException);
  });

  test('Buscar por id', () async {
    // Independente do valor que eu passar como paramentro ele vai retronar a lista
    when(() => itemRepository.buscarPorId(any())).thenReturn(Item(name: 'Item x', preco: 10));
    // PREPARAÇÃO
    var service = ItemService(repository: itemRepository);

    final item = service.buscarPorId(1);

    // Garante que o itemRepository foi chamado
    verify(() => itemRepository.buscarPorId(any())).called(1);

    expect(item, isNotNull);
  });
}
