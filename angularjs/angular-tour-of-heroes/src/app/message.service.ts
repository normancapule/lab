import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class MessageService {
  messages: string[] = [];

  add(message: string) {
    this.messages = [message, ...this.messages];
  }

  clear() {
    this.messages = [];
  }

  constructor() {}
}
