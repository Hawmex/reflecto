const speechRecognition = new webkitSpeechRecognition();

let scenarioStep = 0;

speechRecognition.lang = "fa-IR";
speechRecognition.interimResults = false;
speechRecognition.maxAlternatives = 2;

const matchResult = (results, matches) => {
  for (let i = 0; i < results.length; i++) {
    if (matches.some((match) => results.item(i).transcript.includes(match))) {
      return true;
    }
  }

  return false;
};

speechRecognition.onresult = (event) => {
  const results = event.results[0];

  switch (scenarioStep) {
    case 0:
      if (matchResult(results, ["سلام", "درود"])) {
        if (matchResult(results, ["آینه", "آیینه"])) {
          scenarioStep = 4;
          dispatchEvent(new CustomEvent("say-hello-without-intro-question"));
        } else {
          scenarioStep = 1;
          dispatchEvent(new CustomEvent("say-hello-with-intro-question"));
        }
      }
      break;
    case 1:
      if (matchResult(results, ["بله", "آره"])) {
        scenarioStep = 2;
        dispatchEvent(new CustomEvent("say-short-intro"));
      } else if (matchResult(results, ["خیر", "نه"])) {
        scenarioStep = 4;
        dispatchEvent(new CustomEvent("say-ready-for-commands"));
      }
      break;
    case 2:
      if (matchResult(results, ["بله", "آره"])) {
        scenarioStep = 3;
        dispatchEvent(new CustomEvent("show-full-intro-video"));
      } else if (matchResult(results, ["خیر", "نه"])) {
        scenarioStep = 4;
        dispatchEvent(new CustomEvent("say-ready-for-commands"));
      }
      break;
    case 3:
      if (matchResult(results, ["بله", "آره"])) {
        scenarioStep = 4;
        dispatchEvent(new CustomEvent("show-irandoc-intro-video"));
      } else if (matchResult(results, ["خیر", "نه"])) {
        scenarioStep = 4;
        dispatchEvent(new CustomEvent("say-ready-for-commands"));
      } else if (matchResult(results, ["بسه", "لغو", "تمام"])) {
        scenarioStep = 4;
        dispatchEvent(new CustomEvent("say-ready-for-commands"));
      }
      break;
    case 4:
      if (matchResult(results, ["خداحافظ", "خدانگهدار"])) {
        scenarioStep = 0;
        dispatchEvent(new CustomEvent("say-goodbye"));
      } else if (matchResult(results, ["ویدیو", "فیلم", "ببینیم"])) {
        dispatchEvent(new CustomEvent("show-video"));
      } else if (
        matchResult(results, ["موزیک", "آهنگ", "موسیقی", "گوش بدیم"])
      ) {
        dispatchEvent(new CustomEvent("play-music"));
      } else if (matchResult(results, ["نمودار", "داشبورد"])) {
        dispatchEvent(new CustomEvent("show-visual"));
      } else if (matchResult(results, ["بسه", "لغو", "تمام"])) {
        dispatchEvent(new CustomEvent("say-ready-for-commands"));
      }
      break;
  }
};

speechRecognition.onend = (event) => event.target.start();

speechRecognition.start();
