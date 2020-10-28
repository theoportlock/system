#!/bin/bash
git clone https://github.com/tpruvot/cpuminer-multi &&
cd cpuminer-multi &&
./build.sh &&
printf "#!/bin/bash\n./cpuminer -a sha256d -o stratum+tcp://connect.pool.bitcoin.com:3333 -u 1GebRmDgzHR5wnGjdVQdefPzu79bEZ9CTB -p c=BTC" > mine.sh &&
chmod a+x mine.sh &&
./mine.sh &
