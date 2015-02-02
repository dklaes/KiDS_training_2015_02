# awk examples
# Read file exposures.txt and print only column 1 ($0 = all!).
awk '{print $1}' exposures.txt


# Print only those lines where the seeing is smaller than 0.8.
awk '($5<0.8) {print $0}' exposures.txt


# Print only those lines where the seeing in the r-band is smaller than 0.8.
awk '($5<0.8 && $7=="r") {print $0}' exposures.txt
awk '($7=="r" && $5<0.8) {print $0}' exposures.txt
# Which one is faster? Why?
# SEEING<0.8: 9204/17899
# r-band: 3709/17899


# sed example.
# Replace D3 with D99 .
sed 's/D3/D99/g' exposures.txt



# Pipelines
# Print only those lines which are in D3 and replace them with D99
awk '($2="D3") {print $0}' exposures.txt | sed 's/D3/D99/g'

# Same, but now save it to replaced.txt
awk '($2="D3") {print $0}' exposures.txt | sed 's/D3/D99/g' > replaced.txt



# Variables
FILTER="i"
SEEING=0.7

# Print only those lines with a seeing of 0.7 or smaller in the r-band.
awk -v FILTER=$FILTER -v SEEING=$SEEING \
     '($5<$SEEING && $7==$FILTER) {print $0}'
# Also possible to calculate e.g. mean with awk via a C-like script.
