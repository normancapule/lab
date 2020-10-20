import { TestBed } from '@angular/core/testing';

import { UnauthenticatedUserGuard } from './unauthenticated-user.guard';

describe('UnauthenticatedUserGuard', () => {
  let guard: UnauthenticatedUserGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(UnauthenticatedUserGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
