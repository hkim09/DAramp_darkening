# DAramp_darkening

This dataset was used to generate Figure 5 and Figure S3.
Please check https://github.com/hkim09/DAramp_darkening for dataset in HDF5 format.

* /event : array of # of trial * # of events. First four events are [visual stimulus onset, Scene movement onset, visual stimulus offset].
* /lick: timestamps of licks (in milisecond)
* /loc: locomotion speed (cm/s, sampled at 200Hz)
* /fl : fiber fluorometry signal (z-scored, sampled at 200Hz)
* /grp_idx: experimental condition

plot_darkening_results.m plots population psths from the dataset.
