```javascript
let uint8Arr = new Uint8Array([0, 255, 127, 128]);
uint8Arr[1] = 300;
```
What do you think happens to the first element here? Does it throw an error?

Let's break this down step by step:

1. First, we create a `Uint8Array` with four elements:
   ```javascript
   let uint8Arr = new Uint8Array([0, 255, 127, 128]);
   ```
   This creates an array of 8-bit unsigned integers with the values [0, 255, 127, 128].

2. Then, we try to assign the value 300 to the second element (index 1):
   ```javascript
   uint8Arr[1] = 300;
   ```

3. Here's what happens:
   - `Uint8Array` can only store integers from 0 to 255 (as it's 8-bit unsigned).
   - When you try to assign a value outside this range, it doesn't throw an error.
   - Instead, it performs a modulo operation with 256.

4. So, 300 % 256 = 44.

Therefore, after this operation, `uint8Arr[1]` will be set to 44, not 300.

The final state of `uint8Arr` will be [0, 44, 127, 128].

To summarize:
- It doesn't throw an error.
- The value wraps around to fit within the 0-255 range.
- The first element (index 0) remains unchanged at 0.

This behavior is part of the specification for typed arrays in JavaScript, designed to mimic the behavior of numeric types in lower-level languages.