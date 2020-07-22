import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators, FormGroup, AbstractControl } from '@angular/forms';

import { ApiService } from '../api.service'
import { LoginParams } from './login.types'

interface UiState {
  submitted: boolean;
  loading: boolean;
  errors: string[];
}

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  loginForm: FormGroup;
  uiState: UiState = {
    submitted: false,
    loading: false,
    errors: []
  };

  constructor(private formBuilder: FormBuilder, private apiService: ApiService) {
    this.loginForm = this.formBuilder.group({
      email: ['', [Validators.required, Validators.email] ],
      password: ['', [Validators.required]]
    });
  }

  ngOnInit(): void {}

  isInvalid(control: AbstractControl): boolean {
    return this.uiState.submitted && control.invalid && control.dirty;
  }

  onSubmit(): void {
    if (!this.uiState.submitted) {
      this.uiState.submitted = true;
      Object.values(this.loginForm.controls).forEach(control => {
        control.markAsDirty();
      });
    }
    if (this.loginForm.status === 'VALID') {
      const params: LoginParams = this.loginForm.value;
      this.uiState.loading = true;
      this.apiService.login(params).subscribe(
        res => {
          this.uiState.loading = false
          console.log('success ', res)
        }
      );
    }
  }
}
