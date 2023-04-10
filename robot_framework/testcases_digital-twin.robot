*** Settings ***
Library         pyats.robot.pyATSRobot
Library         unicon.robot.UniconRobot
Library         genie.libs.robot.GenieRobot

Suite Setup    Run Keywords    use testbed "testbed_digital-twin.yaml"    AND    connect to all devices

*** Variables ***
@{DEVICES}         nxos01    nxos02    nxos03    nxos04
${VLAN_ID}         172
${VLAN_NAME}       VLAN172

*** Test Cases ***
Validate VLAN on device
    FOR    ${DEVICE}    IN    @{DEVICES}
        ${output}=      parse "show vlan" on device "${DEVICE}"
        ${response}=      dq query    data=${output}    filters=contains('${VLAN_ID}')
        Should Not Be Empty    ${response}    msg=VLAN not found
    END

Validate VLAN interface on device
    FOR    ${DEVICE}    IN    @{DEVICES}
        ${output}=      parse "show interface vlan 172" on device "${DEVICE}"
        Should be Equal    ${output}[Vlan172][link_state]    up 
        Should Not Be Empty    ${output}    msg=VLAN interface not found
    END