# Rapture Sentinel

Sentinel is an autonomous agent for persisting, processing and automating Rapture governance objects and tasks, and for expanded functions in the upcoming releases.

Sentinel is implemented as a Python application that binds to a local raptured instance on each Rapture Masternode.

This guide covers installing Sentinel onto an existing Masternode in Ubuntu 14.04 / 16.04.

## Installation

### NOTE: Please create a non-root user account for raptured and sentinel to run under. It is not advisable to run under root. If you do install as root, note that your homedir in Step 3 will be /root/sentinel rather than /home/USERNAME/sentinel


### 1. Install Prerequisites

Make sure Python version 2.7.x or above is installed:

    python --version

Update system packages and ensure virtualenv is installed:

    $ sudo apt-get update
    $ sudo apt-get -y install python-virtualenv

Make sure the local Rapture daemon running is at least version 1.0.0

    $ rapture-cli getinfo | grep version

### 2. Install Sentinel

Clone the Sentinel repo and install Python dependencies.

    $ git clone https://github.com/RaptureCore/sentinel.git && cd sentinel
    $ virtualenv ./venv
    $ ./venv/bin/pip install -r requirements.txt

### 3. Set up Cron

Set up a crontab entry to call Sentinel every minute:

    $ crontab -e

In the crontab editor, add the lines below, replacing '/home/YOURUSERNAME/sentinel' to the path where you cloned sentinel to:

    * * * * * cd /home/YOURUSERNAME/sentinel && ./venv/bin/python bin/sentinel.py >/dev/null 2>&1

### 4. Test the Configuration

REMOVING the test step as it's not currently necessary. When properly configured and with the masternode synced, running:
$ ./venv/bin/python bin/sentinel.py
will process for a few seconds and then return a blank output.

## Configuration

An alternative (non-default) path to the `rapture.conf` file can be specified in `sentinel.conf`:

    rapture_conf=/path/to/rapture.conf

## Troubleshooting

To view debug output, set the `SENTINEL_DEBUG` environment variable to anything non-zero, then run the script manually:

    $ SENTINEL_DEBUG=1 ./venv/bin/python bin/sentinel.py


### License

Released under the MIT license, under the same terms as RaptureCore itself. See [LICENSE](LICENSE) for more info.
