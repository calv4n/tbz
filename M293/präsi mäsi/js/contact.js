window.onload = function() {
	var form = document.querySelector("form");
	form.addEventListener("submit", function(event) {
		event.preventDefault();
		sendForm(this);
	});
}

function sendForm(form) {
	var xhr = new XMLHttpRequest();
	xhr.open(form.method, form.action);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			alert("Message sent!");
			form.reset();
		}
	};
	var formData = new FormData(form);
	var encodedData = [];
	for (var pair of formData.entries()) {
		encodedData.push(encodeURIComponent(pair[0]) + "=" + encodeURIComponent(pair[1]));
	}
	xhr.send(encodedData.join("&"));
}
