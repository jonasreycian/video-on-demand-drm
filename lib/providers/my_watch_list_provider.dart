import 'package:aq_prime/assets.dart';
import 'package:flutter/foundation.dart';

import '../models/models.dart';

class MyWatchListProvider with ChangeNotifier {
  final List<Content> _myWatchList = [
    Content(
      name: 'Violet Evergarden',
      imageUrl: Assets.violetEvergarden,
      rate: '8.5',
      releaseYear: '2018',
      accessibility: 'TV-14',
      type: FilmType.anime,
      runTime: Duration(hours: 1, minutes: 45),
      genre: ['Animation', 'Drama', 'Fantasy', 'Romance', 'Sci-Fi'],
      director: Person(fullName: 'Toshiko Sawada', imageUrl: 'https://m.media-amazon.com/images/M/MV5BMTA0NjEwMzQxNTdeQTJeQWpwZ15BbWU3MDcwMTk4MzI@._V1_UY317_CR11,0,214,317_AL_.jpg', biography: 'Tony Azzolino was born on October 22, 1980. He is known for Violet Evergarden (2018), Beastars (2019) and Aggretsuko (2018).'),
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
      director:
          Person(fullName: 'Langston Uibel', imageUrl: 'https://m.media-amazon.com/images/M/MV5BZDYzNzJkOTItMzY5Yi00MzY3LWE5M2MtYWQ3NWJhN2IwZTk0XkEyXkFqcGdeQXVyMjk1MTEwMjY@._V1_UY317_CR19,0,214,317_AL_.jpg', biography: 'Tony Azzolino was born on October 22, 1980. He is known for Violet Evergarden (2018), Beastars (2019) and Aggretsuko (2018).'),
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
      name: 'The End of the F***ing World',
      imageUrl: Assets.teotfw,
      rate: '8.4',
      releaseYear: '2017-2019',
      accessibility: 'TV-MA',
      type: FilmType.series,
      runTime: Duration(minutes: 25),
      genre: ['Aventure', 'Comedy', 'Crime', 'Drama', 'Romance', 'Thriller'],
      director: Person(fullName: 'Katherine Langford', imageUrl: 'https://m.media-amazon.com/images/M/MV5BMTA0ODU1OTE5NTNeQTJeQWpwZ15BbWU4MDUwMzg2NDQz._V1_UX214_CR0,0,214,317_AL_.jpg', biography: 'Tony Azzolino was born on October 22, 1980. He is known for Violet Evergarden (2018), Beastars (2019) and Aggretsuko (2018).'),
      cast: [
        Person(fullName: 'Jessica Barden', castName: 'Alyssa', imageUrl: 'https://m.media-amazon.com/images/M/MV5BMjQ2NjU3MzcyM15BMl5BanBnXkFtZTgwNzY1MzU2NDM@._V1_UY317_CR33,0,214,317_AL_.jpg'),
        Person(fullName: 'Alex Lawther', castName: 'James', imageUrl: 'https://m.media-amazon.com/images/M/MV5BMjI2OTk0NDM4OV5BMl5BanBnXkFtZTgwMTc2MTUyMDI@._V1_UY317_CR8,0,214,317_AL_.jpg'),
        Person(fullName: 'Steve Oram', castName: 'Phil', imageUrl: 'https://m.media-amazon.com/images/M/MV5BMTIwNTc0NjExMl5BMl5BanBnXkFtZTYwNzA5NDgy._V1_UY317_CR5,0,214,317_AL_.jpg'),
        Person(fullName: 'Christine Bottomley', castName: 'Gwen', imageUrl: 'https://m.media-amazon.com/images/M/MV5BMTk2MzQwNDE3M15BMl5BanBnXkFtZTcwNzQ5ODYxNA@@._V1_UY317_CR1,0,214,317_AL_.jpg'),
        Person(fullName: 'Naomi Ackie', castName: 'Bonnie', imageUrl: 'https://m.media-amazon.com/images/M/MV5BOTVlNWZkYTUtMzg3Mi00MjcwLWE2Y2UtNWY0YjE5MTM5Mjk2XkEyXkFqcGdeQXVyNjMyODE1OTM@._V1_UY317_CR30,0,214,317_AL_.jpg'),
        Person(fullName: 'Josh Hamilton', castName: 'Matt Jensen', imageUrl: 'https://m.media-amazon.com/images/M/MV5BMTU1ODA3MzE1MV5BMl5BanBnXkFtZTcwODMxMzg1MQ@@._V1_UY317_CR11,0,214,317_AL_.jpg'),
      ],
      description: 'Based on the award-winning series of comic books by Charles Forsman, The End of the F***ing World invites viewers into the dark and confusing lives of teen outsiders James and Alyssa as they embark on a road trip to find Alyssa\'s father, who left home when she was a child.',
    ),
  ];

  List<Content> get myWatchList => _myWatchList;

  addMyWatchList(Content data) {
    _myWatchList.add(data);
    notifyListeners();
  }

  removeWatchList(Content data) {
    int location = _myWatchList.indexWhere((element) => element.name == data.name);
    _myWatchList.removeAt(location);
    notifyListeners();
  }

  bool isExisting(Content data) {
    bool returnVal = false;
    for (var i = 0; i < _myWatchList.length; i++) {
      if (data.name == _myWatchList[i].name) {
        returnVal = true;
      } else {
        continue;
      }
    }
    return returnVal;
  }
}
