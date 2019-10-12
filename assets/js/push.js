function set_critical() {
    let medium = document.getElementById('medium_critical_parameter').value;
    let high = document.getElementById('high_critical_parameter').value;

    fetch('/set_critical?medium=' + medium + '&high=' + high);
    success()
}

function success() {
    document.getElementById('pre-success').innerHTML = `
                        <div class="alert alert-success w-25" id="success">
                          Изменения успешно внесены.
                        </div>`;
    setTimeout("document.getElementById('success').remove()", 5000)
}