# Traffic-watch

Traffic-get is a bash script that could helps you to get the traffic through a network interface for a period of time, defined in seconds. It is designed for Ubuntu 16.04 or later and uses the command Ifconfig.

The sctip is inspired by the question [How to get the current network traffic via the commandline in a simple format?](https://askubuntu.com/questions/974425/how-to-get-the-current-network-traffic-via-the-commandline-in-a-simple-format/974503#974503) of [AskUbuntu.com](https://askubuntu.com/). This script is based on the script [`traffic-watch`](https://github.com/pa4080/traffic-watch) are provided more explanations.

**1.** Place (or symlink) the executable script file `traffic-get` in `/usr/local/bin`, thus it will be available as shell command. Don't forget to make it executable. There is also an interactive installator **`install.bash`**.

    sudo touch /usr/local/bin/traffic-get
    sudo chmod +x /usr/local/bin/traffic-get
    sudo nano /usr/local/bin/traffic-get

**2.** Copy the script content below script's content and use in nano: Shift+Insert for paste; Ctrl+O and Enter for save; Ctrl+X for exit.

 Then place the content of [`traffic-get.bash`]() inside. 
