import 'package:flutter/material.dart';

class PeertubeVideoSubtitle extends StatelessWidget {
  const PeertubeVideoSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("ZXC_dubstep_PHONKER",
            style: Theme.of(context).textTheme.labelLarge),
        Text(lorem,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(
          height: 60,
        )
      ],
    );
  }
}

String lorem =
    "Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.. Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам lorem ipsum сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).";
