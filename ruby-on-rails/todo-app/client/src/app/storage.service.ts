import { Injectable } from '@angular/core';
import { LocalStorageService } from 'ngx-webstorage';

@Injectable()
export class StorageService {
  constructor(private localStorage: LocalStorageService) {}

  public set(key: string, value: string): void {
    this.localStorage.store(key, value);
  }

  public get(key: string): string {
    return this.localStorage.retrieve(key) || false;
  }

  public setObject(key: string, value: any): void {
    this.set(key, JSON.stringify(value));
  }

  public getObject(key: string): any {
    return JSON.parse(this.get(key) || '');
  }

  public remove(key: string): any {
    this.localStorage.clear(key);
  }

  public clear(): any {
    this.localStorage.clear();
  }
}
