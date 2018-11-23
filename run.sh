conan remove libA -f
conan remove libB -f

printf "************\n"
conan --version
printf "************\n"

printf "\n\n********* libA/1.0 **********\n\n"

cd libA
conan create . libA/1.0@demo/test
conan alias libA/1.latest@demo/test libA/1.0@demo/test
conan upload libA --all --confirm -r $1

printf "\n\n******** libB/1.0 ***********\n\n"

cd ../libB
conan create . libB/1.0@demo/test
conan alias libB/1.latest@demo/test libB/1.0@demo/test
conan upload libB --all --confirm -r $1

conan remove libB -f
conan remove libA -f

printf "\n\n******** install . **********\n\n"

cd ../project
conan install .

printf "\n\n******** libA/1.1 ***********\n\n"

cd ../libA
conan create . libA/1.1@demo/test

printf "\n\n******** libB/1.1 ***********\n\n"

cd ../libB
conan create . libB/1.1@demo/test
conan alias libB/1.latest@demo/test libB/1.1@demo/test
conan alias libA/1.latest@demo/test libA/1.1@demo/test

printf "\n\n******** install . -u ********\n\n"

cd ../project
conan install . -u

