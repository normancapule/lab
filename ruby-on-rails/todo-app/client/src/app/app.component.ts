import { Component } from '@angular/core';
import { ApiService } from './api.service';
import { Router } from '@angular/router';
import { pipe } from 'rxjs';
import { LogoutResponse } from './session.types';
import { HttpErrorResponse } from '@angular/common/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent {
  title = 'todo-ng';
  uiState = {
    navToggle: true,
  };

  constructor(private apiService: ApiService, private router: Router) {}

  toggleNav() {
    this.uiState.navToggle = !this.uiState.navToggle;
  }

  isLoggedIn() {
    return this.apiService.isLoggedIn();
  }

  logOut() {
    this.apiService.logout().subscribe(
      (_response: LogoutResponse) => {
        this.uiState.navToggle = true;
        this.apiService.clearSession();
        this.router.navigateByUrl('/login');
      },
      (onFail: HttpErrorResponse) => {
        console.log(onFail);
      }
    );
  }
}
