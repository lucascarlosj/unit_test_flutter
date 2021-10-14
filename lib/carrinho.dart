import 'package:unit_test/item.dart';

class Carrinho {
  List<Item> items;

  Carrinho({
    required this.items,
  });

  double totalCarrinho() {

    if (items.isEmpty) {
      throw CarrinhoException();
    }

    return items.fold(0, (totalValue, item) => totalValue += item.preco);
  }

  double totalCarrinhoImposto() {
    var valorTotal = totalCarrinho();
    var imposto = 0.10;

    if (valorTotal < 5000) {
      return valorTotal;
    } else if (valorTotal > 20000) {
      imposto = 0.20;
    }

    valorTotal += (valorTotal * imposto);

    return valorTotal;
  }
}


class CarrinhoException implements Exception {

  
}
