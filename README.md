# Design-FFT-Module-for-OFDM-system

the design is based on butterfly diagram with radix-2.The Cooley-Tukey algorithm is the most used FFT
algorithm.

Butterfly is a portion of the computation of FFT
that combines the results of smaller discrete Fourier
transforms (DFTs) into a larger DFT, or vice versa i.e.

![Screenshot from 2021-06-01 08-09-47](https://user-images.githubusercontent.com/52976744/120275300-638b3700-c2b1-11eb-92ed-b757165fde8b.png)

The name Radix-2 is called due to its base is equals to 2 and the representation is 2M, here M represents the index/stage and its value is always equals to a positive integer. In Radix2 DIT-FFT algorithm the sequence is split into two sequences consisting of even numbered values and odd numbered values of the input sequence x(n).
![2-Figure3-1](https://user-images.githubusercontent.com/52976744/120275698-0348c500-c2b2-11eb-87ad-ea5c118a048b.png)
![Screenshot from 2021-06-01 08-17-44](https://user-images.githubusercontent.com/52976744/120275651-f330e580-c2b1-11eb-8d6e-1a655111fa30.png)

On the basis of above discussion we can say that a 32 point
FFT can be implemented via DIT-FFT with Radix-2
algorithm by using 16 butterflies per stage and 5 such
stages are required to implement a sequence of 32 points.
Hence we must use 80 butterfly operations to design a 32
point FFT.
