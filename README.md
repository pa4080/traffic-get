# Traffic-get

Traffic-get is a bash script that could helps you to get the traffic through a network interface for a period of time, defined in seconds. It is designed for Ubuntu 16.04 or later and uses the command Ifconfig.

The sctip is inspired by the question [How to get the current network traffic via the commandline in a simple format?](https://askubuntu.com/questions/974425/how-to-get-the-current-network-traffic-via-the-commandline-in-a-simple-format/974503#974503) of [AskUbuntu.com](https://askubuntu.com/). This script is based on the script [`traffic-watch`](https://github.com/metalevel-tech/traffic-watch) are provided more explanations.

**1.** Place (or symlink) the executable script file `traffic-get` in `/usr/local/bin`, thus it will be available as shell command. Don't forget to make it executable. 

    sudo touch /usr/local/bin/traffic-get
    sudo chmod +x /usr/local/bin/traffic-get
    sudo nano /usr/local/bin/traffic-get

**2.** Then place the content of [`traffic-get.bash`](https://github.com/metalevel-tech/Traffic-get/blob/master/traffic-get.bash) inside. 

**!!!** Alternatively (to 1. and 2.) use the interactive installator **`install.bash`** that will do this job.

**3.** The script call syntax:

    traffic-get <interface name> <units of measurement> <period of measure> <type of the output>

<!-- -->

    traffic-get enp0s25 MiB 30 total

**4.** Input parameters:

- `<interface name>` use the command `ifconfig` to get the interface name. Default: `eth0`
- `<units of measurement>` available values: `B`, `KB`, `KiB`, `MB`, `Mib`, `Gb`, `Gib`. Default: `MB`
- `<period of measure>` in seconds. Default: `30` 
- `<type of the output>` available values: <code><strong>verb</strong>ose</code>, **`all`**, <code><strong>in</strong>coming</code>, <code><strong>out</strong>going</code>, <code><strong>tot</strong>al</code>.

**5.** Examples of usage:

![Examples of usages.](https://raw.githubusercontent.com/metalevel-tech/traffic-get/master/.images/traffic-get.demo.png)

References:

* [How to reset ifconfig counters?](https://askubuntu.com/questions/348038/how-to-reset-ifconfig-counters)
* [How to execute script when network interface is up?](https://askubuntu.com/questions/277284/execute-script-when-network-interface-is-up)
* [More about the calculations](https://unix.stackexchange.com/a/40787/201297)
* [How to get TX/RX bytes without `ifconfig`](https://serverfault.com/questions/533513/how-to-get-tx-rx-bytes-without-ifconfig)
* [**The connected project `traffic-watch`**](https://github.com/metalevel-tech/traffic-watch)

* [The 'proper' way to get ONLY my eth0 netmask via CLI in Ubuntu 18.04 on VPS?](https://askubuntu.com/a/1097891/566421)
