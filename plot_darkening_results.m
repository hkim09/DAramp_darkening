%% reproduce basic results from public data file
% this script uses libkm toolbox (https://github.com/hkim09/libkm)
% 9/30/2021 HRK

fdir = 'data_folder';  
finfo = dir([fdir '*.h5']);

psths_lick = struct(); psths_loc = struct(); psths_neuron = struct();
for iF = 1:numel(finfo)
    h5_fpath = [fdir finfo(iF).name]
    d = load4public(h5_fpath, 0);
    
    % upsample locomotion and fluorometry
    d.loc = resample(d.loc, 10, 1);
    d.fl = resample(d.fl, 10, 1);
    
    figure;
    subplot(3,1,1);
    [~, psth_lick] = plot_timecourse('timestamp', d.lick, d.event(:,2), -2000, 13000, d.grp_idx, 'event', d.event(:,3), 'event_header','RewOn');
    subplot(3,1,2);
    [~, psth_loc] = plot_timecourse('stream', d.loc, d.event(:,2), -2000, 13000, d.grp_idx, 'event', d.event(:,3), 'event_header','RewOn');
    subplot(3,1,3);
    [~, psth_neuron] = plot_timecourse('stream', d.fl, d.event(:,2), -2000, 13000, d.grp_idx, 'event', d.event(:,3), 'event_header','RewOn');
    
    psths_lick.(sprintf('m%ds1r1', iF)) = psth_lick;
    psths_loc.(sprintf('m%ds1r1', iF)) = psth_loc;
    psths_neuron.(sprintf('m%ds1r1', iF)) = psth_neuron;
end

%% plot results
figure; 
subplot(3,1,1); plot_mpsths(psths_lick, 'event_header','RewOn');
subplot(3,1,2); plot_mpsths(psths_loc, 'event_header','RewOn');
subplot(3,1,3); plot_mpsths(psths_neuron, 'event_header','RewOn');
