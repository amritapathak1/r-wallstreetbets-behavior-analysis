# Midway

## Login Node

From Local Machine:
```
ssh amritap1@midway3.rcc.uchicago.edu
```

## Compute Node

From Login Node:
```
sinteractive --account=macs40123 --partition=caslake --time=03:00:00 --nodes=2 --ntasks=15 --cpus-per-task=1 --mem=150G
```

## SSH tunneling

To connect to jupyter lab running in compute node from local machine without VPN, run this on local machine:

(Replace <HOST_IP> with the compute node host ip)
```
ssh -v -N -f -L 15021:<HOST_IP>:15021 amritap1@midway3.rcc.uchicago.edu
```
