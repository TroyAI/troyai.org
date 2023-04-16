let imageText2 = document.getElementById('image-text-2');

let choices = [
    "We're the best.",
    "Just click it.",
    "Do it nerd."
];

let index = Math.floor(Math.random() * choices.length);

imageText2.innerText = choices[index];