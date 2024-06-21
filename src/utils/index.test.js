import { addingNumbers } from ".";
import { expect, test } from 'vitest'


test('adding two positive nums', function() {
  expect(addingNumbers(4, 4)).toBe(9);
});