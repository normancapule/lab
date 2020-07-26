import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { catchError, tap } from 'rxjs/operators';

import { environment } from '../environments/environment';
import { LoginParams } from './login/login.types';
import { HttpClient, HttpHeaders } from '@angular/common/http';

const ENDPOINT = `${environment.API_URL}/api`;

interface LoginResponse {
  status: string;
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
      tap((response) => console.log(response)),
      catchError((error, caught) => {
        console.log(error);
        console.log(caught);
        return of({} as LoginResponse);
      })
    );
  }
}
