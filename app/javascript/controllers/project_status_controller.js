import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["checkbox"];

    connect() {
        console.log('connect project status controller')
        this.checkbox = this.checkboxTarget;
        this.projectId = this.checkbox.dataset.projectId;
    }

    toggle() {
        let status = this.checkbox.checked ? "active" : "inactive";
        Rails.ajax({
            url: `/projects/${this.projectId}`,
            type: "PATCH",
            data: `project[status]=${status}`,
            success: (data) => {
                this.checkbox.checked = data.status;
                this.checkbox.nextElementSibling.textContent = data.status ? "Active" : "Inactive";
            },
        });
    }
}
