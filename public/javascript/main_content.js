var tabList = document.querySelectorAll(".pro-nav li");
var tabContent = document.querySelectorAll(".list-content")

tabList.forEach(tab => {
    tab.addEventListener('click', function(){
        let tabContentClass = ".pro-list-" + tab.getAttribute("id");
        if(!tab.classList.contains("active")){
            tabList.forEach(tabs => {
                tabs.classList.remove("active");
            });
            tab.classList.add("active");

            tabContent.forEach(content => {
                content.classList.remove("active");
            })
            document.querySelector(tabContentClass).classList.add("active");
        }
        debugger
    })
});