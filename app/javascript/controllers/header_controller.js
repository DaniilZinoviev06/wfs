//for dropdown menu (hide/show methods by el-transition package) 

import { Controller } from "@hotwired/stimulus"
import {leave, toggle} from 'el-transition'


export default class extends Controller {

    static targets = ["dropdownMenu", "openUserMenu"]

    connect(){
        const targetElement = this.element.querySelector('[data-header-target="openUserMenu"]');

        if (targetElement) {
            this.openUserMenuTarget.addEventListener("click", () => {
                toggle(this.dropdownMenuTarget)
            });
            document.addEventListener("click", this.hide.bind(this));
        }
    }

    hide(event) {
        // event.target - the element that the user clicked on
        const openUserMenuClicked = this.openUserMenuTarget.contains(event.target);
        const dropdownMenuClicked = this.dropdownMenuTarget.contains(event.target);

        // checking for clicks outside the target 
        if (!openUserMenuClicked && !dropdownMenuClicked) {
            leave(this.dropdownMenuTarget);
        }
    }

    //hidden/visible
    toggle(element) {
        toggle(element);
    }

} 


