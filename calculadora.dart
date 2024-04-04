import 'dart:io';

/*
Atividade na linguagem Dart
ALuno: Diego Luiz Rodrigues dos Santos
Data: 05/04/24

Codigo feito para executar dados guardados em uma lista composta por keys e values,
onde cada aluno tem uma nota, e essas notas sao manipuladas através de funcoes
*/
void main() {
  bool sair = false;
  var lista = <String, int>{};

// Menu
  while (!sair) {
    print("\nSelecione uma opção:");
    print("1 - Adicionar aluno");
    print("2 - Visualizar lista de alunos");
    print("3 - Calcular média das notas");
    print("4 - Sair");

    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        adicionarAluno(lista);
        break;
      case '2':
        visualizarListaAlunos(lista);
        break;
      case '3':
        calcularMediaNotas(lista);
        break;
      case '4':
        sair = true;
        break;
      default:
        print("Opção inválida. Por favor, escolha novamente.");
    }
  }
}

// Funcao para adicionar o aluno a lista
void adicionarAluno(Map<String, int> lista) {
  print("\nDigite o nome do aluno:");
  String nome = stdin.readLineSync()!;
  print("Digite a nota do aluno:");
  int nota = int.parse(stdin.readLineSync()!);

  lista[nome] = nota;

  print("Aluno adicionado com sucesso!");
}

//Funcao para visualizar os alunos e notas existentes na lista
void visualizarListaAlunos(Map<String, int> lista) {
  if (lista.isEmpty) {
    print("Lista de alunos está vazia.");
  } else {
    print("\nLista de alunos:");
    lista.forEach((nome, nota) {
      print("$nome: $nota");
    });
  }
}

// Funcao que calcula media, apresenta os aprovados e tambem os reprovados
void calcularMediaNotas(Map<String, int> lista) {
  if (lista.isEmpty) {
    print("Não há alunos na lista para calcular a média.");
  } else {
    int somaNotas = 0;
    lista.values.forEach((nota) {
      somaNotas += nota;
    });

    double media = somaNotas / lista.length;
    print("A média das notas dos alunos é: $media");

    var reprovados = lista.keys.where((nome) => lista[nome]! < 7);
    if (reprovados.isEmpty) {
      print("Não há alunos reprovados.");
    } else {
      print("\nLista de alunos reprovados:");
      reprovados.forEach((nome) {
        print("$nome: ${lista[nome]}");
      });
      var aprovados = lista.keys.where((nome) => lista[nome]! > 7);
      if (aprovados.isEmpty) {
        print("Não há alunos aprovados.");
      } else {
        print("\nLista de alunos aprovados:");
        aprovados.forEach((nome) {
          print("$nome: ${lista[nome]}");
        });
      }
    }
  }
}
