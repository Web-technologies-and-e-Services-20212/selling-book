var filterField = document.getElementById("filter-select");

filterField.addEventListener('change', function () { 
    url = window.location.href.split("?");
    console.log(url);
    window.location.href = url[0] + "?sort=" + this.value;
    debugger;
 });