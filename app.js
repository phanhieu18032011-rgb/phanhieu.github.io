const statusEl = document.getElementById("status");
const androidGrid = document.getElementById("android-grid");
const iosGrid = document.getElementById("ios-grid");
const siteTitle = document.getElementById("site-title");
const siteOwner = document.getElementById("site-owner");
const footerOwner = document.getElementById("footer-owner");
const footerTitle = document.getElementById("footer-title");
const themeToggle = document.getElementById("theme-toggle");

const setStatus = (message, isError = false) => {
  if (!statusEl) return;
  statusEl.textContent = message || "";
  statusEl.classList.toggle("error", Boolean(isError));
};

const detectDevice = () => {
  const ua = navigator.userAgent || "";
  const isMobile = /Android|iPhone|iPad|iPod|Mobile/i.test(ua) || window.innerWidth <= 768;
  const isWindows = /Windows/i.test(ua);
  document.body.classList.toggle("is-mobile", isMobile);
  document.body.classList.toggle("is-windows", isWindows);
};

const applyTheme = (theme) => {
  const isLight = theme === "light";
  document.body.classList.toggle("light", isLight);
  if (themeToggle) {
    themeToggle.textContent = `Chế độ: ${isLight ? "Light" : "Dark"}`;
  }
  localStorage.setItem("drg-theme", isLight ? "light" : "dark");
};

const initTheme = () => {
  const saved = localStorage.getItem("drg-theme");
  if (saved === "light" || saved === "dark") {
    applyTheme(saved);
    return;
  }
  if (window.matchMedia && window.matchMedia("(prefers-color-scheme: light)").matches) {
    applyTheme("light");
  } else {
    applyTheme("dark");
  }
};

const bindThemeToggle = () => {
  if (!themeToggle) return;
  themeToggle.addEventListener("click", () => {
    const next = document.body.classList.contains("light") ? "dark" : "light";
    applyTheme(next);
  });
};

const createCard = (item) => {
  const card = document.createElement("article");
  card.className = "card";

  if (item.logo) {
    const logo = document.createElement("img");
    logo.className = "logo";
    logo.src = item.logo;
    logo.alt = item.name ? `${item.name} logo` : "Logo";
    logo.loading = "lazy";
    card.appendChild(logo);
  }

  const tag = document.createElement("span");
  const isEmptyTag = !item.tag || item.tag.trim() === "";
  tag.className = `tag${isEmptyTag ? " tag-empty" : ""}`;
  tag.textContent = item.tag || "";

  const status = document.createElement("span");
  status.className = `status-pill ${item.online ? "online" : "offline"}`;
  status.textContent = item.online ? "🟢 Online" : "🔴 Offline";

  const title = document.createElement("h3");
  const version = item.version ? ` ${item.version}` : "";
  title.textContent = `${item.name || ""}${version}`;

  const meta = document.createElement("p");
  meta.className = "meta";
  meta.textContent = item.note || "";

  const link = document.createElement("a");
  link.className = `button${isEmptyTag ? " danger" : ""}`;
  link.href = item.link || "#";
  link.target = "_blank";
  link.rel = "noopener";
  link.textContent = "Tải về ngay";

  const pillRow = document.createElement("div");
  pillRow.className = "pill-row";
  pillRow.append(tag, status);

  card.append(pillRow, title, meta, link);
  return card;
};

const renderSection = (grid, items) => {
  if (!grid) return;
  grid.innerHTML = "";
  (items || []).forEach((item) => {
    grid.appendChild(createCard(item));
  });
};

const applySite = (site) => {
  if (!site) return;
  if (site.title) {
    document.title = `${site.title} — ${site.owner || ""}`.trim();
    if (siteTitle) siteTitle.textContent = `Kho Tải Về ${site.title}`;
    if (footerTitle) footerTitle.textContent = site.title;
  }
  if (site.owner) {
    if (siteOwner) siteOwner.textContent = site.owner;
    if (footerOwner) footerOwner.textContent = site.owner;
  }
};

const loadData = async () => {
  try {
    setStatus("Đang tải dữ liệu...");
    const response = await fetch("data.json", { cache: "no-store" });
    if (!response.ok) throw new Error("Không thể tải data.json");

    const data = await response.json();
    applySite(data.site);
    renderSection(androidGrid, data.downloads?.android);
    renderSection(iosGrid, data.downloads?.ios);

    setStatus("");
  } catch (err) {
    console.error(err);
    setStatus("Không tải được dữ liệu. Hãy mở bằng server local hoặc kiểm tra data.json.", true);
  }
};

loadData();
detectDevice();
window.addEventListener("resize", detectDevice);
initTheme();
bindThemeToggle();
