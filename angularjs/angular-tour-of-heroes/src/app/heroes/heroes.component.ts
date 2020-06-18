import { Component, OnInit } from '@angular/core';
import { Heroes } from '../mock-heroes';
import { Hero } from '../hero';
import { HeroService } from '../hero.service';
import { MessageService } from '../message.service';

@Component({
  selector: 'app-heroes',
  templateUrl: './heroes.component.html',
  styleUrls: ['./heroes.component.scss'],
})
export class HeroesComponent implements OnInit {
  heroes: Hero[];
  selectedHero?: Hero;
  onSelect(hero: Hero): void {
    if (this.selectedHero?.id !== hero.id) {
      this.selectedHero = hero;
      this.messageService.add(`HeroService: Selected hero id=${hero.id}`);
    }
  }
  cancel(): void {
    this.selectedHero = undefined;
  }
  getHeroes(): void {
    this.heroService.getHeroes().subscribe(heroes => this.heroes = heroes)
  }

  constructor(private heroService: HeroService, private messageService: MessageService) {}

  ngOnInit(): void {
    this.getHeroes()
  }
}
