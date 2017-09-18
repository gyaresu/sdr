# NRSC-5
[NRSC-5](https://en.wikipedia.org/wiki/HD_Radio) HD Digital Radio

[RECEIVING NRSC-5](http://theori.io/research/nrsc-5-c)

[NRSC-5 receiver for rtl-sdr](https://github.com/theori-io/nrsc5/)

RSC-5-C is the standard for digital terrestial radio in the United States.

```python
$ nrsc5 -p 63 -g 490 -w output1071 107.1 0

 $ nrsc5 -r output1071 0

 $ nrsc5 -o - -f adts 90.5 0 | mplayer -
 ```


## A GNU Radio implementation of HD Radio (NRSC-5)

GNURadio code on Github: [gr-nrsc5](https://github.com/argilo/gr-nrsc5)

The goal of this project is to implement an HD Radio receiver and transmitter in GNU Radio. HD Radio is standardized in NRSC-5. The latest version of the standard is NRSC-5-D, which can be found at http://www.nrscstandards.org/NRSC-5-D.asp.

So far only a transmitter has been implemented. A stand-alone receiver for RTL-SDR is available here: https://github.com/theori-io/nrsc5/