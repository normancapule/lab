import { Component } from "@angular/core";

@Component({
  selector: "app-root",
  templateUrl: "./app.component.html",
  styleUrls: ["./app.component.css"],
})
export class AppComponent {
  toggle = false;
  logs = [];

  public toggleContent() {
    this.toggle = !this.toggle;
    this.logs.push({ date: new Date(), state: this.toggle });
  }
}
