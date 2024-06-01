# ShowTrack

Informações e calendário de suas séries favoritas.

## Description

Com o ShowTrack você pode pesquisar por séries, salvar suas favoritas e obter informações detalhadas de cada show como: sinopse, status, último episódio, próximo episódio, programação, emissora/plataforma.

O ShowTrack é desenvolvido em Flutter pensado para iOS e Android. As principais bibliotecas utilizadas são BLoC, Hive, Dio, Retrofit e GetIt.

O rascunho inicial das telas podem ser vizualizados no [Figma](https://www.figma.com/design/qDBpQpWgKol5NZNwr7eD3c/ShowTrack?m=dev&node-id=0-1&t=ltkJAicy7AAJmT2A-1) também de minha autoria. Para essa versão desenvolvida não foi considerado o fluxo de autenticação.

Para pesquisa de séries e suas informações é utilizado a [TV Maze API](https://www.tvmaze.com/api). Já para o armazenamento local é utilizado o [Hive](https://pub.dev/packages/hive).

## Features

- Pesquisar: pesquise séries do mundo todo em qualquer idioma disponível no TV Maze.
- Salvar: salve uma série ou mais que então será exibida na tela inicial com persistência de dados.
- Remover: remova uma série adicionada a qualquer momento, podendo também adicioná-la novamente.
- Ver informações resumidas: visualize informações de suas séries salvas no Ínicio como status, programação e mais.
- Ver informações detalhadas: clique em uma série para obter mais informações como sinopse, próximo episódio e mais.

## Getting Started

### Installing

* Siga a documentação oficial do [Flutter](https://flutter-ko.dev/get-started/install) para seu sistema.

### Prerequisites

Antes de executar o projeto, rode os seguintes comandos
```
flutter pub get
```
```
flutter run build_runner build
```

## Authors

> [Rafhaela Marques](https://www.linkedin.com/in/rafhaela-marques/)

## Version History

* 1.0.0
    * Initial Release