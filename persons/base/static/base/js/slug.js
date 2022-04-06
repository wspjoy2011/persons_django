document.getElementById("id_title").onchange = function() {val()};

function val() {
    let from = document.getElementById("id_title").value;
    let to = document.getElementById("id_slug")
    let temp = '';
    for (let i = 0; i < from.length; i++) {
        if (from.charAt(i).match(/[a-z]/i)){
            temp += from.charAt(i).toLowerCase();
        }
        else {
            temp += '-'
        }
    }
    to.value = temp;
}
