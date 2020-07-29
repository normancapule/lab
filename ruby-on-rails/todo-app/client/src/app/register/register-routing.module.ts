import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { RegisterComponent } from './register.component';
import { UnauthenticatedUserGuard } from '../unauthenticated-user.guard'

const routes: Routes = [{ path: 'register', component: RegisterComponent, canActivate: [UnauthenticatedUserGuard] }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class RegisterRoutingModule {}
