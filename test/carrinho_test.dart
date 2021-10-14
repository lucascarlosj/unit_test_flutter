import 'package:test/test.dart';
import 'package:unit_test/carrinho.dart';
import 'package:unit_test/item.dart';

void main() {
  group('Carrinho...', () {
    test('Deve calcular o valor total do carrinho', () {
      // PREPARAÇÃO DO TESTE
      final items = [
        Item(name: 'Galaxy J1', preco: 2000),
        Item(name: 'Iphone 12', preco: 10000),
        Item(name: 'Carregador', preco: 200)
      ];

      final carrinho = Carrinho(items: items);

      // AÇÃO / EXECUÇÃO
      var valorTotalCarrinho = carrinho.totalCarrinho();

      // VERIFICAÇÃO

      expect(valorTotalCarrinho, 12200);
    });

    test('Deve calcular o valor total para carrinho vazio', () {
      // PREPARAÇÃO DO TESTE
      final items = <Item>[];

      final carrinho = Carrinho(items: items);

      // AÇÃO / EXECUÇÃO
      var valorTotalCarrinho = carrinho.totalCarrinho();

      // VERIFICAÇÃO

      expect(valorTotalCarrinho, 0);
    });
  });
  group('Carrinho + imposto...', () {
    test('Deve calcular o valor com imposto de 10%', () {
      // PREPARAÇÃO
      final items = [
        Item(name: 'Galaxy J1', preco: 2000),
        Item(name: 'Iphone 12', preco: 10000),
        Item(name: 'Carregador', preco: 200)
      ];

      final carrinho = Carrinho(items: items);

      // AÇÃO / EXECUÇÃO
      var valorTotalComImposto = carrinho.totalCarrinhoImposto();

      expect(valorTotalComImposto, 13420);
    });

    //Se o valor for menor que 5 mil nao cobrar imposto

    test('Deve retornar o valor sem imposto caso seja menor que 5 mil', () {
      final items = [
        Item(name: 'Galaxy J1', preco: 2000),
        Item(name: 'Fone de ouvido', preco: 2900),
      ];

      final carrinho = Carrinho(items: items);

      // AÇÃO / EXECUÇÃO
      var valorTotal = carrinho.totalCarrinhoImposto();

      expect(valorTotal, 4900);
    });

    test('Deve retornar o valor com imposto caso seja igual a 5 mil', () {
      final items = [
        Item(name: 'Galaxy J1', preco: 2000),
        Item(name: 'Fone de ouvido', preco: 3000),
      ];

      final carrinho = Carrinho(items: items);

      // AÇÃO / EXECUÇÃO
      var valorTotal = carrinho.totalCarrinhoImposto();

      expect(valorTotal, 5500);
    });

    // Se o valor for maior que 20 mil cobrar o imposto de 20%

    test('Deve retornar o valor com imposto de 20% caso seja maior que 20 mil',
        () {
      final items = [
        Item(name: 'Galaxy J1', preco: 2000),
        Item(name: 'Iphone', preco: 10000),
        Item(name: 'Iphone', preco: 10000),
      ];

      final carrinho = Carrinho(items: items);

      // AÇÃO / EXECUÇÃO
      var valorTotal = carrinho.totalCarrinhoImposto();

      expect(valorTotal, 26400);
    });

    test(
        'Deve retornar o valor com imposto de 10% caso o valor do carrinho seja IGUAL 20.000',
        () {
      final items = [
        Item(name: 'Iphone', preco: 10000),
        Item(name: 'Iphone', preco: 10000),
      ];

      final carrinho = Carrinho(items: items);

      // AÇÃO / EXECUÇÃO
      var valorTotal = carrinho.totalCarrinhoImposto();

      expect(valorTotal, 22000);
    });
  });

  group('Teste de igualdade...', () {
    test('Testando a igualdade 1', () {
      final iphone = Item(name: 'Iphone 12', preco: 10000);
      final items = [
        Item(name: 'Galaxy J1', preco: 2000),
        iphone,
        Item(name: 'Carregador', preco: 200)
      ];

      final carrinho = Carrinho(items: items);

      expect(
          carrinho.items,
          contains(
            iphone,
          ));
    });

    test('Testando a igualdade 2', () {
      final items = [
        Item(name: 'Galaxy J1', preco: 2000),
        Item(name: 'Iphone', preco: 10000),
        Item(name: 'Carregador', preco: 200)
      ];

      final carrinho = Carrinho(items: items);

      expect(
          carrinho.items,
          contains(
            Item(name: 'Iphone', preco: 10000),
          ));
    });

    test('Testando a igualdade por tipo', () {
      final items = [
        Item(name: 'Galaxy J1', preco: 2000),
        Item(name: 'Iphone', preco: 10000),
        Item(name: 'Carregador', preco: 200)
      ];

      final carrinho = Carrinho(items: items);

      expect(carrinho.items, isA<List<Item>>());
    });

    test('Testando de Excpetions', () {
      final items = <Item>[];

      final carrinho = Carrinho(items: items);

      // Tirando os () atribui a variavel o metodo
      var call = carrinho.totalCarrinho;

      expect(() => call(), throwsException); // throwsException verifica se é uma exception
    });

    test('Testando de Excpetions Customizada', () {
      final items = <Item>[];

      final carrinho = Carrinho(items: items);

      // Tirando os () atribui a variavel o metodo
      var call = carrinho.totalCarrinho;

      expect(() => call(), throwsA(isA<CarrinhoException>())); // throwsException verifica se é uma exception
    });
  });
}