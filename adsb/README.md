# ADSB
[ADSB](https://en.wikipedia.org/wiki/Automatic_dependent_surveillance_%E2%80%93_broadcast)

# usage

  * [ADSB](/adsb/)
    * `$ sh adsb.sh` using [dump1090](https://github.com/antirez/dump1090)
    * `$ sh adsb_quit.sh` (to stop the dump1090 programme)
    * `$ sh gr-air-modes.sh` for GNURadio ADSB support
    * `$ sh flightgear-install.sh` to setup AIS/ADSB support for [http://www.flightgear.org](http://www.flightgear.org)
      * *warning* Flightgear is  500+ MB of downloads and will only work on a dedicated Ubuntu install.
      
## dump1090

[dump1090](https://github.com/antirez/dump1090.git) is an ADSB decoder

## gr-air-modes && Flightgear

### gr-air-modes

[gr-air-modes](https://github.com/bistromath/gr-air-modes) implements a software-defined radio receiver for Mode S
transponder signals, including ADS-B reports from equipped aircraft. 

Interesting files and libraries included with the package:

* apps/modes_rx: The main application.
* apps/get_correlated_records.py: Demonstration program for computing
  multilaterated time error for two unsynchronized receiver stations.
* lib/air_modes_int_and_dump.cc: Unused integrate-and-dump filter for
  demodulating Mode S waveforms.
* lib/air_modes_preamble.cc: Mode S preamble detector.
* lib/air_modes_slicer.cc: Bit slicer (1 vs 0) and packet aggregator.
* lib/modes_crc.cc: Computes parity check for Mode S packets.
* python/altitude.py: Mode S altitude encoding/decoding routines
* python/cpr.py: Compact Position Reporting encoder/decoder
* python/modes_flightgear.py: FlightGear (open-source flight simulator)
  plugin which inserts live traffic into the simulator via the
  multiplayer interface.
* python/mlat.py: Multilateration algorithms for determining position of
  non-ADS-B-equipped or non-cooperative aircraft using multiple
  receivers.
* python/modes_kml.py: KML output plugin for Google Earth.
* python/modes_parse.py: Mode S/ADS-B packet parsing routines.
* python/modes_print.py: Human-readable printout plugin
* python/modes_raw_server.py: UDP output plugin for raw data output
* python/modes_sbs1.py: SBS-1-compatible output plugin for use with
  Virtual Radar Server, PlanePlotter, or other compatible programs.
* python/modes_sql.py: SQLite interface for storing reports in a
  database.
* python/Quaternion.py: Quaternion library used to calculate
  orientation of aircraft for FlightGear plugin.


# Flightgear

[http://www.flightgear.org/](http://www.flightgear.org/)

FlightGear is an open-source flight simulator.  It supports Windows, Mac, and Linux.



