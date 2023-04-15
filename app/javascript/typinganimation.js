var typedText = document.getElementById("club-description");
var textToType = `
We are a student run research club located at Troy High School Fullerton CA. 
We are passionate about machine learning and the future of Artificial Intelligence. 
We offer competition and hands on coding experience to teach and inspire others about machine learning. 
Through machine learning we research and develop applications to make our community a better place.`;

function typeText() {
  if (textToType.length > 0) {
    typedText.innerHTML += textToType.charAt(0);
    textToType = textToType.substring(1);
    setTimeout(typeText, 20);
  }
}

typeText();