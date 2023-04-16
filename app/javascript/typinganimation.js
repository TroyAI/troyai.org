
var animationAlreadyPlayed = document.cookie.includes("typing_animation_already_played=True");
var typedText = document.getElementById("club-description");
var textToType = `We are a student run research club located at Troy High School Fullerton CA. We're passionate about machine learning and the future of Artificial Intelligence. We offer competition and hands on coding experience to teach and inspire others about machine learning. Through machine learning we research and develop applications to make our community a better place.`;

function playTypingAnimation() {
    typedText.innerText = '';

    function typeText() {
      if (textToType.length > 0) {
        typedText.innerHTML += textToType.charAt(0);
        textToType = textToType.substring(1);
        setTimeout(typeText, 20);
      }
    }
    
    typeText();
}

// this'll be a problem if the club still exists in 2040
if (animationAlreadyPlayed) {
    typedText.innerText = textToType;
} else {
    document.cookie = "typing_animation_already_played=True; expires=Thu, 18 Dec 2040 12:00:00 UTC";
    playTypingAnimation();
}