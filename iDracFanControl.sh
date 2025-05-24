source ip.env
echo "Enter the Fan Speed:"
read fanspeed

printf -v hexFanSpeed '%x\n' ${fanspeed}
ipmitool -I lanplus -H ${iDracIP} -U ${iDracUser} -P ${iDracPassword} raw 0x30 0x30 0x01 0x00
ipmitool -I lanplus -H ${iDracIP} -U ${iDracUser} -P ${iDracPassword} raw 0x30 0x30 0x02 0xFF 0x${hexFanSpeed}

echo "Fan speed set to ${fanspeed}"
