padding=100;

%% 2 location fft
cd('/Users/jiangyong/attention_result/result_summary/2location/exp_data');

subjlist = {'caihailan';'lindapeng';'hehuixia';'jiaxiamin';'lanmengying';...
 'xunyihao';'yinshanshan';'daiwei';...
 'maxueting';'wangyidan';'zhangmengyu';'zhangmingyue';'zhanghuanyu';'zhangna';'zhaobo';'fengxue';'yangyiqing'
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
mean(result_ave);
%去二次趋势
xparameter=zeros(2,3);
xparameter(1,:)=polyfit([320:10:1080]',result_undet_ave(:,1),2);
xparameter(2,:)=polyfit([320:10:1080]',result_undet_ave(:,2),2);
y_2ndpolyfit=zeros(77,2);
for i=1:2
   
    for j=320:10:1080
        
        y_2ndpolyfit((j/10-31),i)=xparameter(i,1)*j*j+xparameter(i,2)*j+xparameter(i,3);

        
    end
   
end
%figure
%plot(x_label,result_undet_ave-y_2ndpolyfit);
%plot(x_label,(result_undet_ave-y_2ndpolyfit)+mean(result_ave));
det=(result_undet_ave-y_2ndpolyfit)+mean(result_ave);


fft_result_det_detrend_single=fft(detrend(det).*[hanning(77),hanning(77)],padding);
f=[0:padding-1]*100/padding;
amp=abs(fft_result_det_detrend_single);


ave_fft=amp;

figure
plot(f,abs(fft_result_det_detrend_single))
xlim([1 12])

figure
mean_freq=mean(amp,2);
%mean_freq=amp(:,1)*0.7+amp(:,2)*0.3;
plot(f,mean_freq)
xlim([1 12])
%
a1=det(:,1);
a2=det(:,2);

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

%plot(320:10:1080,result_det_ave_nonliner+mean(result_ave))
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

fft_result_det_ave_noliner=fft(cue1.*[hanning(77),hanning(77),hanning(77)],padding);
f=[0:padding-1]*100/padding;

amp=abs(fft_result_det_ave_noliner);

figure
plot(f,abs(fft_result_det_ave_noliner))
xlim([1 12])

figure
mean_freq=mean(amp,2);
mean_freq=amp(:,1)*0.6+amp(:,2)*0.2+amp(:,3)*0.2;
plot(f,mean_freq)
xlim([1 12])
a1=cue1(:,1);
a2=cue1(:,2);
a3=cue1(:,3);
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

result_det_noliner_ave=sum/n_subj;

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
cue1=cue1-ycue1;

fft_result_det_ave_noliner=fft(cue1.*[hanning(77),hanning(77),hanning(77),hanning(77)],padding);
f=[0:padding-1]*100/padding;

amp=abs(fft_result_det_ave_noliner);
figure
plot(f,abs(fft_result_det_ave_noliner))
xlim([1 12])

figure
mean_freq=mean(amp,2);

%mean_freq=0.6*amp(:,1)+(0.4/3)*amp(:,2)+(0.4/3)*amp(:,3)+(0.4/3)*amp(:,4);
plot(f,mean_freq)
xlim([1 12])
a1=cue1(:,1);
a2=cue1(:,2);
a3=cue1(:,3);
a4=cue1(:,4);