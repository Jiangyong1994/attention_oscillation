padding=100;

%% 2 location fft
cd('/Users/jiangyong/attention_result/result_summary/2location/exp_data');
 subjlist = {'caihailan';'lindapeng';'hehuixia';'jiaxiamin';'lanmengying';...
 'xunyihao';'yinshanshan';'liuqixin';...
 'maxueting';'wangyidan';'liuqixin2';'yanghongkun';'zhanghuanyu';'zhangna';'zhaobo';'fengxue';'yangyiqing'
 };

n_subj=length(subjlist); 
acc=zeros(n_subj,2);
leath=n_subj;
result_undet={};
result={};
result_nosmooth={};

for i=1:n_subj
    [a b]=cal_acc_timecourse_RT_50smooth_2location(subjlist{i});
    result{i}=a;
    result_det{i}=b;
    result_det_detrend{i}=detrend(b);
    result_det_zscore{i}=zscore(b);
    result_undet{i}=detrend(a);
    acc(i,:)=cal_acc_sum(subjlist{i});
    [a b]=cal_acc_timecourse_RT_2location(subjlist{i});
    result_nosmooth{i}=a;
end
x_label=320:10:1080;
sum=zeros(77,2);
for i=1:n_subj
   sum=sum+result_undet{i};
end
result_undet_ave=sum/n_subj;
sum=zeros(77,2);
for i=1:n_subj
   sum=sum+result{i};  
end
result_ave=sum/n_subj;

sum=zeros(77,2);
for i=1:n_subj
   sum=sum+detrend(result_det{i});  
end
result_det_noliner_ave=sum/n_subj;

xparameter2=zeros(2,3);
result_ave_detrend=detrend(result_ave);
xparameter2(1,:)=polyfit([320:10:1080]',result_ave_detrend(:,1),2);
xparameter2(2,:)=polyfit([320:10:1080]',result_ave_detrend(:,2),2);
y_2ndpolyfit=zeros(77,2);
for i=1:2
   
    for j=320:10:1080
        
        y_2ndpolyfit((j/10-31),i)=xparameter2(i,1)*j*j+xparameter2(i,2)*j+xparameter2(i,3);

        
    end
   
end

kkk=result_ave_detrend-y_2ndpolyfit;

%data_link = jy_rt_analysis_timecourselink(result_det_noliner_ave);
kkk2=[kkk(:,2),kkk(:,1)];
data_link = jy_rt_analysis_timecourselink(kkk2);
data_link=detrend(data_link);
[timepoint,~]=size(data_link);

cue1=data_link;

xcue1=zeros(1,3);
xcue1(1,:)=polyfit([10:10:timepoint*10]',cue1(:,1),2);


ycue1=zeros(timepoint,1);

   
    for j=10:10:timepoint*10
        
        ycue1((j/10),1)=xcue1(1,1)*j*j+xcue1(1,2)*j+xcue1(1,3);

        
    end
   

cue1=cue1-ycue1;
freqpoint=77*2;
fft_data_link=fft(cue1.*hanning(timepoint),freqpoint);
f_link=[0:freqpoint-1]*100/freqpoint;
figure
plot(f_link,abs(fft_data_link))
xlim([2,12])
%% 3 location fft
cd('/Users/jiangyong/attention_result/result_summary/3location/3location_cue_exp')
subjlist = {'hehuixia';'jiaxiamin';'sundongbiao';'zhangpeng';'dawei';...
'wangyajian';'zhangmengyu';'wangxinle';'lanmengying';'songyunjie';'wangyidan';'sujingjing';
};

n_subj=length(subjlist); 
leath=n_subj;
result_undemean={};
result={};

result_nosmooth={};
for i=1:n_subj
    [a b]=cal_acc_timecourse_RT_50smooth(subjlist{i});
    result{i}=a;
    result_undemean{i}=detrend(a);
    result_det{i}=b;                    
    result_det_detrend{i}=detrend(b);
    [a b]=cal_acc_timecourse_RT_cue12(subjlist{i});
    result_nosmooth{i}=a;
end
x_label=320:10:1080;

sum=zeros(77,3);
for i=1:n_subj
   sum=sum+result_det{i};  
end
result_det_ave=sum/n_subj;


sum=zeros(77,3);
for i=1:n_subj
   sum=sum+detrend(result_det{i});  
end
result_det_noliner_ave=sum/n_subj;
% 
% 
 result_det_ave_nonliner=detrend(result_det_ave);
% 
% 
cue1=detrend(result_det_ave_nonliner);

xcue1=zeros(3,3);
xcue1(1,:)=polyfit([320:10:1080]',cue1(:,1),2);
xcue1(2,:)=polyfit([320:10:1080]',cue1(:,2),2);
xcue1(3,:)=polyfit([320:10:1080]',cue1(:,3),2);

ycue1=zeros(77,3);
for i=1:3
   
    for j=320:10:1080
        
        ycue1((j/10-31),i)=xcue1(i,1)*j*j+xcue1(i,2)*j+xcue1(i,3);

        
    end
   
end
cue1=cue1-ycue1;
result_det_ave_nonliner=cue1;



%
result_det_ave_nonliner=detrend(result_det_ave_nonliner);

data_link = jy_rt_analysis_timecourselink(result_det_ave_nonliner);
data_link=detrend(data_link);
[timepoint,~]=size(data_link);
cue1=data_link;
xcue1=zeros(1,3);
xcue1(1,:)=polyfit([10:10:timepoint*10]',cue1(:,1),2);
ycue1=zeros(timepoint,1);
    for j=10:10:timepoint*10
        
        ycue1((j/10),1)=xcue1(1,1)*j*j+xcue1(1,2)*j+xcue1(1,3);

        
    end
cue1=cue1-ycue1;
freqpoint=231;
fft_data_link=fft(cue1.*hanning(timepoint),freqpoint);
f_link=[0:freqpoint-1]*100/freqpoint;
figure
plot(f_link,abs(fft_data_link))
xlim([2,12])
%% 4 location fft

cd('/Users/jiangyong/attention_result/result_summary/4location/expdata')
 subjlist = {'daiwei';'huanglei';'fukangwei';'xunyihao';'yangxiulong';'linweiru'...
     ;'wangsu';'wangjin';'lixueying';'duyuxin';'hehuixia';
     'liuyanchun';'lizhen';'chengman2';'yuguimei';'wangziwei2';'jiaxiamin';};


n_subj=length(subjlist);
leath=n_subj;
result_undemean={};
result={};
result_det_loca34={};
result_nosmooth={};
for i=1:n_subj
    [a b c]=cal_acc_timecourse_RT_50smooth_4location_heng(subjlist{i});
    result{i}=a;
    result_undemean{i}=detrend(a);
    result_det{i}=b;
    result_det_detrend{i}=detrend(b);
    result_det_zscore{i}=zscore(b);
    result_det_loca34{i}=c;        

 	[a b]=cal_acc_timecourse_RT_4location_heng(subjlist{i});
    result_nosmooth{i}={a};
end
x_label=320:10:1080;
sum=zeros(77,4);
for i=1:n_subj
    sum=sum+result{i};
end
result_ave=sum/n_subj;

sum=zeros(77,4);
for i=1:n_subj
    sum=sum+detrend(result_det{i});
end
sum=zeros(77,4);
for i=1:n_subj
   sum=sum+result_det{i};  
end
result_det_ave=sum/n_subj;

result_det_noliner_ave=detrend(result_det_ave);


cue1=detrend(result_det_noliner_ave);

xcue1=zeros(4,3);
xcue1(1,:)=polyfit([320:10:1080]',cue1(:,1),2);
xcue1(2,:)=polyfit([320:10:1080]',cue1(:,2),2);
xcue1(3,:)=polyfit([320:10:1080]',cue1(:,3),2);
xcue1(4,:)=polyfit([320:10:1080]',cue1(:,4),2);
ycue1=zeros(77,4);
for i=1:4
   
    for j=320:10:1080
        
        ycue1((j/10-31),i)=xcue1(i,1)*j*j+xcue1(i,2)*j+xcue1(i,3);

        
    end
   
end
result_det_noliner_ave=cue1-ycue1;



data_link = jy_rt_analysis_timecourselink(result_det_noliner_ave);
data_link=detrend(data_link);
[timepoint,~]=size(data_link);

cue1=data_link;

xcue1=zeros(1,3);
xcue1(1,:)=polyfit([10:10:timepoint*10]',cue1(:,1),2);


ycue1=zeros(timepoint,1);

   
    for j=10:10:timepoint*10
        
        ycue1((j/10),1)=xcue1(1,1)*j*j+xcue1(1,2)*j+xcue1(1,3);

        
    end
   

cue1=cue1-ycue1;
fft_data_link=fft(cue1.*hanning(timepoint),timepoint);
%fft_data_link=fft(cue1,timepoint);
f_link=[0:timepoint-1]*100/timepoint;
figure
plot(f_link,abs(fft_data_link))
xlim([2,12])