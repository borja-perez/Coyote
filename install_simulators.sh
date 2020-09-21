#/bin/bash!
threads=$1
if [ -z "$1" ]; then
	threads="1"
fi

cd riscv-isa-sim
git submodule update --init
cd ..

cd map
git submodule update --init
cd sparta
mkdir release
cd release
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j $threads

cd ..
mkdir debug
cd debug
cmake .. -DCMAKE_BUILD_TYPE=Debug
make -j $threads
