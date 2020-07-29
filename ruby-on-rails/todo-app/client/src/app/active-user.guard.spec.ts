import { TestBed } from '@angular/core/testing';

import { ActiveUserGuard } from './active-user.guard';

describe('ActiveUserGuard', () => {
  let guard: ActiveUserGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(ActiveUserGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
