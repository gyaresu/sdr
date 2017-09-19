# Software Defined Radio - live examples

![HackRF One](/images/hackrf_one.jpeg)

## Equipment List
 * [HackRF](greatscottgadgets.com/hackrf) by (Great Scott Gadgets)
 * [RTL-SDR](https://en.wikipedia.org/wiki/List_of_software-defined_radios) (Wikipedia)
 * [Portapack](https://store.sharebrained.com/products/portapack-for-hackrf-one-kit)

## Scenarios

This is a set of example scenarios you can use either as a stand-alone programme or with GNURadio and either a HackRF One or an RTL-SDR.

All scripts included in this repository are intended to be run from the provided GNURadio LiveUSB.

For better performance, more space, and permanency you should install Ubuntu 16.04 LTS directly onto a computer and run these scripts from there.

After downloading (cloning) the repository, run any of the following commands within their respective folders.

  * [ADSB](/adsb/)
    * `$ sh adsb.sh` using [dump1090](https://github.com/antirez/dump1090)
    * `$ sh adsb_quit.sh` (to stop the dump1090 programme)
    * `$ sh gr-air-modes.sh` for GNURadio ADSB support
    * `$ sh flightgear-install.sh` to setup AIS/ADSB support for [http://www.flightgear.org](http://www.flightgear.org)
      * *warning* Flightgear is  500+ MB of downloads and will only work on a dedicated Ubuntu install.

  * [AIS](/ais/)
    * `$ sh ais.sh`
    
  * [FM Broadcasting](/fm/)
    * `$ sh afm_channelizer.sh`

  * [Iridium](/iridium/)
     * `$ sh iridium_install.sh`
     * `$ sh iridium_hackrf.sh`
     * `$ sh iridium_hackrf_bias-t.sh`

  * [NRSC5](/nrsc5/)
    * `$ sh nrsc5.sh`

  * [POCSAG](/pocsag/)
    * `$ sh pagermon.sh`

  * [Using the GNURadio Live Environment](/gnuradio/)
    * GNURadio is the main Software Defined Radio tool

## Getting Starting

The software in this repository is the start of an installation and demonstration package for getting started with Software Defined Radio on ships.

It is meant to be used with the [GNU Radio Live SDR Environment](https://wiki.gnuradio.org/index.php/GNU_Radio_Live_SDR_Environment)

The livesdr image is based on Ubuntu Linux 16.04.2 LTS, 64-bit edition, and has additional software installed beyond the defaults supplied by Ubuntu.

note: _If you create a new USB stick with GNURadioLive on it, be sure that the USB stick is at least 8GB._

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


### Setup

When attempting to capture a particular frequency it's important to have a [Passband Filter](https://en.wikipedia.org/wiki/Passband).

Filters such as the MiniCircuits VBFZ-1690-S+ L-Band are used with [L band](https://en.wikipedia.org/wiki/L_band).

Low energy signals can be amplified with a [Low Noise Amplifier](https://en.wikipedia.org/wiki/Low-noise_amplifier) such as the TQP3M9037-PCB LNA from Qorvo. Or the [LNA4ALL](http://lna4all.blogspot.ca/) from Adam.

### SDR - where to start?

  * Michael Ossmann's [Software Defined Radio with HackRF](https://greatscottgadgets.com/sdr/) video course is a great place to start.
  * Adam's [YouTube test videos](https://www.youtube.com/user/9a4qv) for LNA/Filter experiments.
  * 