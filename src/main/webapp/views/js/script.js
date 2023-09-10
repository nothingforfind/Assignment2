var timeLeft = 120;
var countdown = document.getElementById("countdown");

function updateCountdown() {
    var minutes = Math.floor(timeLeft / 60);
    var seconds = timeLeft % 60;

    countdown.textContent = minutes + ":" + (seconds < 10 ? "0" : "") + seconds;

    if (timeLeft === 0) {
        clearInterval(interval);
        countdown.textContent = "Hết thời gian";

        // Tự động submit biểu mẫu sau 2 phút
        document.getElementById("myForm").submit();
    }

    timeLeft--;
}

var interval = setInterval(updateCountdown, 1000);
