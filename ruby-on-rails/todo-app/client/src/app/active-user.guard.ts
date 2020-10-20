import { Injectable } from '@angular/core';
import {
  CanActivate,
  ActivatedRouteSnapshot,
  RouterStateSnapshot,
  UrlTree,
  Router,
} from '@angular/router';
import { ApiService } from './api.service';

@Injectable({
  providedIn: 'root',
})
export class ActiveUserGuard implements CanActivate {
  constructor(private apiService: ApiService, private router: Router) {}

  canActivate(
    _next: ActivatedRouteSnapshot,
    _state: RouterStateSnapshot
  ): boolean | Promise<boolean | UrlTree> {
    if (this.apiService.isLoggedIn()) {
      return true;
    }

    return this.router.navigate(['/login']);
  }
}
