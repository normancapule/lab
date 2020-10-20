import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { catchError, tap, map } from 'rxjs/operators';

import { environment } from '../environments/environment';
import { LoginParams, LogoutResponse, LoginResponse } from './session.types';
import {
  HttpClient,
  HttpHeaders,
  HttpResponse,
  HttpErrorResponse,
} from '@angular/common/http';
import { StorageService } from './storage.service';

const ENDPOINT = `${environment.API_URL}/api`;

@Injectable({
  providedIn: 'root',
})
export class ApiService {
  constructor(private http: HttpClient, private storage: StorageService) {}

  private httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
  };

  setSession(token: string): void {
    this.storage.set('accessToken', token);
  }

  getSession(): string {
    return this.storage.get('accessToken');
  }

  clearSession(): void {
    this.storage.clear()
  }

  isLoggedIn(): boolean {
    return !!this.storage.get('accessToken');
  }

  logout(): Observable<LogoutResponse> {
    const token = this.storage.get('accessToken');
    return this.http
      .delete<LogoutResponse>(`${ENDPOINT}/sessions/${token}`, this.httpOptions)
  }

  login(params: LoginParams): Observable<LoginResponse> {
    const payload = {
      data: params,
    };
    return this.http
      .post<LoginResponse>(`${ENDPOINT}/sessions`, payload, this.httpOptions)
  }
}
