function [ave_rate] = fcn_rate_calculate_with_PER(record_SINR, snrtable, packet_size, target_PER)
%FCN_RATE_CALCULATE_WITH_BER Summary of this function goes here
%   Calculate Rate according to SINR and BER

rate_byte_per_sec = [3 4.5 6 9 12 18 24 27].*(1024 ^ 2)/8;
rate_time_cost = packet_size./rate_byte_per_sec;

real_PER_up = 0;
real_PER_down = 0;
packet_error_penalty=0;

ave_rate=zeros(1,3);
ave_time_cost=zeros(size(record_SINR,2),2); % column1: uplink time spend column2: down link time spend
ave_success_transmit=zeros(size(record_SINR,2),2);

for t=1:size(record_SINR,2)    
    Rate_idx_up = 1;
    Rate_idx_down = 1;
    %% estimate rate for up-link
    temp_idx = find(snrtable(:,1) <= record_SINR(3,t), 8, 'last');
    if size(temp_idx, 1) == 0
        real_PER_up = 1;
    else
        for i=size(temp_idx, 1):-1:1
            temp_per = 1 - snrtable(temp_idx(i,1), 3);
            
            if temp_per <= target_PER
                Rate_idx_up = i;                
                real_PER_up = temp_per;                
                break;
            end
        end
    end
    
    %% estimate rate for down-link
    temp_idx = find(snrtable(:,1) <= record_SINR(4,t), 8, 'last');
    if size(temp_idx, 1) == 0
        real_PER_down = 1;
    else
        for i=size(temp_idx, 1):-1:1
            temp_per = 1 - snrtable(temp_idx(i,1), 3);
            
            if temp_per <= target_PER
                Rate_idx_down = i;
                real_rate_idx = find(snrtable(:,1) <= record_SINR(2,t), 1, 'last') - 8 + Rate_idx_down;
                if size(real_rate_idx, 1) == 0
                    real_PER_down = 1;
                else
                    real_PER_down = 1 - snrtable(real_rate_idx, 3);
                end
                break;
            end
        end
    end
    
    if record_SINR(1,t)~=0&&record_SINR(2,t)~=0 % up and down link simultaneously 
        ave_success_transmit(t,1)=randsrc(1,1,[1 0; 1-real_PER_up real_PER_up]);
        ave_success_transmit(t,2)=randsrc(1,1,[1 0; 1-real_PER_down real_PER_down]);
        if ave_success_transmit(t,1) == 1
            ave_time_cost(t,1)=rate_time_cost(Rate_idx_up);
        else
            ave_time_cost(t,1)=rate_time_cost(Rate_idx_up) + packet_error_penalty;
        end
        
        if ave_success_transmit(t,2) == 1
            ave_time_cost(t,2)=rate_time_cost(Rate_idx_down);
        else
            ave_time_cost(t,2)=rate_time_cost(Rate_idx_down) + packet_error_penalty;
        end
        
    elseif record_SINR(1,t)==0&&record_SINR(2,t)~=0 % only downlink
        ave_success_transmit(t,2)=randsrc(1,1,[1 0; 1-real_PER_down real_PER_down]);
        if ave_success_transmit(t,2) == 1
            ave_time_cost(t,2)=rate_time_cost(Rate_idx_down);
        else
            ave_time_cost(t,2)=rate_time_cost(Rate_idx_down) + packet_error_penalty;
        end
    elseif record_SINR(1,t)~=0&&record_SINR(2,t)==0% only uplink
        ave_success_transmit(t,1)=randsrc(1,1,[1 0; 1-real_PER_up real_PER_up]);
        if ave_success_transmit(t,1) == 1
            ave_time_cost(t,1)=rate_time_cost(Rate_idx_up);
        else
            ave_time_cost(t,2)=rate_time_cost(Rate_idx_down) + packet_error_penalty;
        end
    end
    
end
if sum(packet_size.*ave_success_transmit(:,1)) == 0
    ave_rate(1,2) = 0;
else
    ave_rate(1,2)=sum(packet_size.*ave_success_transmit(:,1)) / sum(ave_time_cost(:,1)) / (1024^2) * 8;
end

if sum(packet_size.*ave_success_transmit(:,2)) == 0
    ave_rate(1,3) = 0;
else
    ave_rate(1,3)=sum(packet_size.*ave_success_transmit(:,2)) / sum(ave_time_cost(:,2)) / (1024^2) * 8;
end

ave_rate(1,1)=ave_rate(1,2) + ave_rate(1,3);
end
