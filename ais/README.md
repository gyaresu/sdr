# AIS

_"The automatic identification system (AIS) is an automatic tracking system used on ships and by vessel traffic services (VTS). When satellites are used to detect AIS signatures, the term Satellite-AIS (S-AIS) is used. AIS information supplements marine radar, which continues to be the primary method of collision avoidance for water transport."_ — [Automatic Identification System](https://en.wikipedia.org/wiki/Automatic_identification_system)

[rtl_ais](https://github.com/dgiardini/rtl-ais), a simple AIS tuner and generic dual-frequency FM demodulator
OS: Linux, Windows, OSX.
Hardware: RTLSDR

Run:
`$ sh /ais.sh`

This script will download and install the `rtl-ais`, opencpn, and necessary libraries. (88 MB total downloads)

There are a range of AIS decoders to experiment with.
 - [gnuais](http://gnuais.sourceforge.net/)
 - [AISdeco2](http://xdeco.org/)
