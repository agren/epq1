# Enjoyable Police Quest 1

Enjoyable Police Quest is a set of patches for the AGI version of Police Quest 1. The aim of the patches is to remove sudden deaths and other irritating aspects of the game.
This repository does not contain the game itself. Only the patches and a makefile to apply the patches to an existing game.
This is still only an experiment and there are not a lot of patches.

## Features
* Remove the 13.00 briefing timer
* Don't allow Sonny to leave the police station if it results in death
* Disable car crashes in driving mode

## Requirements

* A modified version of AGIStudio with command line support currently found here: https://github.com/agren/agistudio/tree/add-command-line-options
* GNU Make
* Police Quest 1 AGI version (EGA version, not VGA version). At the time of writing GOG.com has a Police Quest collection for sale. SHA1 sums of a a few files from a version that is known to work:
    - e9bb52063f9b99bba8c1c092a0b1189c2ea44df6  VOL.0
    - 26be13fba7f8c6f82e17e1c53dfe9c499a66d46c  VOL.1
    - c0741cf39d305de743f36c41084c8f4dd72c0ee1  VOL.2
* This has only been tested on Linux. Your mileage on other platforms may vary.

## Usage

`make AGISTUDIO=path_to_the_modified_agistudio_binary PQ1_DIR=path_to_the_original_game`

If everything went well the patched game is located in build/epq1 and will run in ScummVM.

## License

This project is licensed under the GPL v3.0.
See LICENSE for details.
