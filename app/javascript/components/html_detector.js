class HTMLDetector {
  constructor(htmlString) {
    this.htmlString = htmlString;
    this.regex = /<span\b[^>]*>(.*?)<\/span>/g;
    this.matches = []
  };

  detect() {
    this.htmlString
  };
  // .match(regex)[0]

  match() {
    var match;
    while(match = regex.exec(this.htmlString)) {
      console.log('start index= ' +(regex.lastIndex - match[0].length));
      console.log('end index= ' + (regex.lastIndex-1));
    }
  }
};
