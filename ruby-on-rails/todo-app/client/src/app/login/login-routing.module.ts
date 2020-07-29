import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { LoginComponent } from './login.component';
import { UnauthenticatedUserGuard } from '../unauthenticated-user.guard'

const routes: Routes = [{ path: 'login', component: LoginComponent, canActivate: [UnauthenticatedUserGuard] }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class LoginRoutingModule {}
