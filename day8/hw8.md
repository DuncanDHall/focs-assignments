# FOCS Homework for Day 9

You may edit your answers into this file, or add a separate file in the same directory.

If you add a separate file, please include the following at the top:

```
Student Name: Duncan Hall
Check one:
[X] I completed this assignment without assistance or external resources.
[ ] I completed this assignment with assistance from ___
   and/or using these external resources: ___
```

## 1. For each of the following languages, decide whether it is regular

For each of the following languages, decide whether it is regular.  If it is regular, give a regular expression or finite automaton that recognizes the language.  If it is not regular, demonstrate that using the pumping lemma.

a) Strings containing only the symbol a whose length is a power of 2 (*i.e.* length 2^n)

[The strings `a`, `aa`, `aaaa`, and `aaaaaaaa` are in this language; the string `aaaaa` is not.]

*answer:* non-regular. For any word in Lang, and for any selection of `a+` from that word to check for pumping, either the absence of that selection in the word will prove the word to no longer be in the Lang, or the doubling of it will.

*better answer:* Assume L is regular. Let w in L given by w = a^p where p is a power of 2. There must be a decomposition w = xyz such that |xy| ≤ p and |y| ≥ 1 such that x(y^i)z is in L for all i ≥ 0. If y consists of the entirety of w, y^3 not in L. In fact, for any y other than y = a^(p/2), x(y^3)z not in L. For this special case where y = a^(p/2), simply x(y^2)z not in L. Thus the pumping lemma does not hold, and L is irregular.

b) All strings with an equal number of occurrences of the substrings `01` and `10`.

[010 is in this language; `000110` is in the language; `0101010` is in the language; but `010101` is not.]

*answer:* regular: `((0+1*)*0+)?` or `(0+1*)*0+ U ''`

c) All strings (over {0,1}) consisting of a substring _w_ followed by the reverse of the substring.

[The strings `00100100` and `11110101011010101111` are in this language; the strings `00100` and `010101 `are not.]

*answer:* non-regular: \<insert pumping lemma jargon here\>. w = (0^p)11(0^p). Any selection of y will be entirely 0s, and if ommited will result in w not in L

## 2. Play the pumping game

Play the **pumping game** (referenced on the [Day 8 page](https://sites.google.com/site/focs16fall/in-class-exercises/day-8) and also found at [http://weitz.de/pump/](http://weitz.de/pump/)).  Solve at least two puzzles from that page (that do NOT appear in question 1, above) and provide the word you chose, the substring the computer chose, and your successfully pumped string.

Notation notes:

- The notation |w| sub a means the number of `a`'s in the word _w_.
- _a_^_n_ means _n_ occurrences of `a` (e.g. _a_^8 is `aaaaaaaa`)

Puzzle 9: L = {(b^5)w | |w|_a_ = 2|w|_b_} with p = 22
*solution:* used bbbbbaaaaaaaaaaaaaaaaaabbbbbbbbb
                    computor chose   ^^^
            when pumped at all, w falls out of L

Puzzle 11: L = {((ab)^n)(a^k) | n ≥ k} with p = 23
*solution:* used ababababababababaaaaaaaa
                computor chose    ^^^^^
            when repeated one extra time, n < k and new w not in L

If you have other questions about notation (or anything else), please post them to [Piazza](https://piazza.com) so that we can clarify for everyone.

## 3. Create a PDA

For one of the non-regular languages in problem 1 or 2 above, create a PDA (preferably in JFLAP) and include it with your completed homework.

*included*

## 4. Reading

Optionally read Sipser pp. 101–125.

Optionally read Stuart pp. 128–134.

## 5. Install gprolog

Please download and install [gprolog](http://www.gprolog.org) before coming to class:

**Ubuntu**:

	$ sudo apt-get install gprolog

**Mac**, with [Homebrew](http://brew.sh) installed:

	$ brew install gnu-prolog

**Mac** without Homebrew, and **Windows**:

- Follow the instructions at [http://www.gprolog.org/#download](http://www.gprolog.org/#download).

*done*
