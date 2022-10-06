padding=100;


%% experiment2
cd('/Users/jiangyong/attention_result/result_summary/2location/exp_data')
 subjlist = {'caihailan';'lindapeng';'hehuixia';'jiaxiamin';'lanmengying';...
 'xunyihao';'yinshanshan';'liuqixin';...
 'maxueting';'wangyidan';'liuqixin2';'yanghongkun';'zhanghuanyu';'zhangna';'zhaobo';'fengxue';'yangyiqing'
 };

leath=length(subjlist);
%subjlist_angle_location1=zeros(leath,1);
%subjlist_angle_location2=zeros(leath,1);


subjlist_freq_location2=zeros(leath,1);
maxfreq=zeros(leath,1);
%location2=2;location1=1;
p=zeros(leath,1);
timepoint=77*2;
frequencepoint=padding;
for k=1:leath
%i=4;
[~, b]=cal_acc_timecourse_RT_50smooth_2location(subjlist{k});
;
data_link = jy_rt_analysis_timecourselink(detrend(b));
cue1=data_link;

xcue1=zeros(1,3);
xcue1(1,:)=polyfit([10:10:timepoint*10]',cue1(:,1),2);
ycue1=zeros(timepoint,1);


    for j=10:10:timepoint*10

        ycue1((j/10),1)=xcue1(1,1)*j*j+xcue1(1,2)*j+xcue1(1,3);


    end
cue1=cue1-ycue1;



f=(0:padding-1)*100/padding;
%f=[0:99]*100/100;
fft_result_det_detrend_single_link=fft(cue1.*hanning(timepoint),frequencepoint);
absfftlpcue=abs(fft_result_det_detrend_single_link);
f_link=(0:frequencepoint-1)*100/frequencepoint;



 num=find(f>3.9&f<7.1);
 [amp,freq]=max(absfftlpcue(num',1));
point_position=num(freq);
%point_position=6;
p(k)=point_position;
frequence=f(point_position);
maxfreq(k)=frequence;
ang=angle(fft_result_det_detrend_single_link);




subjlist_freq_location2(k,1)=frequence;
end

leath=length(subjlist);
subjlist_angle_location1=zeros(leath,1);
subjlist_angle_location2=zeros(leath,1);


subjlist_freq_location2=zeros(leath,1);
maxfreq=zeros(leath,1);
location2=2;location1=1;
for k=1:leath
%i=4;
[a ~]=cal_acc_timecourse_RT_50smooth_2location(subjlist{k});
cue1 = detrend(a) ;


xcue1=zeros(3,3);
xcue1(1,:)=polyfit((320:10:1080)',cue1(:,1),2);
xcue1(2,:)=polyfit((320:10:1080)',cue1(:,2),2);

ycue1=zeros(77,2);
for i=1:2
   
    for j=320:10:1080
        
        ycue1((j/10-31),i)=xcue1(i,1)*j*j+xcue1(i,2)*j+xcue1(i,3);

        
    end
   
end
cue1=cue1-ycue1;


hanningcue1=cue1.*[hanning(77),hanning(77)];
fftlpcue=fft(hanningcue1,padding);
absfftlpcue=abs(fftlpcue);
f=(0:padding-1)*100/padding;
point_position=p(k);
frequence=f(point_position);
maxfreq(k)=frequence;
ang=angle(fftlpcue);
subjlist_angle_location1(k,1)=ang(point_position,location1);
subjlist_angle_location2(k,1)=ang(point_position,location2);




subjlist_freq_location2(k,1)=frequence;
end
a=subjlist_angle_location1-subjlist_angle_location2;
[~,~]=phase_vector_cacular(a);
%% experiment3
cd('/Users/jiangyong/attention_result/result_summary/3location/3location_cue_exp')
subjlist = {'hehuixia';'jiaxiamin';'sundongbiao';'zhangpeng';'dawei';...
'wangyajian';'zhangmengyu';'wangxinle';'lanmengying';'songyunjie';'wangyidan';'sujingjing';
};

%cd('/Users/jiangyong/attention_result/3location_cue_exp')
leath=length(subjlist);

maxfreq=zeros(leath,1);
%location2=2;location3=3;location1=1
timepoint=77*3;
frequencepoint=padding;
p=zeros(leath,1);
for k=1:leath
%i=4;
[~, b]=cal_acc_timecourse_RT_50smooth_cue12(subjlist{k});
%cue1=detrend(b)
data_link = jy_rt_analysis_timecourselink(detrend(b));
cue1=data_link;

xcue1=zeros(1,3);
xcue1(1,:)=polyfit((10:10:timepoint*10)',cue1(:,1),2);
ycue1=zeros(timepoint,1);


    for j=10:10:timepoint*10

        ycue1((j/10),1)=xcue1(1,1)*j*j+xcue1(1,2)*j+xcue1(1,3);


    end
cue1=cue1-ycue1;
f=(0:padding-1)*100/padding;

fft_result_det_detrend_single_link=fft(cue1.*hanning(timepoint),frequencepoint);
absfftlpcue=abs(fft_result_det_detrend_single_link);
f_link=(0:frequencepoint-1)*100/frequencepoint;

%
num=find(f>1.98&f<5.1);
[amp,freq]=max(absfftlpcue(num',1));
point_position=num(freq);
p(k)=point_position;

frequence=f(point_position);
maxfreq(k)=frequence;
ang=angle(fft_result_det_detrend_single_link);

end

leath=length(subjlist);
subjlist_angle_location1=zeros(leath,1);
subjlist_angle_location2=zeros(leath,1);
subjlist_angle_location3=zeros(leath,1);

subjlist_freq_location2=zeros(leath,1);
maxfreq=zeros(leath,1);
location2=2;location3=3;location1=1;
for k=1:leath
%i=4;
[~,b]=cal_acc_timecourse_RT_50smooth_cue12(subjlist{k});
cue1=zscore(b);


xcue1=zeros(4,3);
xcue1(1,:)=polyfit((320:10:1080)',cue1(:,1),2);
xcue1(2,:)=polyfit((320:10:1080)',cue1(:,2),2);
xcue1(3,:)=polyfit((320:10:1080)',cue1(:,3),2);
ycue1=zeros(77,3);
for i=1:3
  
    for j=320:10:1080        
        ycue1((j/10-31),i)=xcue1(i,1)*j*j+xcue1(i,2)*j+xcue1(i,3);
    end
  
end
cue1=cue1-ycue1;


hanningcue1=cue1.*[hanning(77),hanning(77),hanning(77)];
fftlpcue=fft(hanningcue1,padding);
absfftlpcue=abs(fftlpcue);
f=(0:padding-1)*100/padding;

%

point_position=p(k);
frequence=f(point_position);
maxfreq(k)=frequence;
ang=angle(fftlpcue);
subjlist_angle_location1(k,1)=ang(point_position,location1);
subjlist_angle_location2(k,1)=ang(point_position,location2);
subjlist_angle_location3(k,1)=ang(point_position,location3);

subjlist_freq_location2(k,1)=frequence;
end
a=subjlist_angle_location1-subjlist_angle_location2;
[~,~]=phase_vector_cacular(a);

%% experiment4

cd('/Users/jiangyong/attention_result/result_summary/4location/expdata')

subjlist = {'daiwei';'huanglei';'fukangwei';'xunyihao';'yangxiulong';'linweiru'...
    ;'wangsu';'wangjin';'lixueying';'duyuxin';'hehuixia';
   'wangziwei';'zhangxiaoying';'liuyanchun';'lizhen';'jiaxiamin';'yuguimei'};

leath=length(subjlist);
maxfreq=zeros(leath,1);
timepoint=77*4;
frequencepoint=padding;
p=zeros(leath,1);
for k=1:leath
[~ ,b]=cal_acc_timecourse_RT_50smooth_4location_heng(subjlist{k});


cue1=detrend(b);

% xcue1=zeros(4,3);
% xcue1(1,:)=polyfit([320:10:1080]',cue1(:,1),2);
% xcue1(2,:)=polyfit([320:10:1080]',cue1(:,2),2);
% xcue1(3,:)=polyfit([320:10:1080]',cue1(:,3),2);
% xcue1(4,:)=polyfit([320:10:1080]',cue1(:,4),2);
% ycue1=zeros(77,4);
% for i=1:4
%    
%     for j=320:10:1080
%         
%         ycue1((j/10-31),i)=xcue1(i,1)*j*j+xcue1(i,2)*j+xcue1(i,3);
% 
%         
%     end
%    
% end
% cue1=cue1-ycue1;
% 


data_link = jy_rt_analysis_timecourselink(detrend(cue1));
cue1=data_link;

xcue1=zeros(1,3);
xcue1(1,:)=polyfit((10:10:timepoint*10)',cue1(:,1),2);
ycue1=zeros(timepoint,1);


    for j=10:10:timepoint*10

        ycue1((j/10),1)=xcue1(1,1)*j*j+xcue1(1,2)*j+xcue1(1,3);


    end
cue1=cue1-ycue1;
f=(0:padding-1)*100/padding;
fft_result_det_detrend_single_link=fft(cue1.*hanning(timepoint),frequencepoint);
absfftlpcue=abs(fft_result_det_detrend_single_link);
f_link=(0:frequencepoint-1)*100/frequencepoint;
num=find(f>1.98&f<5.1);
[amp,freq]=max(absfftlpcue(num',1));
point_position=num(freq);
p(k)=point_position;
frequence=f(point_position);
maxfreq(k)=frequence;
ang=angle(fft_result_det_detrend_single_link);

end


leath=length(subjlist);
subjlist_angle_location1=zeros(leath,1);
subjlist_angle_location2=zeros(leath,1);
subjlist_angle_location3=zeros(leath,1);
subjlist_angle_location4=zeros(leath,1);
subjlist_freq_location2=zeros(leath,1);
maxfreq=zeros(leath,1);
location2=2;location3=3;location1=1;location4=4;
for k=1:leath
%i=4;
[~, b]=cal_acc_timecourse_RT_50smooth_4location_heng(subjlist{k});
cue1=detrend(b);

xcue1=zeros(4,3);
xcue1(1,:)=polyfit((320:10:1080)',cue1(:,1),2);
xcue1(2,:)=polyfit((320:10:1080)',cue1(:,2),2);
xcue1(3,:)=polyfit((320:10:1080)',cue1(:,3),2);
xcue1(4,:)=polyfit((320:10:1080)',cue1(:,4),2);
ycue1=zeros(77,4);
for i=1:4
   
    for j=320:10:1080
        
        ycue1((j/10-31),i)=xcue1(i,1)*j*j+xcue1(i,2)*j+xcue1(i,3);

        
    end
   
end
cue1=cue1-ycue1;
hanningcue1=cue1.*[hanning(77),hanning(77),hanning(77),hanning(77)];
fftlpcue=fft(hanningcue1,padding);
absfftlpcue=abs(fftlpcue);
f=(0:padding-1)*100/padding;
point_position=p(k);
frequence=f(point_position);
maxfreq(k)=frequence;
ang=angle(fftlpcue);
subjlist_angle_location1(k,1)=ang(point_position,location1);
subjlist_angle_location2(k,1)=ang(point_position,location2);
subjlist_angle_location3(k,1)=ang(point_position,location3);
subjlist_angle_location4(k,1)=ang(point_position,location4);
subjlist_freq_location2(k,1)=frequence;
end
 a=subjlist_angle_location2-subjlist_angle_location1;
 b=subjlist_angle_location3-subjlist_angle_location1;
c=subjlist_angle_location4-subjlist_angle_location1;
[~,~]=phase_vector_cacular(a);
[~,~]=phase_vector_cacular(b);
[~,~]=phase_vector_cacular(c);







