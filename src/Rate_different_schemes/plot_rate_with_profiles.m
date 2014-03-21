clear all
clc

load('Profiles.mat');

experiment_number = size(Profiles, 1);


for exper_idx=1:experiment_number
    % load simulation result
    result_path = strcat(Profiles(exper_idx, 1).log_path, 'SimulationResult');
    load(result_path);
    
    x=Profiles(exper_idx, 1).graph_X_axis_values;
        
    f1=figure;
    plot(x,ave_rate_DU_MAC_Power_Fair(:,1),'o-k',...
        x,ave_rate_DU_MAC_Power_Fair(:,4),'+-k',...
        x,ave_rate_DU_MAC_Power_Fair(:,7),'d-k',...
        x,ave_rate_DU_MAC_Power_Fair(:,10),'square-k',...
        x,ave_rate_DU_MAC_Power_Fair(:,13),'x-k',...
        x,ave_rate_DU_MAC_Power_Fair(:,16),'hexagram-k',...
        x,ave_rate_DU_with_channelgain(:,13),'^--r',...
        x,ave_rate_DU_with_channelgain(:,16),'V--r',...
        'MarkerSize', 10, 'linewidth', 1.5);
    set(gca,'FontSize',12)
    xlabel(Profiles(exper_idx, 1).graph_X_axis_title);
    ylabel(Profiles(exper_idx, 1).graph_Y_axis_title);
    legend('1db Perfect',...
        '2db Perfect',...
        '3db Perfect',...
        '1db History',...
        '2db History',...
        '3db History',...
        'Sum Rate Maximization',...
        'Half-Duplex',...
        'Location','NorthWest');
    grid on
    figure_savepath=strcat(Profiles(exper_idx, 1).log_path, 'rate_DU_with_PowerControl_sumv3_Fair');    
    saveas(f1,figure_savepath,'fig');
    saveas(f1,figure_savepath,'jpg');
    
    f2=figure;
    plot(x,ave_rate_DU_MAC_Power_Fair(:,2),'o-k',...
        x,ave_rate_DU_MAC_Power_Fair(:,5),'+-k',...
        x,ave_rate_DU_MAC_Power_Fair(:,8),'d-k',...
        x,ave_rate_DU_MAC_Power_Fair(:,11),'square-k',...
        x,ave_rate_DU_MAC_Power_Fair(:,14),'x-k',...
        x,ave_rate_DU_MAC_Power_Fair(:,17),'hexagram-k',...
        x,ave_rate_DU_with_channelgain(:,14),'^--r',...
        x,ave_rate_DU_with_channelgain(:,17),'V--r',...
        'MarkerSize', 10, 'linewidth', 1.5);
    set(gca,'FontSize',12)
    xlabel(Profiles(exper_idx, 1).graph_X_axis_title);
    ylabel(Profiles(exper_idx, 1).graph_Y_axis_title);
    %axis([x(1,1),x(1,end),0,15]);
    legend('1db Perfect',...
        '2db Perfect',...
        '3db Perfect',...
        '1db History',...
        '2db History',...
        '3db History',...
        'Sum Rate Maximization',...
        'Half-Duplex',...
        'Location','NorthWest');
    grid on
    figure_savepath=strcat(Profiles(exper_idx, 1).log_path, 'rate_DU_with_PowerControl_upv3_Fair');    
    saveas(f2,figure_savepath,'fig');
    saveas(f2,figure_savepath,'jpg');
    
    f3=figure;
    plot(x,ave_rate_DU_MAC_Power_Fair(:,3),'o-k',...
        x,ave_rate_DU_MAC_Power_Fair(:,6),'+-k',...
        x,ave_rate_DU_MAC_Power_Fair(:,9),'d-k',...
        x,ave_rate_DU_MAC_Power_Fair(:,12),'square-k',...
        x,ave_rate_DU_MAC_Power_Fair(:,15),'x-k',...
        x,ave_rate_DU_MAC_Power_Fair(:,18),'hexagram-k',...
        x,ave_rate_DU_with_channelgain(:,15),'^--r',...
        x,ave_rate_DU_with_channelgain(:,18),'V--r',...
        'MarkerSize', 10, 'linewidth', 1.5);
    set(gca,'FontSize',12)
    xlabel(Profiles(exper_idx, 1).graph_X_axis_title);
    ylabel(Profiles(exper_idx, 1).graph_Y_axis_title);
    %axis([x(1,1),x(1,end),0,15]);
    legend('1db Perfect',...
        '2db Perfect',...
        '3db Perfect',...
        '1db History',...
        '2db History',...
        '3db History',...
        'Sum Rate Maximization',...
        'Half-Duplex',...
        'Location','NorthWest');
    grid on
    figure_savepath=strcat(Profiles(exper_idx, 1).log_path, 'rate_DU_with_PowerControl_downv3_Fair');    
    saveas(f3,figure_savepath,'fig');
    saveas(f3,figure_savepath,'jpg');
    
    f4=figure;
    plot(x,ave_rate_DU_MAC_Power_UnFair(:,1),'o-k',...
        x,ave_rate_DU_MAC_Power_UnFair(:,4),'+-k',...
        x,ave_rate_DU_MAC_Power_UnFair(:,7),'d-k',...
        x,ave_rate_DU_MAC_Power_UnFair(:,10),'square-k',...
        x,ave_rate_DU_MAC_Power_UnFair(:,13),'x-k',...
        x,ave_rate_DU_MAC_Power_UnFair(:,16),'hexagram-k',...
        x,ave_rate_DU_with_channelgain(:,13),'^--r',...
        x,ave_rate_DU_with_channelgain(:,16),'V--r',...
        'MarkerSize', 10, 'linewidth', 1.5);
    set(gca,'FontSize',12)
    xlabel(Profiles(exper_idx, 1).graph_X_axis_title);
    ylabel(Profiles(exper_idx, 1).graph_Y_axis_title);
    %axis([x(1,1),x(1,end),0,15]);
    legend('1db Perfect UnFair',...
        '2db Perfect UnFair',...
        '3db Perfect UnFair',...  
        '1db Perfect UnFair',...
        '2db Perfect UnFair',...
        '3db Perfect UnFair',...    
        'Sum Rate Maximization',...
        'Half-Duplex',...
        'Location','NorthWest');
    grid on
    figure_savepath=strcat(Profiles(exper_idx, 1).log_path, 'rate_DU_with_PowerControl_sumv3_UnFair');    
    saveas(f4,figure_savepath,'fig');
    saveas(f4,figure_savepath,'jpg');
    
    f5=figure;
    plot(x,ave_rate_DU_MAC_Power_UnFair(:,2),'o-k',...
        x,ave_rate_DU_MAC_Power_UnFair(:,5),'+-k',...
        x,ave_rate_DU_MAC_Power_UnFair(:,8),'d-k',...
        x,ave_rate_DU_MAC_Power_UnFair(:,11),'square-k',...
        x,ave_rate_DU_MAC_Power_UnFair(:,14),'x-k',...
        x,ave_rate_DU_MAC_Power_UnFair(:,17),'hexagram-k',...
        x,ave_rate_DU_with_channelgain(:,14),'^--r',...
        x,ave_rate_DU_with_channelgain(:,17),'V--r',...
        'MarkerSize', 10, 'linewidth', 1.5);
    set(gca,'FontSize',12)
    xlabel(Profiles(exper_idx, 1).graph_X_axis_title);
    ylabel(Profiles(exper_idx, 1).graph_Y_axis_title);
    %axis([x(1,1),x(1,end),0,15]);
    legend('1db Perfect UnFair',...
        '2db Perfect UnFair',...
        '3db Perfect UnFair',...    
        '1db Perfect UnFair',...
        '2db Perfect UnFair',...
        '3db Perfect UnFair',...    
        'Sum Rate Maximization',...
        'Half-Duplex',...
        'Location','NorthWest');
    grid on
    figure_savepath=strcat(Profiles(exper_idx, 1).log_path, 'rate_DU_with_PowerControl_upv3_UnFair');    
    saveas(f5,figure_savepath,'fig');
    saveas(f5,figure_savepath,'jpg');
    
    f6=figure;
    plot(x,ave_rate_DU_MAC_Power_UnFair(:,3),'o-k',...
        x,ave_rate_DU_MAC_Power_UnFair(:,6),'+-k',...
        x,ave_rate_DU_MAC_Power_UnFair(:,9),'d-k',...
        x,ave_rate_DU_MAC_Power_UnFair(:,12),'square-k',...
        x,ave_rate_DU_MAC_Power_UnFair(:,15),'x-k',...
        x,ave_rate_DU_MAC_Power_UnFair(:,18),'hexagram-k',...
        x,ave_rate_DU_with_channelgain(:,15),'^--r',...
        x,ave_rate_DU_with_channelgain(:,18),'V--r',...
        'MarkerSize', 10, 'linewidth', 1.5);
    set(gca,'FontSize',12)
    xlabel(Profiles(exper_idx, 1).graph_X_axis_title);
    ylabel(Profiles(exper_idx, 1).graph_Y_axis_title);
    %axis([x(1,1),x(1,end),0,15]);
    legend('1db Perfect UnFair',...
        '2db Perfect UnFair',...
        '3db Perfect UnFair',...    
        '1db History UnFair',...
        '2db History UnFair',...
        '3db History UnFair',...    
        'Sum Rate Maximization',...
        'Half-Duplex',...
        'Location','NorthWest');
    grid on
    figure_savepath=strcat(Profiles(exper_idx, 1).log_path, 'rate_DU_with_PowerControl_downv3_UnFair');    
    saveas(f6,figure_savepath,'fig');
    saveas(f6,figure_savepath,'jpg');
    
    
    clear current_profile ave_rate_DU_MAC_Power_Fair ave_rate_DU_MAC_Power_UnFair ave_rate_DU_with_channelgain ave_rate_UD_with_channelgain
end