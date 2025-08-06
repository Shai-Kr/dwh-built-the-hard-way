\# Paradox Repair Utility



This folder contains  

\* \*\*pdxrbld.exe\*\* – legacy Paradox table repair tool  

\* \*\*repair\_paradox\_tables.bat\*\* – automation script that runs the tool on every table in a chosen branch folder  



The goal is to verify and rebuild corrupted Paradox tables before the extraction packages start.  

The same process runs in the production SQL Agent job, but you can test it locally with the steps below.



\## How it works



1\. The batch file receives one argument, the full path of a branch folder that holds Paradox tables.  

2\. For every `.db` file it calls `pdxrbld.exe` in `AUTO` mode.  

&nbsp;  \* `AUTO` verifies the table and rebuilds only when errors are found.  

3\. A log file per table is created plus a summary `csv` that records the return code for quick review.



\## Quick start



```cmd

cd tools\\paradox\_repair

repair\_paradox\_tables.bat "D:\\Branches\\Branch01"



