*** Settings ***
# Importing test libraries, resource files and variable files.
Library        pyats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot

*** Variables ***
# Define the pyATS testbed file to use for this run
${testbed}     testbed_production.yaml

*** Test Cases ***
# Creating test cases from available keywords.

Connect
    # Initializes the pyATS/Genie Testbed
    use testbed "${testbed}"

    # Connect to both device
    connect to device "nxos01"
    connect to device "nxos02"
    connect to device "nxos03"
    connect to device "nxos04"
    
# Verify Interfaces
Verify the counts of 'up' Interace for nxos01
    verify count "8" "interface up" on device "nxos01"
Verify the counts of 'up' Interace for nxos02
    verify count "8" "interface up" on device "nxos02"
Verify the counts of 'up' Interace for nxos03
    verify count "8" "interface up" on device "nxos03"
Verify the counts of 'up' Interace for nxos04
    verify count "8" "interface up" on device "nxos04"