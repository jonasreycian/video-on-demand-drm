import 'package:flutter/material.dart';
import 'package:aq_prime/assets.dart';
import 'package:aq_prime/models/models.dart';

final Content sintelContent = Content(
  name: 'Sintel',
  imageUrl: Assets.sintel,
  titleImageUrl: Assets.sintelTitle,
  videoUrl: Assets.sintelVideoUrl,
);

final List<Content> previews = const [
  Content(
    name: 'Avatar The Last Airbender',
    imageUrl: Assets.atla,
    color: Colors.orange,
    titleImageUrl: Assets.atlaTitle,
  ),
  Content(
    name: 'The Crown',
    imageUrl: Assets.crown,
    color: Colors.red,
    titleImageUrl: Assets.crownTitle,
  ),
  Content(
    name: 'The Umbrella Academy',
    imageUrl: Assets.umbrellaAcademy,
    color: Colors.yellow,
    titleImageUrl: Assets.umbrellaAcademyTitle,
  ),
  Content(
    name: 'Carole and Tuesday',
    imageUrl: Assets.caroleAndTuesday,
    color: Colors.lightBlueAccent,
    titleImageUrl: Assets.caroleAndTuesdayTitle,
  ),
  Content(
    name: 'Black Mirror',
    imageUrl: Assets.blackMirror,
    color: Colors.green,
    titleImageUrl: Assets.blackMirrorTitle,
  ),
  Content(
    name: 'Avatar The Last Airbender',
    imageUrl: Assets.atla,
    color: Colors.orange,
    titleImageUrl: Assets.atlaTitle,
  ),
  Content(
    name: 'The Crown',
    imageUrl: Assets.crown,
    color: Colors.red,
    titleImageUrl: Assets.crownTitle,
  ),
  Content(
    name: 'The Umbrella Academy',
    imageUrl: Assets.umbrellaAcademy,
    color: Colors.yellow,
    titleImageUrl: Assets.umbrellaAcademyTitle,
  ),
  Content(
    name: 'Carole and Tuesday',
    imageUrl: Assets.caroleAndTuesday,
    color: Colors.lightBlueAccent,
    titleImageUrl: Assets.caroleAndTuesdayTitle,
  ),
  Content(
    name: 'Black Mirror',
    imageUrl: Assets.blackMirror,
    color: Colors.green,
    titleImageUrl: Assets.blackMirrorTitle,
  ),
];

List<Content> myList = const [
  Content(
    name: 'Violet Evergarden',
    imageUrl: Assets.violetEvergarden,
    rate: '8.5',
    releaseYear: '2018',
    accessibility: 'TV-14',
    type: FilmType.anime,
    runTime: Duration(hours: 1, minutes: 45),
    genre: ['Animation', 'Drama', 'Fantasy', 'Romance', 'Sci-Fi'],
    director: Person(fullName: 'Toshiko Sawada', imageUrl: 'https://m.media-amazon.com/images/M/MV5BNDgxY2UxYTYtOWY5Ni00MzJkLWE5ZDItOWNiYmQ0MWVhNmMwXkEyXkFqcGdeQXVyMzM4MjM0Nzg@._V1_UX214_CR0,0,214,317_AL_.jpg'),
    cast: [
      Person(fullName: 'Yui Ishikaawa', castName: 'Violet Evergardend', imageUrl: 'https://m.media-amazon.com/images/M/MV5BNzdlOTdlNDEtZTViMy00NGQyLTg2YWQtYWY1YWUzY2E2MjFhXkEyXkFqcGdeQXVyMTExNDQ2MTI@._V1_UY317_CR5,0,214,317_AL_.jpg'),
      Person(fullName: 'Kyle MacCarley', castName: 'Claudia Hodgins', imageUrl: 'https://m.media-amazon.com/images/M/MV5BY2YxZGMxMjItODc3Ny00OGFmLTg5NGEtYjBiMmI4NjQ1OTllXkEyXkFqcGdeQXVyNDg2MzAzNw@@._V1_UY317_CR20,0,214,317_AL_.jpg'),
      Person(fullName: 'Reba Buhr', castName: 'Cattleya Baudelaire', imageUrl: 'https://m.media-amazon.com/images/M/MV5BYzYyMTMzOTgtM2I2YS00ZDZlLWIyYzgtZTI5MTA4ZmZhOWQwXkEyXkFqcGdeQXVyMjY5MDMzMzM@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(fullName: 'Christine Marie Cabanos', castName: 'Erica Brown', imageUrl: 'https://m.media-amazon.com/images/M/MV5BMTJjNDljOWEtY2Q0OS00ZWQ1LTljZmYtOWY0NTM3NGU0NzdhXkEyXkFqcGdeQXVyODY5Nzc4Njc@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(fullName: 'Daisuke Namikawa', castName: 'Gilber Baugainvillea', imageUrl: 'https://m.media-amazon.com/images/M/MV5BMWVhZjEzZjUtZWU1Ni00NDAyLTk3OGQtZWUyMWE3Mzc0OTJlXkEyXkFqcGdeQXVyNDQxNjcxNQ@@._V1_UY317_CR51,0,214,317_AL_.jpg'),
    ],
    description:
        'After four long years of conflict, The Great War has finally come to an end. Caught up in the bloodshed was Violet Evergarden, a young girl raised to be a deadly weapon on the battlefield. Hospitalized and maimed in a bloody skirmish during the War\'s final leg, she was left with only words from the person she held dearest, but no understanding of their meaning. Recovering from her wounds, Violet starts a new life working at CH Postal Services. There, she witnesses by pure chance the work of an "Auto Memory Doll", amanuenses that transcribe people\'s thoughts and feelings into words on paper. Moved by the notion, Violet begins work as an Auto Memory Doll, a trade that will take her on an adventure, one that will reshape the lives of her clients and hopefully lead to self-discovery.',
  ),
  Content(
    name: 'How to Sell Drugs Online (Fast)',
    imageUrl: Assets.htsdof,
    rate: '7.9',
    releaseYear: '2019',
    accessibility: 'TV-MA',
    type: FilmType.series,
    runTime: Duration(minutes: 30),
    genre: ['Comedy', 'Crime', 'Drama', 'Romance'],
    director: Person(fullName: 'Langston Uibel', imageUrl: 'https://m.media-amazon.com/images/M/MV5BZDYzNzJkOTItMzY5Yi00MzY3LWE5M2MtYWQ3NWJhN2IwZTk0XkEyXkFqcGdeQXVyMjk1MTEwMjY@._V1_UY317_CR19,0,214,317_AL_.jpg'),
    cast: [
      Person(fullName: 'Maximillan Mundt', castName: 'Morits Zimmermann', imageUrl: 'https://m.media-amazon.com/images/M/MV5BMmNiMWZlYTMtY2IxMS00OWE2LWE4MDktMjgyMTFhMWFmYWQ1XkEyXkFqcGdeQXVyMTA1ODE4OTYw._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(fullName: 'Markoesa Hammer', castName: 'Marlene', imageUrl: 'https://m.media-amazon.com/images/M/MV5BNjE2ZmZmMGYtOTBjYy00NDZiLWE4ZjItZjIyMjAwMWJhYjMzXkEyXkFqcGdeQXVyMTIzNTgzMTI4._V1_UY317_CR20,0,214,317_AL_.jpg'),
      Person(fullName: 'Damian Hardung', castName: 'daniel Riffert', imageUrl: 'https://m.media-amazon.com/images/M/MV5BMTlmNzZlMGQtMzFhYy00NmQwLWI3MTYtYTYxOGVmNGU4MmJiXkEyXkFqcGdeQXVyNTM3MDMyMDQ@._V1_UY317_CR131,0,214,317_AL_.jpg'),
      Person(fullName: 'Maren Kroymann', castName: 'Buba\'s Mother', imageUrl: 'https://m.media-amazon.com/images/M/MV5BMjA4OTc2NTIxM15BMl5BanBnXkFtZTYwNjM1NjEz._V1_UY317_CR39,0,214,317_AL_.jpg'),
      Person(fullName: 'Bjarne Madel', castName: 'Dealer Buba', imageUrl: 'https://m.media-amazon.com/images/M/MV5BZDQ0YmJhZjgtY2I3Ny00MjIzLThmMTEtYzk1Y2YzMjFmNGZhXkEyXkFqcGdeQXVyNTM3MDMyMDQ@._V1_UY317_CR104,0,214,317_AL_.jpg'),
      Person(fullName: 'Micheal Ostrowski', castName: 'Abnor', imageUrl: 'https://m.media-amazon.com/images/M/MV5BYjRiMzUzMTQtNzQwNy00MmViLWJhYzYtMjYwOWNhYjI5NDQ2XkEyXkFqcGdeQXVyMTg1MTIzMjA@._V1_UY317_CR12,0,214,317_AL_.jpg'),
    ],
    description: 'To win back the love of his life, a high school student and his best friend launch Europe\'s largest online drug business from their teenage bedroom.',
  ),
  Content(
    name: 'Kakegurui',
    imageUrl: Assets.kakegurui,
    rate: '7.2',
    releaseYear: '2017',
    accessibility: 'TV-14',
    type: FilmType.anime,
    runTime: Duration(minutes: 48),
    genre: ['Animation', 'Drama', 'Mystery', 'Thriller'],
    director: Person(fullName: 'Langston Uibel', imageUrl: 'https://m.media-amazon.com/images/M/MV5BZDYzNzJkOTItMzY5Yi00MzY3LWE5M2MtYWQ3NWJhN2IwZTk0XkEyXkFqcGdeQXVyMjk1MTEwMjY@._V1_UY317_CR19,0,214,317_AL_.jpg'),
    cast: [
      Person(fullName: 'Saori Hayami', castName: 'Yumeko Jabami', imageUrl: 'https://m.media-amazon.com/images/M/MV5BZDcyYjdmNWEtZTFjOS00MGE4LTkwYTQtMTQ1ZmJkODFmYjg5XkEyXkFqcGdeQXVyNDQxNjcxNQ@@._V1_UY317_CR8,0,214,317_AL_.jpg'),
      Person(fullName: 'Miyuki Sawashiro', castName: 'Kirari MomoBami', imageUrl: 'https://m.media-amazon.com/images/M/MV5BZjBhN2JkNDctMTA5Ni00MjBhLTkxYWQtODcwNDY5MjJjZDE4XkEyXkFqcGdeQXVyNDQxNjcxNQ@@._V1_UY317_CR21,0,214,317_AL_.jpg'),
      Person(fullName: 'Cristina Valenzuela', castName: 'Yuriko Nishinotoun', imageUrl: 'https://m.media-amazon.com/images/M/MV5BNjM3N2Q0MmEtOWM2Mi00NTNjLWJhMTQtNTBlNGI2MDc4M2UyXkEyXkFqcGdeQXVyNjE3OTE2OTI@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(fullName: 'Kira Buckland', castName: 'Mary Saotome', imageUrl: 'https://m.media-amazon.com/images/M/MV5BNjljNTFmNWMtYmQzMS00OWIxLTgyMzEtNzVhMjA0YzliMjQ2XkEyXkFqcGdeQXVyMTExMDczMDgw._V1_UY317_CR20,0,214,317_AL_.jpg'),
      Person(fullName: 'Faey Mata', castName: 'Yumemi Yumemite', imageUrl: 'https://m.media-amazon.com/images/M/MV5BMDgzYWIzNjktYjllYy00YWYyLTlkMTEtZDVkZTA3MTFjY2E0XkEyXkFqcGdeQXVyMjM4NjMxMjc@._V1_UY317_CR27,0,214,317_AL_.jpg'),
      Person(fullName: 'Kayli Milss', castName: 'Runa Yomoziki', imageUrl: 'https://m.media-amazon.com/images/M/MV5BNDYxY2E0OTgtNzIwMC00Yjc4LTkwODAtYjJlZDkzZWRkOWVjXkEyXkFqcGdeQXVyOTMwNjU2MDk@._V1_UY317_CR20,0,214,317_AL_.jpg'),
    ],
    description:
        'Hyakkaou Private Academy. An institution for the privileged with a very peculiar curriculum. You see, when you\'re the sons and daughters of the wealthiest of the wealthy, it\'s not athletic prowess or book smarts that keep you ahead. It\'s reading your opponent, the art of the deal. What better way to hone those skills than with a rigorous curriculum of gambling? At Hyakkaou Private Academy, the winners live like kings, and the losers are put through the wringer, but when Yumeko Jabami enrolls, she\'s gonna teach these kids what a high roller really looks like.',
  ),
  Content(
    name: 'Carole and Tuesday',
    imageUrl: Assets.caroleAndTuesday,
    rate: '7.8',
    releaseYear: '2019',
    accessibility: 'TV-MA',
    type: FilmType.anime,
    runTime: Duration(minutes: 27),
    genre: ['Animation', 'Drama', 'Music'],
    director: Person(fullName: 'Langston Uibel', imageUrl: 'https://m.media-amazon.com/images/M/MV5BZDYzNzJkOTItMzY5Yi00MzY3LWE5M2MtYWQ3NWJhN2IwZTk0XkEyXkFqcGdeQXVyMjk1MTEwMjY@._V1_UY317_CR19,0,214,317_AL_.jpg'),
    cast: [
      Person(fullName: 'Saori Hayami', castName: 'Yumeko Jabami', imageUrl: 'https://m.media-amazon.com/images/M/MV5BZDcyYjdmNWEtZTFjOS00MGE4LTkwYTQtMTQ1ZmJkODFmYjg5XkEyXkFqcGdeQXVyNDQxNjcxNQ@@._V1_UY317_CR8,0,214,317_AL_.jpg'),
      Person(fullName: 'Miyuki Sawashiro', castName: 'Kirari MomoBami', imageUrl: 'https://m.media-amazon.com/images/M/MV5BZjBhN2JkNDctMTA5Ni00MjBhLTkxYWQtODcwNDY5MjJjZDE4XkEyXkFqcGdeQXVyNDQxNjcxNQ@@._V1_UY317_CR21,0,214,317_AL_.jpg'),
      Person(fullName: 'Cristina Valenzuela', castName: 'Yuriko Nishinotoun', imageUrl: 'https://m.media-amazon.com/images/M/MV5BNjM3N2Q0MmEtOWM2Mi00NTNjLWJhMTQtNTBlNGI2MDc4M2UyXkEyXkFqcGdeQXVyNjE3OTE2OTI@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(fullName: 'Kira Buckland', castName: 'Mary Saotome', imageUrl: 'https://m.media-amazon.com/images/M/MV5BNjljNTFmNWMtYmQzMS00OWIxLTgyMzEtNzVhMjA0YzliMjQ2XkEyXkFqcGdeQXVyMTExMDczMDgw._V1_UY317_CR20,0,214,317_AL_.jpg'),
      Person(fullName: 'Faey Mata', castName: 'Yumemi Yumemite', imageUrl: 'https://m.media-amazon.com/images/M/MV5BMDgzYWIzNjktYjllYy00YWYyLTlkMTEtZDVkZTA3MTFjY2E0XkEyXkFqcGdeQXVyMjM4NjMxMjc@._V1_UY317_CR27,0,214,317_AL_.jpg'),
      Person(fullName: 'Kayli Milss', castName: 'Runa Yomoziki', imageUrl: 'https://m.media-amazon.com/images/M/MV5BNDYxY2E0OTgtNzIwMC00Yjc4LTkwODAtYjJlZDkzZWRkOWVjXkEyXkFqcGdeQXVyOTMwNjU2MDk@._V1_UY317_CR20,0,214,317_AL_.jpg'),
    ],
    description: 'Two girls, from different backgrounds but sharing a love for music, meet and change history with their united musical talent.',
  ),
  Content(
    name: 'Black Mirror',
    imageUrl: Assets.blackMirror,
    rate: '8.8',
    releaseYear: '2011',
    accessibility: 'TV-MA',
    type: FilmType.series,
    runTime: Duration(hours: 1, minutes: 33),
    genre: ['Drama', 'Mystery', 'Sci-Fi'],
    director: Person(fullName: 'Langston Uibel', imageUrl: 'https://m.media-amazon.com/images/M/MV5BZDYzNzJkOTItMzY5Yi00MzY3LWE5M2MtYWQ3NWJhN2IwZTk0XkEyXkFqcGdeQXVyMjk1MTEwMjY@._V1_UY317_CR19,0,214,317_AL_.jpg'),
    cast: [
      Person(fullName: 'Daniel Lapaine', castName: 'Dawson', imageUrl: 'https://m.media-amazon.com/images/M/MV5BODcwNjkwNjE3NF5BMl5BanBnXkFtZTgwNjUyODgyNzE@._V1_UY317_CR20,0,214,317_AL_.jpg'),
      Person(fullName: 'Hanna John-Kamen', castName: 'Selma Telse', imageUrl: 'https://m.media-amazon.com/images/M/MV5BZGMwMmNmNWItZWI4Mi00OWY5LThjZmUtMjg2NDcxZDljYjYyXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(fullName: 'Charles Babalola', castName: 'Tusk', imageUrl: 'https://m.media-amazon.com/images/M/MV5BM2JkODdiNWMtMjg3Yi00ZDVjLWIzYTktYjEyYWQ5MGRmMTVjXkEyXkFqcGdeQXVyNTQxMDI2MTI@._V1_UY317_CR20,0,214,317_AL_.jpg'),
      Person(fullName: 'Rory Kinnear', castName: 'Micheal Callow', imageUrl: 'https://m.media-amazon.com/images/M/MV5BMTQwOTMwMDM5OV5BMl5BanBnXkFtZTcwODQ1MDExOA@@._V1_UY317_CR6,0,214,317_AL_.jpg'),
      Person(fullName: 'Lenoar Crichlow', castName: 'Vitoria Skillane', imageUrl: 'https://m.media-amazon.com/images/M/MV5BZmViMGIxNTAtYzQ0ZS00YjJjLTk3NjktY2U4NGI0MzY3YTcyXkEyXkFqcGdeQXVyODUxODg4MjI@._V1_UY317_CR51,0,214,317_AL_.jpg'),
      Person(fullName: 'Bracy Dala Howard', castName: 'Lacie Pound', imageUrl: 'https://m.media-amazon.com/images/M/MV5BNzExZDkyNWItMDYzNS00MGVlLTllZTctMjYyZGE1MmY0MThhXkEyXkFqcGdeQXVyMDA4NzMyOA@@._V1_UY317_CR20,0,214,317_AL_.jpg'),
    ],
    description: 'Set in a world only minutes from our own, "Black Mirror", a UK and USA non-hosted anthology series; unveils how modern technologies can backfire and be used against their makers, every episode set in a slightly different reality with different characters combating different types of technologies.',
  ),
  // Content(name: 'Violet Evergarden', imageUrl: Assets.violetEvergarden),
  // Content(name: 'How to Sell Drugs Online (Fast)', imageUrl: Assets.htsdof),
  // Content(name: 'Kakegurui', imageUrl: Assets.kakegurui),
  // Content(name: 'Carole and Tuesday', imageUrl: Assets.caroleAndTuesday),
  // Content(name: 'Black Mirror', imageUrl: Assets.blackMirror),
];

final List<Content> originals = const [
  Content(
    name: 'Stranger Things',
    imageUrl: Assets.strangerThings,
    rate: '8.7',
    releaseYear: '2016',
    accessibility: 'TV-14',
    type: FilmType.series,
    runTime: Duration(hours: 1, minutes: 33),
    genre: ['Drama', 'Fantasy', 'Horror'],
    director: Person(fullName: 'Langston Uibel', imageUrl: 'https://m.media-amazon.com/images/M/MV5BZDYzNzJkOTItMzY5Yi00MzY3LWE5M2MtYWQ3NWJhN2IwZTk0XkEyXkFqcGdeQXVyMjk1MTEwMjY@._V1_UY317_CR19,0,214,317_AL_.jpg'),
    cast: [
      Person(fullName: 'Daniel Lapaine', castName: 'Dawson', imageUrl: 'https://m.media-amazon.com/images/M/MV5BODcwNjkwNjE3NF5BMl5BanBnXkFtZTgwNjUyODgyNzE@._V1_UY317_CR20,0,214,317_AL_.jpg'),
      Person(fullName: 'Hanna John-Kamen', castName: 'Selma Telse', imageUrl: 'https://m.media-amazon.com/images/M/MV5BZGMwMmNmNWItZWI4Mi00OWY5LThjZmUtMjg2NDcxZDljYjYyXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(fullName: 'Charles Babalola', castName: 'Tusk', imageUrl: 'https://m.media-amazon.com/images/M/MV5BM2JkODdiNWMtMjg3Yi00ZDVjLWIzYTktYjEyYWQ5MGRmMTVjXkEyXkFqcGdeQXVyNTQxMDI2MTI@._V1_UY317_CR20,0,214,317_AL_.jpg'),
      Person(fullName: 'Rory Kinnear', castName: 'Micheal Callow', imageUrl: 'https://m.media-amazon.com/images/M/MV5BMTQwOTMwMDM5OV5BMl5BanBnXkFtZTcwODQ1MDExOA@@._V1_UY317_CR6,0,214,317_AL_.jpg'),
      Person(fullName: 'Lenoar Crichlow', castName: 'Vitoria Skillane', imageUrl: 'https://m.media-amazon.com/images/M/MV5BZmViMGIxNTAtYzQ0ZS00YjJjLTk3NjktY2U4NGI0MzY3YTcyXkEyXkFqcGdeQXVyODUxODg4MjI@._V1_UY317_CR51,0,214,317_AL_.jpg'),
      Person(fullName: 'Bracy Dala Howard', castName: 'Lacie Pound', imageUrl: 'https://m.media-amazon.com/images/M/MV5BNzExZDkyNWItMDYzNS00MGVlLTllZTctMjYyZGE1MmY0MThhXkEyXkFqcGdeQXVyMDA4NzMyOA@@._V1_UY317_CR20,0,214,317_AL_.jpg'),
    ],
    description:
        'In a small town where everyone knows everyone, a peculiar incident starts a chain of events that leads to the disappearance of a child, which begins to tear at the fabric of an otherwise peaceful community. Dark government agencies and seemingly malevolent supernatural forces converge on the town, while a few of the locals begin to understand that there\'s more going on than meets the eye',
  ),
  Content(name: 'The Witcher', imageUrl: Assets.witcher),
  Content(name: 'The Umbrella Academy', imageUrl: Assets.umbrellaAcademy),
  Content(name: '13 Reasons Why', imageUrl: Assets.thirteenReasonsWhy),
  Content(name: 'The End of the F***ing World', imageUrl: Assets.teotfw),
  // Content(name: 'Stranger Things', imageUrl: Assets.strangerThings),
  // Content(name: 'The Witcher', imageUrl: Assets.witcher),
  // Content(name: 'The Umbrella Academy', imageUrl: Assets.umbrellaAcademy),
  // Content(name: '13 Reasons Why', imageUrl: Assets.thirteenReasonsWhy),
  // Content(name: 'The End of the F***ing World', imageUrl: Assets.teotfw),
];

List<Content> trending = const [
  Content(name: 'Explained', imageUrl: Assets.explained),
  Content(name: 'Avatar The Last Airbender', imageUrl: Assets.atla),
  Content(name: 'Tiger King', imageUrl: Assets.tigerKing),
  Content(name: 'The Crown', imageUrl: Assets.crown),
  Content(name: 'Dogs', imageUrl: Assets.dogs),
  Content(name: 'Explained', imageUrl: Assets.explained),
  Content(name: 'Avatar The Last Airbender', imageUrl: Assets.atla),
  Content(name: 'Tiger King', imageUrl: Assets.tigerKing),
  Content(name: 'The Crown', imageUrl: Assets.crown),
  Content(name: 'Dogs', imageUrl: Assets.dogs),
];

List combine() {
  return [...myList, ...trending];
}

List<Content> combine1() {
  return [...trending, ...myList];
}
