import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["addButton", "availableEmployee"];

  connect() {
    this.selectedEmployee = null;
    this.addButtonTarget.addEventListener("click", this.addEmployee.bind(this));
    this.availableEmployeeTargets.forEach((employee) => {
      employee.addEventListener("click", this.selectEmployee.bind(this));
    });
  }

  selectEmployee(event) {
    // If an employee is already selected, deselect it
    if (this.selectedEmployee) {
      this.selectedEmployee.classList.remove("selected");
    }

    // Select the clicked employee
    event.currentTarget.classList.add("selected");
    this.selectedEmployee = event.currentTarget;
  }

  addEmployee() {
    if (this.selectedEmployee) {
      const employeeId = this.selectedEmployee.dataset.employeeId;
      const employeeName = this.selectedEmployee.textContent;

      // Add the employee to the assigned employees list
      const assignedEmployeesDiv = document.getElementById(
        "assigned-employees",
      );
      const assignedEmployee = document.createElement("div");
      assignedEmployee.innerHTML = `${employeeName}`;
      assignedEmployeesDiv.appendChild(assignedEmployee);

      // Clear the selected employee
      this.selectedEmployee.classList.remove("selected");
      this.selectedEmployee = null;
    } else {
      alert("Please select an employee to add.");
    }
  }
}
