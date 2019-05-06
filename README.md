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

## Usage Guidelines
When using the FFT, it is important to know the limitations. The FFT is designed as a 32 bit input, where each input is a signed vector. The signed vectors represent a series of numbers between 1 and -1. Though represented in 16 bits, the input range is that an 11 bit integer, thus the range of inputs falls from [-2047, 2047]. 

## Presentation
A more detailed description of the FFT usage, structure, and challenges can [be found here](https://docs.google.com/presentation/d/1zDaqLjIscPPB6FKJwXMmuKW6hB6pETyi-cwqOc6wG8M/edit?usp=sharing)