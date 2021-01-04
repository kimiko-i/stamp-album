if (location.pathname.match("/")){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("name");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("name").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `albums/:album_id/stamps/search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("search-result");
        searchResult.innerHTML = "";
        if (XHR.response) {
          const searchName = XHR.response.keyword;
          searchName.forEach((keyword) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", keyword.id);
            childElement.innerHTML = keyword.name;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(keyword.id);
            childElement.addEventListener("click", () => {
              document.getElementById("name").value = clickElement.textContent;
              clickElement.remove();
            });
          });
        };
      };
    });
  });
};