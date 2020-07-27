import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { catchError, tap, map } from 'rxjs/operators';

import { environment } from '../environments/environment';
import { LoginParams } from './login/login.types';
import { HttpClient, HttpHeaders, HttpResponse, HttpErrorResponse } from '@angular/common/http';

const ENDPOINT = `${environment.API_URL}/api`;

interface LoginResponse {
  status: string;
  error?: string;
  body: {
    token: string;
  }
}

@Injectable({
  providedIn: 'root',
})
export class ApiService {
  constructor(
    private http: HttpClient
  ) { }

  private httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
  };

  login(params: LoginParams): Observable<LoginResponse> {
    const payload = {
      data: params
    }
    return this.http.post<LoginResponse>(`${ENDPOINT}/sessions`, payload, this.httpOptions).pipe(
      catchError((response: HttpErrorResponse, _caught) => {
        const error = {
          error: response.error.error || response.message
        } as LoginResponse
        return of(error);
      })
    );
  }
}
