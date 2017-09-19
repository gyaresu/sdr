# POCSAG

POCSAG ([Post Office Code Standardisation Advisory Group](https://en.wikipedia.org/wiki/POCSAG)) is a pager protocol.

![pagermon](/images/pagermon.jpeg)

[PagerMon](https://github.com/davidmckenzie/pagermon) is an API driven client/server framework for parsing and displaying pager messages from multimon-ng.

It is built around POCSAG messages, but should easily support other message types as required.

The UI is built around a Node/Express/Angular/Bootstrap stack, while the client scripts are Node scripts that receive piped input.

## run

`$ sh pocsag.sh`

This script will build and install all the software required to run the PagerMon interface.