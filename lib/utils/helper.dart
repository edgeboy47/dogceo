String capitalize(String s) => '${s[0].toUpperCase()}${s.substring(1)}';

String slugFromTitle(String title) {
  List<String> titleWords = title.split(' ');
  String slug = '';

  if (titleWords.length > 1) {
    slug = '${titleWords[1].toLowerCase()}/${titleWords[0].toLowerCase()}';
  } else
    slug = '${titleWords[0].toLowerCase()}';

  return slug;
}
