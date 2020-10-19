import { Component } from '@angular/core';

@Component({
  selector: 'app-server',
  templateUrl: './server.component.html',
  styles: [`
    .online {
      color: #008600;
    }
    .offline {
      color: #800;
    }
  `]
})
export class ServerComponent {
  serverId = 10;
  serverStatus: string;

  constructor() {
    this.serverStatus = Math.random() > 0.5 ? 'online' : 'offline';
  }

  getServerStatus() {
    return this.serverStatus;
  }
}
