import 'package:flutter/material.dart';

import '../assets.dart';
import '../models/models.dart';

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
    videoUrl:
        'https://d22bamm3lcnbm1.cloudfront.net/745e74be-d9f0-46d7-9547-d843554f6c13/hls/Enchanted.m3u8',
  ),
  Content(
    name: 'The Crown',
    imageUrl: Assets.crown,
    color: Colors.red,
    titleImageUrl: Assets.crownTitle,
    videoUrl:
        'https://d22bamm3lcnbm1.cloudfront.net/92261725-df7e-472c-b165-c9a1688043c4/hls/Home.2015.1080p.WEB-DL.AAC2.0.H264-RARBG.m3u8',
  ),
  Content(
    name: 'The Umbrella Academy',
    imageUrl: Assets.umbrellaAcademy,
    color: Colors.yellow,
    titleImageUrl: Assets.umbrellaAcademyTitle,
    videoUrl:
        'https://storage.googleapis.com/wvmedia/cenc/h264/tears/tears_sd.mpd',
  ),
  Content(
    name: 'Carole and Tuesday',
    imageUrl: Assets.caroleAndTuesday,
    color: Colors.lightBlueAccent,
    titleImageUrl: Assets.caroleAndTuesdayTitle,
    videoUrl:
        'https://storage.googleapis.com/wvmedia/cenc/h264/tears/tears_sd.mpd',
  ),
  Content(
    name: 'Black Mirror',
    imageUrl: Assets.blackMirror,
    color: Colors.green,
    titleImageUrl: Assets.blackMirrorTitle,
    videoUrl: 'http://cdn.theoplayer.com/video/elephants-dream/playlist.m3u8',
  ),
  Content(
    name: 'Avatar The Last Airbender',
    imageUrl: Assets.atla,
    color: Colors.orange,
    titleImageUrl: Assets.atlaTitle,
    videoUrl: 'http://cdn.theoplayer.com/video/elephants-dream/playlist.m3u8',
  ),
  Content(
    name: 'The Crown',
    imageUrl: Assets.crown,
    color: Colors.red,
    titleImageUrl: Assets.crownTitle,
    videoUrl: 'http://cdn.theoplayer.com/video/elephants-dream/playlist.m3u8',
  ),
  Content(
    name: 'The Umbrella Academy',
    imageUrl: Assets.umbrellaAcademy,
    color: Colors.yellow,
    titleImageUrl: Assets.umbrellaAcademyTitle,
    videoUrl: "http://www.exit109.com/~dnn/clips/RW20seconds_1.mp4",
  ),
  Content(
    name: 'Carole and Tuesday',
    imageUrl: Assets.caroleAndTuesday,
    color: Colors.lightBlueAccent,
    titleImageUrl: Assets.caroleAndTuesdayTitle,
    videoUrl: "http://www.exit109.com/~dnn/clips/RW20seconds_1.mp4",
  ),
  Content(
    name: 'Black Mirror',
    imageUrl: Assets.blackMirror,
    color: Colors.green,
    titleImageUrl: Assets.blackMirrorTitle,
    videoUrl: "http://www.exit109.com/~dnn/clips/RW20seconds_1.mp4",
  ),
];

List<Content> myList = const [
  Content(
    name: 'Violet Evergarden',
    imageUrl: Assets.violetEvergarden,
    videoUrl: "http://www.exit109.com/~dnn/clips/RW20seconds_1.mp4",
    rate: '8.5',
    releaseYear: '2018',
    accessibility: 'TV-14',
    type: FilmType.anime,
    runTime: Duration(hours: 1, minutes: 45),
    genre: ['Animation', 'Drama', 'Fantasy', 'Romance', 'Sci-Fi'],
    director: Person(
        fullName: 'Toshiko Sawada',
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BMTA0NjEwMzQxNTdeQTJeQWpwZ15BbWU3MDcwMTk4MzI@._V1_UY317_CR11,0,214,317_AL_.jpg',
        biography:
            'Tony Azzolino was born on October 22, 1980. He is known for Violet Evergarden (2018), Beastars (2019) and Aggretsuko (2018).'),
    cast: [
      Person(
          fullName: 'Yui Ishikaawa',
          castName: 'Violet Evergardend',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNzdlOTdlNDEtZTViMy00NGQyLTg2YWQtYWY1YWUzY2E2MjFhXkEyXkFqcGdeQXVyMTExNDQ2MTI@._V1_UY317_CR5,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Kyle MacCarley',
          castName: 'Claudia Hodgins',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BY2YxZGMxMjItODc3Ny00OGFmLTg5NGEtYjBiMmI4NjQ1OTllXkEyXkFqcGdeQXVyNDg2MzAzNw@@._V1_UY317_CR20,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Reba Buhr',
          castName: 'Cattleya Baudelaire',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BYzYyMTMzOTgtM2I2YS00ZDZlLWIyYzgtZTI5MTA4ZmZhOWQwXkEyXkFqcGdeQXVyMjY5MDMzMzM@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Christine Marie Cabanos',
          castName: 'Erica Brown',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMTJjNDljOWEtY2Q0OS00ZWQ1LTljZmYtOWY0NTM3NGU0NzdhXkEyXkFqcGdeQXVyODY5Nzc4Njc@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Daisuke Namikawa',
          castName: 'Gilber Baugainvillea',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMWVhZjEzZjUtZWU1Ni00NDAyLTk3OGQtZWUyMWE3Mzc0OTJlXkEyXkFqcGdeQXVyNDQxNjcxNQ@@._V1_UY317_CR51,0,214,317_AL_.jpg'),
    ],
    description:
        'After four long years of conflict, The Great War has finally come to an end. Caught up in the bloodshed was Violet Evergarden, a young girl raised to be a deadly weapon on the battlefield. Hospitalized and maimed in a bloody skirmish during the War\'s final leg, she was left with only words from the person she held dearest, but no understanding of their meaning. Recovering from her wounds, Violet starts a new life working at CH Postal Services. There, she witnesses by pure chance the work of an "Auto Memory Doll", amanuenses that transcribe people\'s thoughts and feelings into words on paper. Moved by the notion, Violet begins work as an Auto Memory Doll, a trade that will take her on an adventure, one that will reshape the lives of her clients and hopefully lead to self-discovery.',
    isThumbsUp: false,
  ),
  Content(
    name: 'How to Sell Drugs Online (Fast)',
    imageUrl: Assets.htsdof,
    videoUrl:
        "http://sample.vodobox.com/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8",
    rate: '7.9',
    releaseYear: '2019',
    accessibility: 'TV-MA',
    type: FilmType.series,
    runTime: Duration(minutes: 30),
    genre: ['Comedy', 'Crime', 'Drama', 'Romance'],
    director: Person(
        fullName: 'Langston Uibel',
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BZDYzNzJkOTItMzY5Yi00MzY3LWE5M2MtYWQ3NWJhN2IwZTk0XkEyXkFqcGdeQXVyMjk1MTEwMjY@._V1_UY317_CR19,0,214,317_AL_.jpg',
        biography:
            'Tony Azzolino was born on October 22, 1980. He is known for Violet Evergarden (2018), Beastars (2019) and Aggretsuko (2018).'),
    cast: [
      Person(
          fullName: 'Maximillan Mundt',
          castName: 'Morits Zimmermann',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMmNiMWZlYTMtY2IxMS00OWE2LWE4MDktMjgyMTFhMWFmYWQ1XkEyXkFqcGdeQXVyMTA1ODE4OTYw._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Markoesa Hammer',
          castName: 'Marlene',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNjE2ZmZmMGYtOTBjYy00NDZiLWE4ZjItZjIyMjAwMWJhYjMzXkEyXkFqcGdeQXVyMTIzNTgzMTI4._V1_UY317_CR20,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Damian Hardung',
          castName: 'daniel Riffert',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMTlmNzZlMGQtMzFhYy00NmQwLWI3MTYtYTYxOGVmNGU4MmJiXkEyXkFqcGdeQXVyNTM3MDMyMDQ@._V1_UY317_CR131,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Maren Kroymann',
          castName: 'Buba\'s Mother',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMjA4OTc2NTIxM15BMl5BanBnXkFtZTYwNjM1NjEz._V1_UY317_CR39,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Bjarne Madel',
          castName: 'Dealer Buba',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BZDQ0YmJhZjgtY2I3Ny00MjIzLThmMTEtYzk1Y2YzMjFmNGZhXkEyXkFqcGdeQXVyNTM3MDMyMDQ@._V1_UY317_CR104,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Micheal Ostrowski',
          castName: 'Abnor',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BYjRiMzUzMTQtNzQwNy00MmViLWJhYzYtMjYwOWNhYjI5NDQ2XkEyXkFqcGdeQXVyMTg1MTIzMjA@._V1_UY317_CR12,0,214,317_AL_.jpg'),
    ],
    description:
        'To win back the love of his life, a high school student and his best friend launch Europe\'s largest online drug business from their teenage bedroom.',
  ),
  Content(
    name: 'Kakegurui',
    imageUrl: Assets.kakegurui,
    videoUrl:
        "http://sample.vodobox.com/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8",
    rate: '7.2',
    releaseYear: '2017',
    accessibility: 'TV-14',
    type: FilmType.anime,
    runTime: Duration(minutes: 48),
    genre: ['Animation', 'Drama', 'Mystery', 'Thriller'],
    director: Person(
        fullName: 'Langston Uibel',
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BZDYzNzJkOTItMzY5Yi00MzY3LWE5M2MtYWQ3NWJhN2IwZTk0XkEyXkFqcGdeQXVyMjk1MTEwMjY@._V1_UY317_CR19,0,214,317_AL_.jpg',
        biography:
            'Tony Azzolino was born on October 22, 1980. He is known for Violet Evergarden (2018), Beastars (2019) and Aggretsuko (2018).'),
    cast: [
      Person(
          fullName: 'Saori Hayami',
          castName: 'Yumeko Jabami',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BZDcyYjdmNWEtZTFjOS00MGE4LTkwYTQtMTQ1ZmJkODFmYjg5XkEyXkFqcGdeQXVyNDQxNjcxNQ@@._V1_UY317_CR8,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Miyuki Sawashiro',
          castName: 'Kirari MomoBami',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BZjBhN2JkNDctMTA5Ni00MjBhLTkxYWQtODcwNDY5MjJjZDE4XkEyXkFqcGdeQXVyNDQxNjcxNQ@@._V1_UY317_CR21,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Cristina Valenzuela',
          castName: 'Yuriko Nishinotoun',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNjM3N2Q0MmEtOWM2Mi00NTNjLWJhMTQtNTBlNGI2MDc4M2UyXkEyXkFqcGdeQXVyNjE3OTE2OTI@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Kira Buckland',
          castName: 'Mary Saotome',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNjljNTFmNWMtYmQzMS00OWIxLTgyMzEtNzVhMjA0YzliMjQ2XkEyXkFqcGdeQXVyMTExMDczMDgw._V1_UY317_CR20,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Faey Mata',
          castName: 'Yumemi Yumemite',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMDgzYWIzNjktYjllYy00YWYyLTlkMTEtZDVkZTA3MTFjY2E0XkEyXkFqcGdeQXVyMjM4NjMxMjc@._V1_UY317_CR27,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Kayli Milss',
          castName: 'Runa Yomoziki',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNDYxY2E0OTgtNzIwMC00Yjc4LTkwODAtYjJlZDkzZWRkOWVjXkEyXkFqcGdeQXVyOTMwNjU2MDk@._V1_UY317_CR20,0,214,317_AL_.jpg'),
    ],
    description:
        'Hyakkaou Private Academy. An institution for the privileged with a very peculiar curriculum. You see, when you\'re the sons and daughters of the wealthiest of the wealthy, it\'s not athletic prowess or book smarts that keep you ahead. It\'s reading your opponent, the art of the deal. What better way to hone those skills than with a rigorous curriculum of gambling? At Hyakkaou Private Academy, the winners live like kings, and the losers are put through the wringer, but when Yumeko Jabami enrolls, she\'s gonna teach these kids what a high roller really looks like.',
  ),
  Content(
    name: 'Carole and Tuesday',
    imageUrl: Assets.caroleAndTuesday,
    videoUrl: "https://eng-demo.cablecast.tv/segmented-captions/vod.m3u8",
    rate: '7.8',
    releaseYear: '2019',
    accessibility: 'TV-MA',
    type: FilmType.anime,
    runTime: Duration(minutes: 27),
    genre: ['Animation', 'Drama', 'Music'],
    director: Person(
        fullName: 'Langston Uibel',
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BZDYzNzJkOTItMzY5Yi00MzY3LWE5M2MtYWQ3NWJhN2IwZTk0XkEyXkFqcGdeQXVyMjk1MTEwMjY@._V1_UY317_CR19,0,214,317_AL_.jpg',
        biography:
            'Tony Azzolino was born on October 22, 1980. He is known for Violet Evergarden (2018), Beastars (2019) and Aggretsuko (2018).'),
    cast: [
      Person(
          fullName: 'Saori Hayami',
          castName: 'Yumeko Jabami',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BZDcyYjdmNWEtZTFjOS00MGE4LTkwYTQtMTQ1ZmJkODFmYjg5XkEyXkFqcGdeQXVyNDQxNjcxNQ@@._V1_UY317_CR8,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Miyuki Sawashiro',
          castName: 'Kirari MomoBami',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BZjBhN2JkNDctMTA5Ni00MjBhLTkxYWQtODcwNDY5MjJjZDE4XkEyXkFqcGdeQXVyNDQxNjcxNQ@@._V1_UY317_CR21,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Cristina Valenzuela',
          castName: 'Yuriko Nishinotoun',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNjM3N2Q0MmEtOWM2Mi00NTNjLWJhMTQtNTBlNGI2MDc4M2UyXkEyXkFqcGdeQXVyNjE3OTE2OTI@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Kira Buckland',
          castName: 'Mary Saotome',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNjljNTFmNWMtYmQzMS00OWIxLTgyMzEtNzVhMjA0YzliMjQ2XkEyXkFqcGdeQXVyMTExMDczMDgw._V1_UY317_CR20,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Faey Mata',
          castName: 'Yumemi Yumemite',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMDgzYWIzNjktYjllYy00YWYyLTlkMTEtZDVkZTA3MTFjY2E0XkEyXkFqcGdeQXVyMjM4NjMxMjc@._V1_UY317_CR27,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Kayli Milss',
          castName: 'Runa Yomoziki',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNDYxY2E0OTgtNzIwMC00Yjc4LTkwODAtYjJlZDkzZWRkOWVjXkEyXkFqcGdeQXVyOTMwNjU2MDk@._V1_UY317_CR20,0,214,317_AL_.jpg'),
    ],
    description:
        'Two girls, from different backgrounds but sharing a love for music, meet and change history with their united musical talent.',
  ),
  Content(
    name: 'Black Mirror',
    imageUrl: Assets.blackMirror,
    videoUrl: "https://eng-demo.cablecast.tv/segmented-captions/vod.m3u8",
    rate: '8.8',
    releaseYear: '2011',
    accessibility: 'TV-MA',
    type: FilmType.series,
    runTime: Duration(hours: 1, minutes: 33),
    genre: ['Drama', 'Mystery', 'Sci-Fi'],
    director: Person(
        fullName: 'Langston Uibel',
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BZDYzNzJkOTItMzY5Yi00MzY3LWE5M2MtYWQ3NWJhN2IwZTk0XkEyXkFqcGdeQXVyMjk1MTEwMjY@._V1_UY317_CR19,0,214,317_AL_.jpg',
        biography:
            'Tony Azzolino was born on October 22, 1980. He is known for Violet Evergarden (2018), Beastars (2019) and Aggretsuko (2018).'),
    cast: [
      Person(
          fullName: 'Daniel Lapaine',
          castName: 'Dawson',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BODcwNjkwNjE3NF5BMl5BanBnXkFtZTgwNjUyODgyNzE@._V1_UY317_CR20,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Hanna John-Kamen',
          castName: 'Selma Telse',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BZGMwMmNmNWItZWI4Mi00OWY5LThjZmUtMjg2NDcxZDljYjYyXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Charles Babalola',
          castName: 'Tusk',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BM2JkODdiNWMtMjg3Yi00ZDVjLWIzYTktYjEyYWQ5MGRmMTVjXkEyXkFqcGdeQXVyNTQxMDI2MTI@._V1_UY317_CR20,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Rory Kinnear',
          castName: 'Micheal Callow',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMTQwOTMwMDM5OV5BMl5BanBnXkFtZTcwODQ1MDExOA@@._V1_UY317_CR6,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Lenoar Crichlow',
          castName: 'Vitoria Skillane',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BZmViMGIxNTAtYzQ0ZS00YjJjLTk3NjktY2U4NGI0MzY3YTcyXkEyXkFqcGdeQXVyODUxODg4MjI@._V1_UY317_CR51,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Bracy Dala Howard',
          castName: 'Lacie Pound',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNzExZDkyNWItMDYzNS00MGVlLTllZTctMjYyZGE1MmY0MThhXkEyXkFqcGdeQXVyMDA4NzMyOA@@._V1_UY317_CR20,0,214,317_AL_.jpg'),
    ],
    description:
        'Set in a world only minutes from our own, "Black Mirror", a UK and USA non-hosted anthology series; unveils how modern technologies can backfire and be used against their makers, every episode set in a slightly different reality with different characters combating different types of technologies.',
  ),
];

final List<Content> originals = const [
  Content(
    name: 'Stranger Things',
    imageUrl: Assets.strangerThings,
    videoUrl:
        "https://d22bamm3lcnbm1.cloudfront.net/745e74be-d9f0-46d7-9547-d843554f6c13/hls/Enchanted.m3u8",
    rate: '8.7',
    releaseYear: '2016',
    accessibility: 'TV-14',
    type: FilmType.series,
    runTime: Duration(hours: 1, minutes: 33),
    genre: ['Drama', 'Fantasy', 'Horror'],
    director: Person(
        fullName: 'Langston Uibel',
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BZDYzNzJkOTItMzY5Yi00MzY3LWE5M2MtYWQ3NWJhN2IwZTk0XkEyXkFqcGdeQXVyMjk1MTEwMjY@._V1_UY317_CR19,0,214,317_AL_.jpg',
        biography:
            'Tony Azzolino was born on October 22, 1980. He is known for Violet Evergarden (2018), Beastars (2019) and Aggretsuko (2018).'),
    cast: [
      Person(
          fullName: 'Millie Bobby Brown',
          castName: 'Eleven',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMjA5NzA0NzQzMF5BMl5BanBnXkFtZTgwMTQxNjUzNjM@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Finn Wolfhard',
          castName: 'Mike Wheeler',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BYjlkNTdhNjYtYTFhNy00MTUxLWIwNTgtMTE5NTY5Y2I3MDc0XkEyXkFqcGdeQXVyNjY5NDgzNjQ@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Winona Ryder',
          castName: 'Joyce Byers',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMTQ3NzM3MTc2NF5BMl5BanBnXkFtZTcwODMxNjA0NA@@._V1_UY317_CR9,0,214,317_AL_.jpg'),
      Person(
          fullName: 'David Harbour',
          castName: 'Jim Hopper',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BZTc5ODUzMDAtZGFhZS00NmExLTlhYWYtZDY0NGI2MGMwYTIzXkEyXkFqcGdeQXVyODY0MzQyODc@._V1_UY317_CR20,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Gaten Matarazzo',
          castName: 'Dustin Henderson',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNTkyNDIyMzQ5OF5BMl5BanBnXkFtZTgwNDUwMDM2NDM@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Caleb MacLaughlin',
          castName: 'Lucas Sinclair',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BOTY2NDY0NDgwNF5BMl5BanBnXkFtZTgwNTE3NTUzNjM@._V1_UX214_CR0,0,214,317_AL_.jpg'),
    ],
    description:
        'In a small town where everyone knows everyone, a peculiar incident starts a chain of events that leads to the disappearance of a child, which begins to tear at the fabric of an otherwise peaceful community. Dark government agencies and seemingly malevolent supernatural forces converge on the town, while a few of the locals begin to understand that there\'s more going on than meets the eye',
  ),
  Content(
    name: 'The Witcher',
    imageUrl: Assets.witcher,
    videoUrl:
        "https://d22bamm3lcnbm1.cloudfront.net/745e74be-d9f0-46d7-9547-d843554f6c13/hls/Enchanted.m3u8",
    rate: '8.3',
    releaseYear: '2019',
    accessibility: 'TV-MA',
    type: FilmType.series,
    runTime: Duration(hours: 1, minutes: 13),
    genre: ['Action', 'Adventure', 'Drama', 'Fantasy', 'Mystery'],
    director: Person(
        fullName: 'Langston Uibel',
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BZDYzNzJkOTItMzY5Yi00MzY3LWE5M2MtYWQ3NWJhN2IwZTk0XkEyXkFqcGdeQXVyMjk1MTEwMjY@._V1_UY317_CR19,0,214,317_AL_.jpg',
        biography:
            'Tony Azzolino was born on October 22, 1980. He is known for Violet Evergarden (2018), Beastars (2019) and Aggretsuko (2018).'),
    cast: [
      Person(
          fullName: 'Henry Cavil',
          castName: 'Geralt of Rivia',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BODI0MTYzNTIxNl5BMl5BanBnXkFtZTcwNjg2Nzc0NA@@._V1_UY317_CR26,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Freya Allan',
          castName: 'Ciri',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BZTYxMDc0Y2UtZWJjYi00Yjk1LWE5NWQtMGNmMmVhNzkwYmQ4XkEyXkFqcGdeQXVyMTI5Njc2ODg3._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Anya Chalotra',
          castName: 'Yennefer',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BN2ZjOGVmMTgtZTJmNS00MWFjLTk5MWEtYmYzY2M0YzEyN2U0XkEyXkFqcGdeQXVyMTA1MDUzMjgx._V1_UY317_CR14,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Mimi Ndeweni',
          castName: 'Fringilla',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMTQ1MDdkMjUtOTA5YS00YjA5LWFiNGQtOGM0YWYyMjU3N2YwXkEyXkFqcGdeQXVyNDk5MzM3Mzg@._V1_UY317_CR37,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Eamon Farren',
          castName: 'Cahir',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BY2RhZmEyNmYtZWYzYy00NDM2LTg4MjQtOTQ4M2VjZmUzZWI3XkEyXkFqcGdeQXVyNjc5Mjg0NjU@._V1_UY317_CR131,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Anna Shaffer',
          castName: 'Triss',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BYjA2ODZhNDYtMTRiMC00NDRkLTk3NDAtMzkyYTZhOTgxZjJhXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_UX214_CR0,0,214,317_AL_.jpg'),
    ],
    description:
        'The Witcher is a fantasy drama web television series created by Lauren Schmidt Hissrich for Netflix. It is based on the book series of the same name by Polish writer Andrzej Sapkowski. The Witcher follows the story of Geralt of Rivia, a solitary monster hunter, who struggles to find his place in a world where people often prove more wicked than monsters and beasts. But when destiny hurtles him toward a powerful sorceress, and a young princess with a special gift, the three must learn to navigate independently the increasingly volatile Continent',
  ),
  Content(
    name: 'The Umbrella Academy',
    imageUrl: Assets.umbrellaAcademy,
    videoUrl:
        "https://d22bamm3lcnbm1.cloudfront.net/745e74be-d9f0-46d7-9547-d843554f6c13/hls/Enchanted.m3u8",
    rate: '8.0',
    releaseYear: '2019',
    accessibility: 'TV-14',
    type: FilmType.series,
    runTime: Duration(hours: 2, minutes: 34),
    genre: ['Action', 'Adventure', 'Comedy', 'Drama', 'Fantasy', 'Sci-Fi'],
    director: Person(
        fullName: 'Robert Sheehan',
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BYzk1MjAyNzUtNWYyNi00YTM5LTkxY2ItMmYyY2I0ZjU3NTI3XkEyXkFqcGdeQXVyMTYwMDE3NA@@._V1_UX214_CR0,0,214,317_AL_.jpg',
        biography:
            'Tony Azzolino was born on October 22, 1980. He is known for Violet Evergarden (2018), Beastars (2019) and Aggretsuko (2018).'),
    cast: [
      Person(
          fullName: 'Elliot Page',
          castName: 'Vanya Hargreeves',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BYWY0NzFmYjAtYzMwNC00ODc3LWI2ZWEtOTU3YTM0Y2ZiNTM5XkEyXkFqcGdeQXVyMDA4NzMyOA@@._V1_UY317_CR11,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Tom Hopper',
          castName: 'Ciri',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BZTYxMDc0Y2UtZWJjYi00Yjk1LWE5NWQtMGNmMmVhNzkwYmQ4XkEyXkFqcGdeQXVyMTI5Njc2ODg3._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'David castaneda',
          castName: 'Diego Hargreeves',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNTE4NWYyMDktN2QzZC00YmFiLWIzMDUtMDZjNzBmNzVmMjY4XkEyXkFqcGdeQXVyNjUxMjc1OTM@._V1_UY317_CR22,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Aidan Gallagher',
          castName: 'Number Five',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNTVmNjE4ZWMtYmI3Yy00ZGYzLWFlZjItZWZmOWJkNzNiOGVkXkEyXkFqcGdeQXVyNDM1MDk1NDI@._V1_UY317_CR20,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Justin H. Min',
          castName: 'Ben Hargreeves',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BZmNhZjYwY2UtYzNjNC00NTExLTkxMDAtOGVmOTA0NTA5ZTk5XkEyXkFqcGdeQXVyMzAwNDY3OTQ@._V1_UY317_CR91,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Tom Hopper',
          castName: 'Luther Hargreeves',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BN2Y1OGZjNWUtYTdmMy00OGQxLTg5MmYtOTRjMjMxZWI1NTJhXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_UY317_CR131,0,214,317_AL_.jpg'),
    ],
    description:
        'On the same day in October 1989, forty-three infants are inexplicably born to random, unconnected women who showed no signs of pregnancy the day before. Seven are adopted by Sir Reginald Hargreeves, a billionaire industrialist, who creates The Umbrella Academy and prepares his "children" to save the world. But not everything went according to plan. In their teenage years, the family fractured and the team disbanded. Now almost thirty years old, the six surviving members reunite upon the news of Hargreeves\' passing. Luther, Diego, Allison, Klaus, Vanya and Number Five work together to solve a mystery surrounding their father\'s death. But the estranged family once again begins to come apart due to their divergent personalities and abilities, not to mention the imminent threat of a global apocalypse',
  ),
  Content(
    name: '13 Reasons Why',
    imageUrl: Assets.thirteenReasonsWhy,
    videoUrl:
        "https://d22bamm3lcnbm1.cloudfront.net/745e74be-d9f0-46d7-9547-d843554f6c13/hls/Enchanted.m3u8",
    rate: '7.6',
    releaseYear: '2017',
    accessibility: 'TV-MA',
    type: FilmType.series,
    runTime: Duration(minutes: 57),
    genre: ['Drama', 'Mystery', 'Thriller'],
    director: Person(
        fullName: 'Robert Sheehan',
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BYzk1MjAyNzUtNWYyNi00YTM5LTkxY2ItMmYyY2I0ZjU3NTI3XkEyXkFqcGdeQXVyMTYwMDE3NA@@._V1_UX214_CR0,0,214,317_AL_.jpg',
        biography:
            'Tony Azzolino was born on October 22, 1980. He is known for Violet Evergarden (2018), Beastars (2019) and Aggretsuko (2018).'),
    cast: [
      Person(
          fullName: 'Dylan Minnette',
          castName: 'Clay Jensen',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNTk0ZmNkMWEtNzI0Yy00ZTAzLThiNWMtZWMwMDkzZmJjZmU3XkEyXkFqcGdeQXVyNTYxNDQ4NQ@@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Katherine Langford',
          castName: 'Hannah Baker',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMTA0ODU1OTE5NTNeQTJeQWpwZ15BbWU4MDUwMzg2NDQz._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Christian Navarro',
          castName: 'Tony Padilla',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BOTZiOTc4OWQtYjQ5MC00MmVjLTk5OTYtMDE4MWQ5OWJkYTI3XkEyXkFqcGdeQXVyNTI5NjIyMw@@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Alisha Boe',
          castName: 'Jessa Davis',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNDYzMTNkY2QtYjdhMy00NWQ1LTk5MjItYjJlMDM1N2RiYThjXkEyXkFqcGdeQXVyMTQ3NzgyNzU@._V1_UY317_CR50,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Brandon Flynn',
          castName: 'Justin Foley',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNjhiZWRiYWEtYjc3ZS00NzZiLWE1YTYtYWE3NGFiMjc2NjE4XkEyXkFqcGdeQXVyODMzMTM1MDc@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Josh Hamilton',
          castName: 'Matt Jensen',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMTU1ODA3MzE1MV5BMl5BanBnXkFtZTcwODMxMzg1MQ@@._V1_UY317_CR11,0,214,317_AL_.jpg'),
    ],
    description:
        'Thirteen Reasons Why, based on the best-selling books by Jay Asher, follows teenager Clay Jensen (Dylan Minnette) as he returns home from school to find a mysterious box with his name on it lying on his porch. Inside he discovers a group of cassette tapes recorded by Hannah Baker (Katherine Langford) -his classmate and crush-who tragically committed suicide two weeks earlier. On tape, Hannah unfolds an emotional audio diary, detailing the thirteen reasons why she decided to end her life. Through Hannah and Clay\'s dual narratives, Thirteen Reasons Why weaves an intricate and heartrending story of confusion and desperation that will deeply affect viewers',
  ),
  Content(
    name: 'The End of the F***ing World',
    imageUrl: Assets.teotfw,
    videoUrl:
        'https://d22bamm3lcnbm1.cloudfront.net/92261725-df7e-472c-b165-c9a1688043c4/hls/Home.2015.1080p.WEB-DL.AAC2.0.H264-RARBG.m3u8',
    rate: '8.4',
    releaseYear: '2017-2019',
    accessibility: 'TV-MA',
    type: FilmType.series,
    runTime: Duration(minutes: 25),
    genre: ['Aventure', 'Comedy', 'Crime', 'Drama', 'Romance', 'Thriller'],
    director: Person(
        fullName: 'Katherine Langford',
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BMTA0ODU1OTE5NTNeQTJeQWpwZ15BbWU4MDUwMzg2NDQz._V1_UX214_CR0,0,214,317_AL_.jpg',
        biography:
            'Tony Azzolino was born on October 22, 1980. He is known for Violet Evergarden (2018), Beastars (2019) and Aggretsuko (2018).'),
    cast: [
      Person(
          fullName: 'Jessica Barden',
          castName: 'Alyssa',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMjQ2NjU3MzcyM15BMl5BanBnXkFtZTgwNzY1MzU2NDM@._V1_UY317_CR33,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Alex Lawther',
          castName: 'James',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMjI2OTk0NDM4OV5BMl5BanBnXkFtZTgwMTc2MTUyMDI@._V1_UY317_CR8,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Steve Oram',
          castName: 'Phil',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMTIwNTc0NjExMl5BMl5BanBnXkFtZTYwNzA5NDgy._V1_UY317_CR5,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Christine Bottomley',
          castName: 'Gwen',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMTk2MzQwNDE3M15BMl5BanBnXkFtZTcwNzQ5ODYxNA@@._V1_UY317_CR1,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Naomi Ackie',
          castName: 'Bonnie',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BOTVlNWZkYTUtMzg3Mi00MjcwLWE2Y2UtNWY0YjE5MTM5Mjk2XkEyXkFqcGdeQXVyNjMyODE1OTM@._V1_UY317_CR30,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Josh Hamilton',
          castName: 'Matt Jensen',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMTU1ODA3MzE1MV5BMl5BanBnXkFtZTcwODMxMzg1MQ@@._V1_UY317_CR11,0,214,317_AL_.jpg'),
    ],
    description:
        'Based on the award-winning series of comic books by Charles Forsman, The End of the F***ing World invites viewers into the dark and confusing lives of teen outsiders James and Alyssa as they embark on a road trip to find Alyssa\'s father, who left home when she was a child.',
  ),
];

List<Content> trending = [
  Content(
    name: 'Explained',
    imageUrl: Assets.explained,
    videoUrl:
        'https://d22bamm3lcnbm1.cloudfront.net/92261725-df7e-472c-b165-c9a1688043c4/hls/Home.2015.1080p.WEB-DL.AAC2.0.H264-RARBG.m3u8',
    rate: '8.0',
    releaseYear: '2018',
    accessibility: 'TV-MA',
    type: FilmType.series,
    runTime: Duration(hours: 2, minutes: 12),
    genre: ['Documentary'],
    director: Person(
        fullName: 'Aya Cash',
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BM2I3N2QwY2QtZTMyMy00Zjk5LThkYmItYWY0MDNhYjFmM2U0XkEyXkFqcGdeQXVyMjczNzE2OQ@@._V1_UY317_CR13,0,214,317_AL_.jpg',
        biography:
            'Tony Azzolino was born on October 22, 1980. He is known for Violet Evergarden (2018), Beastars (2019) and Aggretsuko (2018).'),
    cast: [
      Person(
          fullName: 'Estelle Caswell',
          castName: 'Self-Narrator',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BODhjMzcxZWQtZmRjOC00ODIyLWI1YmItMTI1Y2YwMWYxYWY1XkEyXkFqcGdeQXVyNjUxMjc1OTM@._V1_UY317_CR1,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Carly Rae Jepsen',
          castName: 'Self-Narrator',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMTM2NDg5ODQ5MF5BMl5BanBnXkFtZTcwMTE5OTQwOA@@._V1_UY317_CR2,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Kristen Bell',
          castName: 'Self-Narrator',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMjA1Njc0MTUzN15BMl5BanBnXkFtZTgwNTg1MjEwNDI@._V1_UX214_CR0,0,214,317_AL_.jpg'),
    ],
    description:
        'A documentary series that looks to explore the big questions of today.',
    episode: [
      Episode(
          name: 'Sugar',
          runTime: Duration(minutes: 34, hours: 1),
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMDVhMzFlZDEtYjlmMC00YTY1LTg4MjItMmEzMDg5NTYwNTMxXkEyXkFqcGdeQXVyNjUxMjc1OTM@._V1_QL75_UY266_CR147,0,180,266_.jpg'),
      Episode(
          name: 'Royalty',
          runTime: Duration(minutes: 12, hours: 1),
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BY2RmNWE4NDUtOWFmNy00MWIzLWFmNDQtM2VjNTRmNzg5NjlmXkEyXkFqcGdeQXVyNjUxMjc1OTM@._V1_QL75_UY266_CR99,0,180,266_.jpg'),
      Episode(
          name: 'The End of Oil',
          runTime: Duration(minutes: 57),
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BOWY2NTEyZjUtMjlmZi00MjcxLTg1ZDgtNzM4NTA2ODZmNzVmXkEyXkFqcGdeQXVyODQ4MjU1MDk@._V1_QL75_UY266_CR147,0,180,266_.jpg'),
      Episode(
          name: 'Hurricanes',
          runTime: Duration(minutes: 23),
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BYzNmMDc3NjgtODUzNi00ZGJjLTk2OWMtYzJiNzI5MzMyYmM3XkEyXkFqcGdeQXVyODQ4MjU1MDk@._V1_QL75_UY266_CR147,0,180,266_.jpg'),
      Episode(
          name: 'Fairy Tales',
          runTime: Duration(minutes: 23),
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BYzU2MTVhOTItYWNkYi00MjFmLTk5NmMtMzlhZTk2NDk2NDc4XkEyXkFqcGdeQXVyNjUxMjc1OTM@._V1_QL75_UY266_CR146,0,180,266_.jpg'),
    ],
  ),
  Content(
    name: 'Avatar The Last Airbender',
    imageUrl: Assets.atla,
    rate: '9.3',
    videoUrl:
        'https://d22bamm3lcnbm1.cloudfront.net/92261725-df7e-472c-b165-c9a1688043c4/hls/Home.2015.1080p.WEB-DL.AAC2.0.H264-RARBG.m3u8',
    releaseYear: '2005-2008',
    accessibility: 'TV-Y7-FV',
    type: FilmType.series,
    runTime: Duration(minutes: 23),
    genre: ['Animation', 'Action', 'Adventure', 'Family', 'Fantasy', 'Mystery'],
    director: Person(
        fullName: 'Aya Cash',
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BM2I3N2QwY2QtZTMyMy00Zjk5LThkYmItYWY0MDNhYjFmM2U0XkEyXkFqcGdeQXVyMjczNzE2OQ@@._V1_UY317_CR13,0,214,317_AL_.jpg',
        biography:
            'Tony Azzolino was born on October 22, 1980. He is known for Violet Evergarden (2018), Beastars (2019) and Aggretsuko (2018).'),
    cast: [
      Person(
          fullName: 'Dee Bradley Baker',
          castName: 'Appa',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMTk4MzkzMzk0MF5BMl5BanBnXkFtZTcwNDIwMjM4NA@@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Zach Tyler Eisen',
          castName: 'Aang',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMTI4NTU5NzczNF5BMl5BanBnXkFtZTYwNTY4NTY2._V1_UY317_CR2,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Mae WhitMan',
          castName: 'Katara',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMTk2NjQxMTU0N15BMl5BanBnXkFyZXN1bWU@._V1_UY317_CR131,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Jack De Sena',
          castName: 'Sokka',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMjEyMTk0NTE1MV5BMl5BanBnXkFtZTgwMjU2NjA5MjE@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Micheala Jill Murphy',
          castName: 'Toph',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMDhjYjg4NDItYTdlOS00YzUyLTgyNzUtYWQ4ZDJmZDUwOTFhXkEyXkFqcGdeQXVyOTE2OTYxMw@@._V1_UY317_CR20,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Grey Griffin',
          castName: 'Azula',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMjg2MTQxOTUyMl5BMl5BanBnXkFtZTcwMTgxNTExOA@@._V1_UY317_CR131,0,214,317_AL_.jpg'),
    ],
    description:
        'The world is divided into four elemental nations: The Northern and Southern Water Tribes, the Earth Kingdom, the Fire Nation, and the Air Nomads. The Avatar upholds the balance between the nations, but everything changed when the Fire Nation invaded. Only the Avatar, master of all four elements, can stop them. But when the world needs him most, he vanishes. A hundred years later Katara and Sokka discover the new Avatar, an airbender named Aang. Together they must help Aang master the elements and save the world.',
    episode: [
      Episode(
          name: 'The HeadBand',
          runTime: Duration(minutes: 34, hours: 1),
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMDE4N2MyYzUtYTIzZS00YzBkLTg4M2MtNTE5YzYxZTM3MGEyXkEyXkFqcGdeQXVyMjgyOTI4Mg@@._V1_.jpg'),
      Episode(
          name: 'The Awekening',
          runTime: Duration(minutes: 12, hours: 1),
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNjZjYjFkOTEtY2M0NC00OWU1LTgwZTQtMDljN2Q4NzM3ZmJmXkEyXkFqcGdeQXVyMjgyOTI4Mg@@._V1_.jpg'),
      Episode(
          name: 'The Painted Lady',
          runTime: Duration(minutes: 57),
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BZmE0YWNjZGUtMjAwNy00ZGE2LWE3ZWUtNTc4ZWM3Mzk4OGEzXkEyXkFqcGdeQXVyMjgyOTI4Mg@@._V1_.jpg'),
      Episode(
          name: 'Sokka\'s Master',
          runTime: Duration(minutes: 23),
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BYzNmMDc3NjgtODUzNi00ZGJjLTk2OWMtYzJiNzI5MzMyYmM3XkEyXkFqcGdeQXVyODQ4MjU1MDk@._V1_QL75_UY266_CR147,0,180,266_.jpg'),
      Episode(
          name: 'The Beach',
          runTime: Duration(minutes: 23),
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMjE0MzY4Njg3Nl5BMl5BanBnXkFtZTgwOTU5MTg3MjE@._V1_FMjpg_UX320_.jpg'),
      Episode(
          name: 'The HeadBand',
          runTime: Duration(minutes: 34, hours: 1),
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMDE4N2MyYzUtYTIzZS00YzBkLTg4M2MtNTE5YzYxZTM3MGEyXkEyXkFqcGdeQXVyMjgyOTI4Mg@@._V1_.jpg'),
      Episode(
          name: 'The Awekening',
          runTime: Duration(minutes: 12, hours: 1),
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNjZjYjFkOTEtY2M0NC00OWU1LTgwZTQtMDljN2Q4NzM3ZmJmXkEyXkFqcGdeQXVyMjgyOTI4Mg@@._V1_.jpg'),
      Episode(
          name: 'The Painted Lady',
          runTime: Duration(minutes: 57),
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BZmE0YWNjZGUtMjAwNy00ZGE2LWE3ZWUtNTc4ZWM3Mzk4OGEzXkEyXkFqcGdeQXVyMjgyOTI4Mg@@._V1_.jpg'),
      Episode(
          name: 'Sokka\'s Master',
          runTime: Duration(minutes: 23),
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BYzNmMDc3NjgtODUzNi00ZGJjLTk2OWMtYzJiNzI5MzMyYmM3XkEyXkFqcGdeQXVyODQ4MjU1MDk@._V1_QL75_UY266_CR147,0,180,266_.jpg'),
      Episode(
          name: 'The Beach',
          runTime: Duration(minutes: 23),
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMjE0MzY4Njg3Nl5BMl5BanBnXkFtZTgwOTU5MTg3MjE@._V1_FMjpg_UX320_.jpg'),
    ],
    moreLikeThis: [
      Content(
        name: 'Tiger King',
        imageUrl: Assets.tigerKing,
        releaseYear: '2020-2021',
        accessibility: 'TV-MA',
        type: FilmType.series,
        videoUrl:
            'https://d22bamm3lcnbm1.cloudfront.net/92261725-df7e-472c-b165-c9a1688043c4/hls/Home.2015.1080p.WEB-DL.AAC2.0.H264-RARBG.m3u8',
        runTime: Duration(minutes: 45),
      ),
      Content(
        name: 'The Crown',
        imageUrl: Assets.crown,
        releaseYear: '2020-2021',
        accessibility: 'TV-MA',
        type: FilmType.series,
        videoUrl:
            'https://d22bamm3lcnbm1.cloudfront.net/92261725-df7e-472c-b165-c9a1688043c4/hls/Home.2015.1080p.WEB-DL.AAC2.0.H264-RARBG.m3u8',
        runTime: Duration(minutes: 45),
      ),
      Content(
          name: 'Dogs',
          imageUrl: Assets.dogs,
          releaseYear: '2020-2021',
          accessibility: 'TV-MA',
          type: FilmType.series,
          videoUrl:
              'https://d22bamm3lcnbm1.cloudfront.net/92261725-df7e-472c-b165-c9a1688043c4/hls/Home.2015.1080p.WEB-DL.AAC2.0.H264-RARBG.m3u8',
          runTime: Duration(minutes: 45)),
      Content(
          name: 'The End of the F***ing World',
          imageUrl: Assets.teotfw,
          releaseYear: '2020-2021',
          accessibility: 'TV-MA',
          type: FilmType.series,
          videoUrl:
              'https://d22bamm3lcnbm1.cloudfront.net/92261725-df7e-472c-b165-c9a1688043c4/hls/Home.2015.1080p.WEB-DL.AAC2.0.H264-RARBG.m3u8',
          runTime: Duration(minutes: 45)),
    ],
    isThumbsUp: true,
  ),
  Content(
    name: 'Tiger King',
    imageUrl: Assets.tigerKing,
    videoUrl:
        "https://storage.googleapis.com/wvmedia/cenc/h264/tears/tears_sd.mpd",
    rate: '7.5',
    releaseYear: '2020-2021',
    accessibility: 'TV-MA',
    type: FilmType.series,
    runTime: Duration(minutes: 45),
    genre: ['Documentary', 'Biography', 'Crime'],
    director: Person(
        fullName: 'Aya Crypto',
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BMTk4MzkzMzk0MF5BMl5BanBnXkFtZTcwNDIwMjM4NA@@._V1_UX214_CR0,0,214,317_AL_.jpg',
        biography:
            'Tony Azzolino was born on October 22, 1980. He is known for Violet Evergarden (2018), Beastars (2019) and Aggretsuko (2018).'),
    cast: [
      Person(
          fullName: 'Joe Exotic',
          castName: 'Self - G.W Zoo',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNWY4NzQ1MTctMzA0ZS00OGJjLTkwMzctYjc4MWQwZThiNjNlXkEyXkFqcGdeQXVyMTM1NTI3Mjcy._V1_UY317_CR51,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Carole Baskin',
          castName: 'Self - Big Cat Rescue',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BOGU3Yjc2MDQtM2Y0Mi00Zjc3LTk0N2UtMDdjMmRjYTE1NGMxXkEyXkFqcGdeQXVyNjUxMjc1OTM@._V1_UY317_CR5,0,214,317_AL_.jpg'),
      Person(
          fullName: 'John Reinke',
          castName: 'Self - Manager',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNjRhNDdiYzktNzYyOS00NDU2LThjM2MtNjU5ZjE2MWExYWFiXkEyXkFqcGdeQXVyNjUxMjc1OTM@._V1_UY317_CR6,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Jeff Lowe',
          castName: 'Self - Businessman',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMjEyMTk0NTE1MV5BMl5BanBnXkFtZTgwMjU2NjA5MjE@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Erik Cowie',
          castName: 'Self - Head Keeper',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BY2ZiZDM3MzgtZDc1MC00OGYzLTgwZTgtYjYyZThhYWQxNzU5XkEyXkFqcGdeQXVyNjUxMjc1OTM@._V1_UY317_CR5,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Tim Stark',
          castName: 'Self - Wildlife in Need',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BOGFkYTMwMDEtNWI0ZC00MGUxLTgwOTEtNWU1OTVmNGFlMzBmXkEyXkFqcGdeQXVyNjUxMjc1OTM@._V1_UY317_CR10,0,214,317_AL_.jpg'),
    ],
    description:
        'Among the eccentrics and cult personalities in the stranger-than-fiction world of big cat owners, few stand out more than Joe Exotic, a mulleted, gun-toting polygamist and country western singer who presides over an Oklahoma roadside zoo. Charismatic but misguided, Joe and an unbelievable cast of characters including drug kingpins, conmen, and cult leaders all share a passion for big cats and the status and attention their dangerous menageries garner. But things take a dark turn when Carole Baskin, an animal activist and owner of a big cat sanctuary, threatens to put them out of business, stoking a rivalry that eventually leads to Joe\'s arrest for a murder-for-hire plot, and reveals a twisted tale where the only thing more dangerous than a big cat is its owner.',
  ),
  Content(
    name: 'The Crown',
    imageUrl: Assets.crown,
    videoUrl:
        "https://storage.googleapis.com/wvmedia/cenc/h264/tears/tears_sd.mpd",
    rate: '8.7',
    releaseYear: '2016',
    accessibility: 'TV-MA',
    type: FilmType.series,
    runTime: Duration(minutes: 58),
    genre: ['Biography', 'Drama', 'History'],
    director: Person(
        fullName: 'Erin Doherty',
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BMTk4MzkzMzk0MF5BMl5BanBnXkFtZTcwNDIwMjM4NA@@._V1_UX214_CR0,0,214,317_AL_.jpg',
        biography:
            'Tony Azzolino was born on October 22, 1980. He is known for Violet Evergarden (2018), Beastars (2019) and Aggretsuko (2018).'),
    cast: [
      Person(
          fullName: 'Claire Foy',
          castName: 'Queen Elizabeth II',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNTI5OTMwNzM4NV5BMl5BanBnXkFtZTcwNDY1NjkyNA@@._V1_UY317_CR7,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Imelda Staunton',
          castName: 'Queen Elizabeth II',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMTQ0NzcwOTE0NF5BMl5BanBnXkFtZTYwNjAxOTI1._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Tabias Menzies',
          castName: 'Princh Philip',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMjMxMzU0NTIxMl5BMl5BanBnXkFtZTgwOTE4ODAzMjE@._V1_UY317_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Lesley Manville',
          castName: 'Princesss Margaret',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMTQ3NTU0OTc1OF5BMl5BanBnXkFtZTcwNzU5MTA3NA@@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Dominic West',
          castName: 'Prince Charles',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMjM1MDU1Mzg3N15BMl5BanBnXkFtZTgwNTcwNzcyMzI@._V1_UY317_CR147,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Charles Edwards',
          castName: 'Martin Charteris',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMjIwNDg0NTI0Nl5BMl5BanBnXkFtZTcwMDE4NTQ2OQ@@._V1_UY317_CR36,0,214,317_AL_.jpg'),
    ],
    description:
        'This show focuses on Queen Elizabeth II as a young newlywed faced with leading the world\'s most famous monarchy, while forging a relationship with legendary Prime Minister Sir Winston Churchill. The British Empire is in decline, the political world is in disarray, but a new era is dawning. Peter Morgan\'s masterfully researched scripts reveal the Queen\'s private journey behind the public façade with daring frankness. Prepare to see into the coveted world of power and privilege behind the locked doors of Westminster and Buckingham Palace.',
  ),
  Content(
    name: 'Dogs',
    imageUrl: Assets.dogs,
    videoUrl:
        "https://storage.googleapis.com/wvmedia/cenc/h264/tears/tears_sd.mpd",
    rate: '8.0',
    releaseYear: '2018',
    accessibility: 'TV-PG',
    type: FilmType.series,
    runTime: Duration(minutes: 50),
    genre: ['Documentary'],
    director: Person(
        fullName: 'Dominic West',
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BMTk4MzkzMzk0MF5BMl5BanBnXkFtZTcwNDIwMjM4NA@@._V1_UX214_CR0,0,214,317_AL_.jpg',
        biography:
            'Tony Azzolino was born on October 22, 1980. He is known for Violet Evergarden (2018), Beastars (2019) and Aggretsuko (2018).'),
    cast: [
      Person(
          fullName: 'Claire Foy',
          castName: 'Queen Elizabeth II',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNTI5OTMwNzM4NV5BMl5BanBnXkFtZTcwNDY1NjkyNA@@._V1_UY317_CR7,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Imelda Staunton',
          castName: 'Queen Elizabeth II',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMTQ0NzcwOTE0NF5BMl5BanBnXkFtZTYwNjAxOTI1._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Tabias Menzies',
          castName: 'Princh Philip',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMjMxMzU0NTIxMl5BMl5BanBnXkFtZTgwOTE4ODAzMjE@._V1_UY317_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Lesley Manville',
          castName: 'Princesss Margaret',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMTQ3NTU0OTc1OF5BMl5BanBnXkFtZTcwNzU5MTA3NA@@._V1_UX214_CR0,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Dominic West',
          castName: 'Prince Charles',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMjM1MDU1Mzg3N15BMl5BanBnXkFtZTgwNTcwNzcyMzI@._V1_UY317_CR147,0,214,317_AL_.jpg'),
      Person(
          fullName: 'Charles Edwards',
          castName: 'Martin Charteris',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BMjIwNDg0NTI0Nl5BMl5BanBnXkFtZTcwMDE4NTQ2OQ@@._V1_UY317_CR36,0,214,317_AL_.jpg'),
    ],
    description:
        'Documentary series celebrating the deep emotional bonds between people and their beloved four-legged best friends.',
  ),
];

List combine() {
  return [
    ...originals,
    ...myList,
    ...trending,
  ];
}

List<Content> combine1() {
  return [...trending, ...myList];
}
