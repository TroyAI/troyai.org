let ht_imageText  = document.getElementById('image-text')
let ht_imageText2 = document.getElementById('image-text-2')

let choices = [
    "We're the best.",
    "Just click it.",
    "It is the dark-mode side.",
    "Do it nerd."
];

let index = Math.floor(Math.random() * choices.length);

ht_imageText2.innerText = choices[index];

function randomCharacter() {
    let characters = 'abcdefhijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTYVWXYZ';
    return characters[Math.floor(Math.random() * characters.length)]
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function hackerType(element, hasJoinLink) {
    let originalText = element.innerText;
    let numIters = 3;

    for (let i = 0; i < originalText.length; i++) {
        for (let v = 0; v < numIters; v++) {
            var currentText = originalText;
            for (let j = i; j < originalText.length; j++) {
                currentText = currentText.substring(0, j) + randomCharacter() + currentText.substring(j+1);
            }
            if (hasJoinLink) {
                element.innerHTML = `<a href='/users/sign_up'>${currentText.substring(0, 4)}</a>${currentText.substring(4)}`
            } else {
                element.innerText = currentText;
            }
            await new Promise(r => setTimeout(r, 30));
        }
    }

    element.innerText = originalText;
}

var imageText2AnimationPlaying = false;

async function main() {
    await new Promise(r => setTimeout(r, 1000));
    imageText2AnimationPlaying = true;
    await Promise.all([hackerType(ht_imageText2, false), hackerType(ht_imageText, true)]);
    imageText2AnimationPlaying = false;
    ht_imageText.innerHTML = "<a href='/users/sign_up'>Join</a> Troy AI Club.";
}

ht_imageText2.addEventListener('mouseover', async function() {
    if (!imageText2AnimationPlaying) {
        imageText2AnimationPlaying = true;
        ht_imageText2.innerText = choices[Math.floor(Math.random() * choices.length)];
        await hackerType(ht_imageText2);
        imageText2AnimationPlaying = false;
    }
});

main();
