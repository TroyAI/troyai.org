document.querySelectorAll(".copy-button").forEach(function (element) {
    element.addEventListener("click", function() {
        let text = element.getAttribute("data-copy-button");
        navigator.clipboard.writeText(text);
    });
});