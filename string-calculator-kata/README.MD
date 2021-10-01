# String Calculator

1. Create a simple String calculator with a method int Add(string numbers)
2. The method can take 0, 1 or 2 numbers, and will return their sum (for an empty string it will return 0) for example "" or "1" or "1,2"
3. Allow the Add method to handle an unknown amount of numbers
4. Allow the Add method to handle new lines between numbers (instead of commas)  ex: "1\n2,3" (will equal 6)
5. Calling Add with a negative number will throw an exception "negatives not allowed" - and the negative that was passed.if there are multiple negatives, show all of them in the exception message
6. Numbers bigger than 1000 should be ignored, so adding 2 + 1001 = 2
7. Delimiters can be of any length with the following format: `“//[delimiter]\n”` for example: `“//[***]\n1***2***3”` should return 6

