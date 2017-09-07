# Software Defined Radio - live examples

![HackRF One](/images/hackrf_one.jpeg)

## Equipment List
 * [HackRF](greatscottgadgets.com/hackrf) by (Great Scott Gadgets)
 * [RTL-SDR](https://en.wikipedia.org/wiki/List_of_software-defined_radios) (Wikipedia)

## Scenarios

This is a set of example scenarios you can use with GNURadio and either a HackRF One or an RTL-SDR.

  * [ADSB](/adsb/)
    * adsb.sh using [dump1090](https://github.com/antirez/dump1090)
    * adsb_quit.sh (to stop the dump1090 programme)

  * [AIS](/ais/)
    * ais.sh
    
  * [FM Broadcasting](/fm/)
    * fm_channelizer.sh

  * [Iridium](/iridium/)
     * iridium_install.sh
     * iridium_hackrf.sh
     * iridium_hackrf_bias-t.sh

  * [NRSC5](/nrsc5/)
    * nrsc5.sh

  * [POCSAG](/pocsag/)
    * pagermon.sh

## Getting Starting

The software in this repository is the start of an installation and demonstration package for getting started with Software Defined Radio on ships.

It is meant to be used with the [GNU Radio Live SDR Environment](https://wiki.gnuradio.org/index.php/GNU_Radio_Live_SDR_Environment)

The livesdr image is based on Ubuntu Linux 16.04.2 LTS, 64-bit edition, and has additional software installed beyond the defaults supplied by Ubuntu.

### Pre-Installed SDR Hardware Drivers

Drivers for these GNU Radio-compatible SDR peripherals have been pre-installed:

  - Ettus Research UHD release_003_009_006
  - Great Scott Gadgets HackRF products
  - Nuand bladeRF products
  - osmoSDR RTL-SDR driver
  - AirSpy
  
Each of these provides its own set of utilities and files. Please consult the manufacturers' documentation for more information.

### Pre-Installed GNU Radio Applications

There are many 3rd-party applications, demos, drivers, and block libraries produced by the GNU Radio community. Below is a list of pre-installed packages that highlight some of the diverse capabilities of GNU Radio:

- gr-osmosdr, a set of blocks supporting various hardware SDRs and applications, and related dependencies
- gr-fosphor, a GPU-accelerated real-time spectrum analyzer display
- gqrx, a narrowband SDR receiver application by Alexandru Csete
- GNSS-SDR, a fully software-based GPS, Galileo, and GLONASS real time receiver
- gr-specest, an implementation of several spectral estimation algorithms
- OpenLTE, an open source 3GPP LTE implementation
- gr-nacl, wrapper blocks around NaCL encryption library
- gr-acars2
- gr-adsb, an ADS-B modem
- gr-ais, an AIS modem
- gr-ax25, AX25
- gr-burst, a burst PSK modem
- gr-cdma, a CDMA phy
- gr-eventstream
- gr-gsm, blocks and tools for receiving GSM transmissions
- gr-ieee-80211, an IEEE 802.11a/g/p transceiver
- gr-ldpc, an implementation of generic LDPC codecs
- gr-lte, an implementation of a 3GPP LTE receiver
- gr-mapper, extra symbol/bit mapping tools
- gr-paint, spectrum painting block
- gr-radar, the GNU Radio Radar Toolbox
- gr-rds, an implementation of broadcast FM radio RDS reception
- gr-specest, Spectrum estimation blocks


### Installing



### SDR - where to start?

  * Michael Ossmann's [Software Defined Radio with HackRF](https://greatscottgadgets.com/sdr/) video course is a great place to start.
