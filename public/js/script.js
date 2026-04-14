import { fetchNewsData, parseArticleText } from "./newsData.js";

const newsGrid = document.getElementById("newsGrid");
const siteTitle = document.getElementById("siteTitle");
const navbarItems = document.querySelectorAll(".navbar-right li");

let newsData = [];

function renderExclusive(data) {
  const exclusiveContainer = document.getElementById("exclusiveNews");
  exclusiveContainer.innerHTML = "";
  if (data.length === 0) return;

  const rawItem = data[Math.floor(Math.random() * data.length)];
  const details = parseArticleText(rawItem.text);

  const div = document.createElement("div");
  div.classList.add("exclusive-article");
  
  const imgHtml = details.imagePath 
    ? `<img src="${details.imagePath}" style="width:100%; max-height:400px; object-fit:cover; margin-bottom:15px;">` 
    : "";

  div.innerHTML = `
    ${imgHtml}
    <h2>${rawItem.title}</h2>
  `;

  div.addEventListener("click", () => {
    window.location.href = `article.html?id=${rawItem.id}`;
  });

  exclusiveContainer.appendChild(div);
}

function renderGrid(data) {
  newsGrid.innerHTML = "";

  data.forEach(rawItem => {
    const details = parseArticleText(rawItem.text);
    
    const cleanText = details.text.replace(/<[^>]*>/g, ' ');

    const column = document.createElement("div");
    column.classList.add("news-column");

    const imgHtml = details.imagePath 
      ? `<img src="${details.imagePath}" alt="${rawItem.title}">` 
      : "";

    column.innerHTML = `
      ${imgHtml}
      <div class="text-content">
        <h3>${rawItem.title}</h3>
        <p>${cleanText.substring(0, 120)}...</p>
      </div>
    `;

    column.addEventListener("click", () => {
      window.location.href = `article.html?id=${rawItem.id}`;
    });

    newsGrid.appendChild(column);
  });
}

function renderPopular(data) {
  const popularContainer = document.getElementById("popularNews");
  popularContainer.innerHTML = "";

  const shuffled = [...data].sort(() => 0.5 - Math.random());
  const popularItems = shuffled.slice(0, 4);

  popularItems.forEach(item => {
    const li = document.createElement("li");
    li.textContent = item.title;
    li.addEventListener("click", () => {
      window.location.href = `article.html?id=${item.id}`;
    });
    popularContainer.appendChild(li);
  });
}

function updateTitle(category) {
  siteTitle.textContent = category === "all" ? "Cirmos Napilap" : `Cirmos Napilap : ${category}`;
}

function renderAll(category = "all") {
  const data = category === "all" ? newsData : newsData.filter(item => item.category === category);

  newsGrid.classList.toggle("home-grid", category === "all");
  newsGrid.classList.toggle("category-grid", category !== "all");

  document.querySelector(".exclusive-news-section").style.display = category === "all" ? "" : "none";
  document.querySelector(".divider").style.display = category === "all" ? "block" : "none";

  renderExclusive(data);
  renderPopular(data);
  renderGrid(data);
  updateTitle(category);
}

async function init() {
  newsData = await fetchNewsData();
  
  const urlParams = new URLSearchParams(window.location.search);
  const initialCategory = urlParams.get("category") || "all";
  renderAll(initialCategory);

  navbarItems.forEach(li => {
    li.addEventListener("click", () => renderAll(li.dataset.category));
  });

  siteTitle.addEventListener("click", () => {
    window.history.pushState({}, '', window.location.pathname);
    renderAll("all");
  });
}

init();