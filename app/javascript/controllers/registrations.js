// registrations.js
// Turbo 対応 / 冪等バインド / 削除ボタンはイベント委譲で処理

document.addEventListener("turbo:load", () => {
  const addButton = document.getElementById("add-student");
  const container = document.getElementById("students-container");
  if (!addButton || !container) return;

  // 既にバインド済みなら何もしない（重複防止）
  if (addButton.dataset.bound === "1") return;
  addButton.dataset.bound = "1";

  // 初期 index を現状の .student-field 数に合わせる
  let index = container.querySelectorAll(".student-field").length;

  addButton.addEventListener("click", () => {
    const newField = document.createElement("div");
    newField.className = "student-field";
    newField.innerHTML = `
      <label>生徒名</label>
      <input type="text" name="user[students_attributes][${index}][name]" style="width:70%; display:inline-block;">
      <button type="button" class="remove-student" style="margin-left:6px;">削除</button>
    `;
    container.appendChild(newField);
    index++;
  });

  // 削除ボタンはイベント委譲でハンドリング（後から追加された要素にも対応）
  container.addEventListener("click", (e) => {
    if (e.target && e.target.classList.contains("remove-student")) {
      const field = e.target.closest(".student-field");
      if (field) field.remove();
    }
  });
});
