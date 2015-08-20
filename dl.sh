#!/bin/bash
THIS_HOUR=$(date +%Y%m%d/%H)
DIR=~/data/$THIS_HOUR
mkdir -p $DIR
cd $DIR
#SIGMETS/AIRMETS
wget http://aviationweather.gov/adds/data/airmets/airmets_ALL.gif
wget http://aviationweather.gov/adds/data/airmets/airmets_ASH.gif
wget http://aviationweather.gov/adds/data/airmets/airmets_CB.gif
wget http://aviationweather.gov/adds/data/airmets/airmets_IC.gif
wget http://aviationweather.gov/adds/data/airmets/airmets_IF.gif
wget http://aviationweather.gov/adds/data/airmets/airmets_TB.gif

# G-AIRMETS
wget http://aviationweather.gov/data/products/gairmet/combined/datestamplist.txt
DATESTAMP=$(tail -n 1 datestamplist.txt)
wget -O us_FZLVL.gif http://aviationweather.gov/data/products/gairmet/combined/${DATESTAMP}_us_FZLVL.gif
wget -O us_ICE.gif http://aviationweather.gov/data/products/gairmet/combined/${DATESTAMP}_us_ICE.gif
wget -O us_SIERRA.gif http://aviationweather.gov/data/products/gairmet/combined/${DATESTAMP}_us_SIERRA.gif
wget -O us_TANGO.gif http://aviationweather.gov/data/products/gairmet/combined/${DATESTAMP}_us_TANGO.gif

#csv data
wget http://aviationweather.gov/adds/data/dataserver_current/aircraftreports.cache.csv.gz
wget http://aviationweather.gov/adds/data/dataserver_current/airsigmets.cache.csv.gz
wget http://aviationweather.gov/adds/data/dataserver_current/metars.cache.csv.gz
wget http://aviationweather.gov/adds/data/dataserver_current/tafs.cache.csv.gz

#text data
wget http://weather.noaa.gov/pub/data/raw/fb/fbus31.kwno.fd1.us1.txt

#prognosis
wget http://aviationweather.gov/adds/data/progs/hpc_sfc_analysis.gif
wget http://aviationweather.gov/adds/data/progs/hpc_12_fcst.gif
wget http://aviationweather.gov/adds/data/progs/hpc_24_fcst.gif

#radar
wget http://aviationweather.gov/adds/data/radar/adds_radar_nav.gif

#satelite
wget http://aviationweather.gov/adds/data/satellite/latest_STL_ir.jpg
wget http://aviationweather.gov/adds/data/satellite/latest_STL_irbw.jpg
wget http://aviationweather.gov/adds/data/satellite/latest_STL_vis.jpg
wget http://aviationweather.gov/adds/data/satellite/latest_STL_wv.jpg

# kml (spatial files e.g. google earth)
wget http://sggate.arc.nasa.gov:9518/GoogleEarth/tfr.kml

# radar overlay
wget --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36" -O radar_overlay_WA.gif "http://radblast.wunderground.com/cgi-bin/radar/WUNIDS_composite?maxlat=48.317724952092306&maxlon=-120.3338012658625&minlat=46.48685789290718&minlon=-124.24768066064074&height=985&width=1425&type=00Q&frame=0&num=1&delay=25&png=0&min=0&rainsnow=1&nodebug=0&theext=.gif&timelabel=1&timelabel.x=673&timelabel.y=973&brand=wundermap&smooth=1&radar_bitmap=1&noclutter=1&noclutter_mask=1&cors=1&reproj.automerc=1"
wget --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36" -O IR_overlay_WA.gif "http://wublast.wunderground.com/cgi-bin/WUBLAST?maxlat=48.317724952092306&maxlon=-120.3338012658625&minlat=46.48685789290718&minlon=-124.24768066064074&key=sat_ir4&frame=0&height=985&width=1425&delay=25&merge=elev&min=2&noclutter=0&nodebug=0&num=1&png=0&timelabel=1&timelabel.x=673&timelabel.y=973&gtt=120"

cd ~/data
gsutil -m rsync -r . gs://av-weather/
cd ~/
rm -rf ~/data
