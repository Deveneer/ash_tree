import 'package:html/parser.dart';

class HtmlTagRemover {
  static String removeHtmlTags(responseData) {
    var document = parse(responseData);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
}
