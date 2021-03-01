# Apply good practices to your template by using the ARM template test toolkit

## Set up your testing environment

The tool is a PowerShell script. To be able to run it, use the following steps:

1. Install the PowerShell 7.
1. Download the script. The script is hosted in a GitHub repository.
    1. Fetch it via a git clone command: `git clone https://github.com/Azure/arm-ttk.git`
1. Import the script. 
    1. `Import-Module path\to\arm-ttk\arm-ttk.psd1`