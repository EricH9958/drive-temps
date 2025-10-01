# drive-temps

A script to allow live updating applets for monitoring drive temperatures in the Homarr dashboard.

## Overview

This project provides scripts and configuration files to monitor hard drive temperatures in real-time and display them in the Homarr dashboard applets.

## Features

- Live updating drive temperature display
- Easy integration with Homarr dashboard
- Simple setup using Docker Compose
- Configurable refresh intervals

## Included Files

- get-drive-temps.sh: Script to collect drive temperature data
- docker-compose.yml: Service configuration
- index.html: Web interface for displaying temperatures
- nginx.conf: Web server config
- drive_temps.txt: Temperature data output

## Installation

1. Clone the repository
2. Customize configuration if necessary
3. Run `docker-compose up -d` to start the service
4. Add the applet URL to your Homarr dashboard


## Drive Temperatures Widget Timestamp Format

- The widget now displays the “Last updated:” label and the timestamp on separate lines for improved readability in narrow views.
- This requires the `drive_temps.txt` file to have two lines for the timestamp section:
Last updated:
2025-10-01 10:56:01

text

- The index.html script has been updated to parse and show these two lines correctly.



## Usage

The script runs periodically inside the container and updates data for display.

## License

Licensed under GNU GPL v3.0 License.

## Contributing

Contributions & issues welcome. Please open issues or pull requests on GitHub.

---

Thank you for using drive-temps!

