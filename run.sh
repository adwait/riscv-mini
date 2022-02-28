
TESTFILE=$1
TRACEFILE=$2

./VTile $TESTFILE 2> traces/$TRACEFILE

sed -i '1s/^/from traceanalyze import * \n/' traces/$TRACEFILE
