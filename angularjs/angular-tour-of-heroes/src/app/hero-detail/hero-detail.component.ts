import { Component, OnInit, Input, Output } from '@angular/core';
import { Hero } from '../hero';
import { EventEmitter } from '@angular/core';

@Component({
  selector: 'app-hero-detail',
  templateUrl: './hero-detail.component.html',
  styleUrls: ['./hero-detail.component.scss'],
})
export class HeroDetailComponent implements OnInit {
  @Input() hero: Hero;
  @Output() cancelEvent = new EventEmitter();

  onCancel() {
    this.cancelEvent.emit();
  }
  constructor() {}

  ngOnInit(): void {}
}
