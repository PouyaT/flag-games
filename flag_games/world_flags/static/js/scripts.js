target_country_name = json_ctx.target_country_name
var countries = document.getElementsByClassName('btn-light');
for (var i=0;i<countries.length; i++) {
    countries[i].addEventListener("click", checkAnswer);
}

function checkAnswer(event) {
    btn_click_val = event.target.value
    if (target_country_name === btn_click_val) {
        event.target.classList.remove('btn-light')
        event.target.classList.add('btn-success')
    }
    else {
        event.target.classList.remove('btn-light')
        event.target.classList.add('btn-danger')
    }
}
