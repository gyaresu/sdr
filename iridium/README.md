# Iridium
[Iridium](https://en.wikipedia.org/wiki/Iridium_satellite_constellation#Satellites)

## Preamble
Provided are the instructions to start a custom Live (running in RAM) Ubuntu Operating System (OS) to enable the operation of software specific to demodulating Iridium satellite messages.
The user should have an understanding of Software Defined Radios, Linux, Git, Python, awk, sed, grep, installing software from source code, including setting PATH and ENVIRONMENT variables for custom software. 
This guide assumes you have the required knowledge.
If in doubt please refer to provided pdf documents on prior research and the README.md files that accompany each included software package.

### Code examples will be highlighted like below:

```# Example: Do Things and Stuff
if [ ! -d $HOME/thing ]; then
  cd $HOME
  do stuff
  export PATH="$PATH:$SOMEPLACE"
fi
```

## Original work:
All source code and installation scripts have been packaged into a repository stored on GitHub.
Required software has been included as git submodules.  

https://github.com/gyaresu/sdr

You’ll find example Iridium install scripts for the software in the sdr source code folder

Copy the folder named sdr from the external hard drive to the GNURadioLive home directory (/home/ubuntu/).

Within the sdr folder you will find folders for each type of SDR toolchain and at least one setup script which will install the required software packages from source.

As this is a Live Operating System, you will need to do this each time the OS is rebooted. (So just don’t reboot often)

## Equipment
A dedicated computer with an x86-64 processor and at least 2GB of RAM.
Virtual machines cannot handle virtual USB v2 speeds required for a full 10-12 MHz of bandwidth from the SDR
HackRF One Software Defined Radio
Micro USB cable. Short and try different ones if you get a lot of RF noise.
At least one Low Noise Amplifier (LNA) and one L-Band filter - refer to schematic
Power sources for LNA and computer.

## Operating System

GNURadioLive provided on USB and as a separate ISO file

Download: https://wiki.gnuradio.org/index.php/GNU_Radio_Live_SDR_Environment

Build your own (advanced): https://github.com/gnuradio/gnuradio-livesdr

Software (download and keep the latest versions with SDR kit in an external drive)

Each of these software packages come with more detailed information in their respective README.md files 
 * gr-iridium: https://github.com/muccc/gr-iridium GNURadio module for demodulation and packet capture
 * iridium-toolkit: https://github.com/muccc/iridium-toolkit
   * Toolkit for decoding and packet interpretation Google KML mapping tool
   * Packet-to-voice decoding
   * Statistical analysis and other tools
 * liquid-dsp: https://github.com/jgaeddert/liquid-dsp
 * inspectrum: https://github.com/miek/inspectrum
 * osmo-ir77: https://git.osmocom.org/osmo-ir77

## Booting up

USBs have been provided and are already imaged with the Ubuntu 16.04 GNURadioLive OS

Upon startup you will need to change network settings to “Internet (DHCP assigned)”

All commands for the provided tools are run from within a terminal. Default is GNOME Terminal 3.18.3 but use any unicode enabled shell you are comfortable with.

Mount the external drive and copy the directory named `sdr` to the home directory. `/home/ubuntu` in this case.

From here you can go into the iridium folder and run the install script:

```
$ cd /home/ubuntu/sdr/iridium/
$ sh iridium_install.sh
```

This build script takes all the required software packages in the folder, compiles them, sets their environment variables. Note that the build and install script will reinstall all the software if run multiple times.

## Running the software
Make sure the HackRF One (H1) is installed by using the following command to show you that it is recognised and also which version of the firmware is installed on the H1. (A firmware binary been included in the directory `sdr/files/hackrf-2017.02.1.zip`)

```
$ hackrf_info
hackrf_info version: unknown
libhackrf version: unknown (0.5)
Found HackRF
Index: 0
Serial number: 0000000000000000457863c82e33551f
Board ID Number: 2 (HackRF One)
Firmware Version: 2017.02.1 (API:1.02)
Part ID Number: 0xa000cb3c 0x00484f3e
```

## Capturing the iridium bitstream
The two example configuration files are:

```
/home/ubuntu/sdr/iridium/gr-iridium/examples/hackrf.conf
/home/ubuntu/sdr/iridium/gr-iridium/examples/hackrf-10msps.conf
```

If you are using the LNA4ALL directly before the HackRF then you can edit the `hackrf.conf` file and turn on the “bias-t”.

The bias-t will output 3.5V directly into the modified LNA4ALL Low Noise Amplifer:
WARNING: Only do this if the LNA is attached and in the correct position or you risk equipment destruction

Uncomment line 4 in hackrf.conf for bias-t power out:
Before:

`#device_args='hackrf=0,bias=1'`

After:

`device_args='hackrf=0,bias=1'`

Now you can run the following command to dump only the packetized bitstream which gets an “A:OK” for completeness.

```
iridium-extractor -D 4 ~/sdr/iridium/gr-iridium/examples/hackrf.conf | grep "A:OK" > /tmp/output.bits
Example capture output:
1456890563 | i:  44/s | i_avg:  47/s | q:   40 | q_max:  184 | o: 43/s | ok:  62% | ok: 27/s | ok_avg:  48% | ok:       2748 | ok_avg:  22/s | d: 0
1456890623 | i:  39/s | i_avg:  44/s | q:    2 | q_max:   74 | o: 40/s | ok:  49% | ok: 20/s | ok_avg:  48% | ok:       3960 | ok_avg:  21/s | d: 0
1456890684 | i:  55/s | i_avg:  47/s | q:    0 | q_max:   87 | o: 55/s | ok:  52% | ok: 28/s | ok_avg:  49% | ok:       5698 | ok_avg:  23/s | d: 0
```

## Parsing the captured packets
One the `/tmp/output.bits` file starts to get content you can open a second terminal and parse the data with a Python tool to convert the packets into recognised data types. Included in that will be SBD messages.

`$ python ~/sdr/iridium/iridium-toolkit/iridium-parser.py /tmp/output.bits /tmp/output.parsed`

Keep in mind you may have thousands of packets so being able to parse the converted data into something useful is where grep/sed/awk will be useful tools.

## Example parsing output:
You’re going to get massive data files and interpreting them is the next challenge. Because you’re not just getting the single stream of data for a single device. You’re getting the firehose of all data, from all devices, in at least your 400 square km region.

An individual commercial Iridium transceiver will lock on and only give you only the data that matches a stream sequentially.
So we need to filter out the sequences manually and there are a few ways to do that.


### Print only the number of characters we specify after a particular pattern (SBD):

```
awk '/SBD/ {
match($0, /SBD/); print substr($0, RSTART +5, RLENGTH + 20);
}' file_name.sbd | grep -E -o "^v\.&.*|^0{4}.*|^_6.*$"


SBD: v.&.7.....M._87_01_0
SBD: 0000_01805_461D_0070
SBD: _6_01_0030_CC04B509.

awk '/SBD/ {match($0, /SBD/); print substr($0, RSTART +5, RLENGTH + 20);}' ~/tmp/2017-06-01.sbd | grep -E -o "^v\.&.*|^0{4}.*|^_6.*$" > ~/samples/2017-06-01.mpackets
Add 4 lines into one
perl -pi -e 's/\n// if $.%4 input_file.sbd
Interpreting the data
GPS location from an M3Iv7 Fishing Aggregation Device:

SBD: ....F..$..*FAB:M3Iv7
SBD: 323 4000.856S 12405.
SBD: 880E TVG:878 693 585
```

## Other Linux tools
Create a folder to store screenshots in (i.e.  ~/screenshots)

`$ gnome-screenshot -w -B -f ~/screenshots/$(date '+%Y-%m-%d_%H-%M-%S').png`


