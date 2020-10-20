import { Component, OnInit } from '@angular/core';
import {
  FormGroup,
  FormBuilder,
  Validators,
  AbstractControl,
} from '@angular/forms';
import { passConfirmValidator } from './pass-confirm.validator';

interface UiState {
  submitted: boolean;
  loading: boolean;
  errors: string[];
}

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss'],
})
export class RegisterComponent implements OnInit {
  registerForm: FormGroup;
  uiState: UiState = {
    submitted: false,
    loading: false,
    errors: [],
  };

  constructor(private formBuilder: FormBuilder) {
    this.registerForm = this.formBuilder.group(
      {
        email: ['', [Validators.required, Validators.email]],
        password: ['', [Validators.required]],
        passwordConfirmation: ['', [Validators.required]],
      },
      { validators: [passConfirmValidator] }
    );
  }

  ngOnInit(): void {}

  isInvalid(control: AbstractControl): boolean {
    return this.uiState.submitted && control.invalid && control.dirty;
  }

  onSubmit(): void {
    this.uiState.errors = [];
    if (!this.uiState.submitted) {
      this.uiState.submitted = true;
      Object.values(this.registerForm.controls).forEach((control) => {
        control.markAsDirty();
      });
    }
  }
}
