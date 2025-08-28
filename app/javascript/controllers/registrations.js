document.addEventListener("turbo:load", () => {
  const addButton = document.getElementById("add-student");
  const container = document.getElementById("students-container");

  if (!addButton) return;

  addButton.addEventListener("click", () => {
    const newField = document.createElement("div");
    newField.classList.add("student-field");

    newField.innerHTML = `
      <label>生徒名</label>
      <input type="text" name="student_names[]" required style="width: 70%; display: inline-block;">
      <button type="button" class="remove-student" style="display: inline-block; padding: 5px 10px; font-size: 0.85em; margin-left: 5px;">削除</button>
    `;
    container.appendChild(newField);

    newField.querySelector(".remove-student").addEventListener("click", (e) => {
      e.target.parentElement.remove();
    });
  });
});
