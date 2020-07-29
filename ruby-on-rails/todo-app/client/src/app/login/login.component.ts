import { Component, OnInit } from '@angular/core';
import {
  FormBuilder,
  Validators,
  FormGroup,
  AbstractControl,
} from '@angular/forms';

import { ApiService } from '../api.service';
import { LoginParams } from '../session.types';
import { Router } from '@angular/router';
import { HttpErrorResponse } from '@angular/common/http';

interface UiState {
  submitted: boolean;
  loading: boolean;
  errors: string[];
}

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent implements OnInit {
  loginForm: FormGroup;
  uiState: UiState = {
    submitted: false,
    loading: false,
    errors: [],
  };

  constructor(
    private formBuilder: FormBuilder,
    private router: Router,
    private apiService: ApiService
  ) {
    this.loginForm = this.formBuilder.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required]],
    });
  }

  ngOnInit(): void {}

  isInvalid(control: AbstractControl): boolean {
    return this.uiState.submitted && control.invalid && control.dirty;
  }

  onSubmit(): void {
    this.uiState.errors = [];
    if (!this.uiState.submitted) {
      this.uiState.submitted = true;
      Object.values(this.loginForm.controls).forEach((control) => {
        control.markAsDirty();
      });
    }
    if (this.loginForm.status === 'VALID') {
      const params: LoginParams = this.loginForm.value;
      this.uiState.loading = true;
      this.apiService.login(params).subscribe((res) => {
        this.uiState.loading = false;
        this.router.navigate(['/home'])
        this.apiService.setSession(res.token)
      },
      (onFail: HttpErrorResponse) => {
        this.uiState.loading = false;
        this.uiState.errors = [onFail.error.error];
        console.log(onFail)
      });
    }
  }
}
