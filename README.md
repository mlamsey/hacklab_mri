# Hackney Lab MRI Tools

Some helper scripts for connecting to the CSIC SOM server.

# Usage Instructions

1. Download this repository.
2. Run `connect_csic.sh` (unix) or `connect_cisc.bat` (Windows) to connect to the server.
3. See the SOP for MRI data access + QC in the Hackney Lab OneDrive for further instructions.

# Scripts

`connect_csic.sh` - run this on your local machine to SSH into the CSIC server with appropriate port forwarding on OSX / Linux.

`connect_csic.bat` - equivalent to above, but for Windows.

`launch_html_server.sh` - run this on the server while inside the directory `$HOME/hackney_share/PARTNER/derivatives` to launch the html server for viewing MRI documents.

`update_participant.sh` - helper script to set environment variables used by the MRI data processing + QC scripts
