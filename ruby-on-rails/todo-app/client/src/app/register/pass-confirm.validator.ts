import { FormGroup, ValidationErrors } from '@angular/forms';

export const passConfirmValidator = (control: FormGroup): void => {
    const password = control.get('password');
    const confirmation = control.get('passwordConfirmation');

    if (!password || !confirmation) { return }
    if (password.value !== confirmation.value) {
      confirmation.setErrors({ passConfirmValidator: true });
    }
};
