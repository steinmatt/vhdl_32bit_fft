**ELEC 562, Loyola Marymount University, Student Project** BY: Matthew Stein, Ethan Tsao, Connor Cusi -- Spring 2019

# 32 BIT FFT 
As the final project to ELEC 562, we've chosen to design and imlement a synthesizable 32 bit FFT using the Radix 2 DIF FFT algorithm. 

## Sources Cited
In order to properly understand the Radix 2 Algorithm and the algorithm's implementation into a synthesizable package, a variety of sources were used. 
 1. [MIT VHDL Tutorial](http://web.mit.edu/6.111/www/f2017/handouts/FFTtutorial121102.pdf). 
 2. [SCRIBD Synthesizable FFT Implmentation](https://www.scribd.com/doc/74682090/Implementation-Of-Fast-Fourier-Transform-FFT-Using-VHDL).
 3. [How to Calculate Twiddle Factors](https://www.dsprelated.com/showarticle/107.php).
 4. [Broad Structure Connections](https://ieeexplore.ieee.org/abstract/document/6168353)
 5. All Course Notes relating to VHDL 

## For Submission: Déjàssembly Vu
Write the requested x86 assembly language programs for Linux. The programs have been chosen for both simplicity and familiarity, because, well, _assembly language_.

### Make Quarter Change
Write an x86 assembly language program for Linux, _make-quarter-change.asm_, that takes a command line argument for a total number of cents and computes the number of quarters that can be changed for that amount.

Sample program invocation and output:

    $ ./make-quarter-change 142
    5 quarters make partial change for 142 cents.

Don’t worry about singular vs. plural cents or quarters. It’s assembly language; we understand. Also, don’t worry about a negative amount. Yup, assembly language again.

If the wrong number of command line arguments is supplied, the program should respond as follows:

    $ ./make-quarter-change
    This program requires exactly one integer command line argument.

Or:

    $ ./make-quarter-change 78 12 33
    This program requires exactly one integer command line argument.

Because `atoi` just returns `0` on bad input values, don’t worry about detecting those:

    $ ./make-quarter-change bazinga
    0 quarters make partial change for 0 cents.

As with previous assignments, the grading of this assignment will be semi-automated, so it is very important that you adhere strictly to the specified output messages and format.

### Is Probably Leap Year?
Write an x86 assembly language program for Linux, _is-probably-leap-year.asm_, that takes a command line argument for an integer year and computes whether that year is divisible by four.

Sample program invocation and output:

    $ ./is-probably-leap-year 1942
    1942 is probably not a leap year.
    
    $ ./is-probably-leap-year 1900
    1900 is probably a leap year.

(no, 1900 is _not_ a leap year—that’s why we just say “probably”)

Don’t worry about negative years. Say it with me: _assembly language_.

If the wrong number of command line arguments is supplied, the program should respond as follows:

    $ ./is-probably-leap-year
    This program requires exactly one command line argument specifying a year.

Or:

    $ ./is-probably-leap-year 1985 2001 2019
    This program requires exactly one command line argument specifying a year.

Because `atoi` just returns `0` on bad input values, don’t worry about detecting those:

    $ ./is-probably-leap-year bazinga
    0 is probably a leap year.

As with previous assignments, the grading of this assignment will be semi-automated, so it is very important that you adhere strictly to the specified output messages and format.

## How to Turn it In
Commit your source code (and _just_ the source code)—_make-quarter-change.asm_ and _is-probably-leap-year.asm_—to this repository.

## Specific Point Allocations
This assignment is scored according to outcomes _2c_, _2d_, _3a_, _3b_, and _4a_ to _4f_ in the [syllabus](https://dondi.lmu.build/spring2019/cmsi284/cmsi284-spring2019-syllabus.pdf). For this particular assignment, graded categories are as follows:

| Category | Points | Outcomes |
| -------- | -----: | -------- |
| _make-quarter-change.asm_ | 50 points total | |
| • Assembles, links, and runs without unexpected errors | 10 points | _3a_, _4a_, _4d_ |
| • Correct program output | 25 points | _2c_, _2d_, _3b_, _4a_, _4d_ |
| • Correct handling of invalid user input | 15 points | _2c_, _2d_, _3b_, _4a_, _4d_ |
| _is-probably-leap-year.asm_ | 50 points total | |
| • Assembles, links, and runs without unexpected errors | 10 points | _3a_, _4a_, _4d_ |
| • Correct program output | 25 points | _2c_, _2d_, _3b_, _4a_, _4d_ |
| • Correct handling of invalid user input | 15 points | _2c_, _2d_, _3b_, _4a_, _4d_ |
| Hard-to-maintain or error-prone code | deduction only | _4b_ |
| Hard-to-read code | deduction only | _4c_ |
| Version control | deduction only | _4e_ |
| Punctuality | deduction only | _4f_ |
| **Total** | **100** |

Note that inability to assemble, link, and run to begin with will negatively affect the correctness of program output and proper handling of invalid user input.
