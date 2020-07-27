import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'todo-ng';
  uiState = {
    navToggle: true
  };

  toggleNav() {
    this.uiState.navToggle = !this.uiState.navToggle
  }
}
