import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { HomeComponent } from './home.component';
import { ActiveUserGuard } from '../active-user.guard'

const routes: Routes = [
  { path: 'home', component: HomeComponent, canActivate: [ActiveUserGuard] }
]

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class HomeRoutingModule {}
