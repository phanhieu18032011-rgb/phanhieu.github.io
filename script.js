// trạng thái cooldown (10s do API giới hạn)
let cooldown = false;

async function bypass() {
  const urlInput = document.getElementById("url");
  const resultDiv = document.getElementById("result");

  const url = urlInput.value.trim();

  if (!url) {
    return showError("Vui lòng nhập URL");
  }

  if (!CONFIG || !CONFIG.API_KEY) {
    return showError("Thiếu API key trong config.js");
  }

  if (cooldown) {
    return showError("Đang cooldown, chờ 10 giây...");
  }

  setLoading();

  try {
    const encodedUrl = encodeURIComponent(url);

    const res = await fetch(
      `https://key.baconbypass.online/bypass?url=${encodedUrl}&apikey=${CONFIG.API_KEY}`
    );

    const data = await res.json();

    if (data.status === "success") {
      showSuccess(data.result);
      startCooldown();
    } else {
      showError(data.message || "Lỗi không xác định");
      if (data.message?.includes("Too many requests")) {
        startCooldown();
      }
    }

  } catch (err) {
    showError("Không thể kết nối API");
  }
}

// ===== UI HANDLER =====

function setLoading() {
  document.getElementById("result").innerHTML = "⏳ Đang bypass...";
}

function showSuccess(link) {
  document.getElementById("result").innerHTML = `
    <p class="success">✅ Thành công!</p>
    <a href="${link}" target="_blank">${link}</a>
    <br><br>
    <button onclick="copyLink('${link}')">📋 Copy</button>
  `;
}

function showError(msg) {
  document.getElementById("result").innerHTML = `
    <p class="error">❌ ${msg}</p>
  `;
}

// ===== COPY =====

function copyLink(text) {
  navigator.clipboard.writeText(text);
  alert("Đã copy link!");
}

// ===== COOLDOWN =====

function startCooldown() {
  cooldown = true;

  setTimeout(() => {
    cooldown = false;
  }, 10000); // 10s
}

// ===== ENTER KEY =====

document.getElementById("url").addEventListener("keypress", function (e) {
  if (e.key === "Enter") {
    bypass();
  }
});
