import 'package:test/scaffolding.dart';

void main() {

  test('Teste sem grupo', (){});
  group('Grupo de Teste', () {
    test('Teste dentro do grupo 1', () {
      //throw Exception();
      
    });
    test('Teste dentro do grupo 2', () {});
    test('Teste dentro do grupo 3', () {});
  });
}
