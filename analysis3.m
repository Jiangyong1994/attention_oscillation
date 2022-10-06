% check individual have different peak frequency at  different peak
padding=100;

%% 2 location
cd('/Users/jiangyong/attention_result/result_summary/2location/exp_data')
subjlist = {'caihailan';'lindapeng';'hehuixia';'jiaxiamin';'lanmengying';...
 'xunyihao';'yinshanshan';'liuqixin';...
 'maxueting';'wangyidan';'liuqixin2';'yanghongkun';'zhanghuanyu';'zhangna';'zhaobo';'fengxue';'yangyiqing'
 };

%cd('/Users/jiangyong/attention_result/2location_cue_exp/expdata')
leath=length(subjlist);

subjlist_freq_location1=zeros(leath,1);
subjlist_freq_location2=zeros(leath,1);
maxfreq=zeros(leath,1);
location2=2;location1=1;
for k=1:leath
%i=4;
[a b]=cal_acc_timecourse_RT_50smooth_2location(subjlist{k});
cue1 = detrend(a) ;


xcue1=zeros(3,3);
xcue1(1,:)=polyfit([320:10:1080]',cue1(:,1),2);
xcue1(2,:)=polyfit([320:10:1080]',cue1(:,2),2);

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
f=[0:padding-1]*(padding-1)/padding;
 %num=find(f>4&f<7);
 num=find(f>4&f<10);
 [amp1,freq1]=max(absfftlpcue(num',1));
  [amp2,freq2]=max(absfftlpcue(num',2));
point_position1=num(freq1);
frequence1=f(point_position1);
maxfreq(k)=frequence1;
point_position2=num(freq2);
frequence2=f(point_position2);
maxfreq(k)=frequence2;
subjlist_freq_location1(k,1)=frequence1;
subjlist_freq_location2(k,1)=frequence2;
end
[a,b,c,d]=ttest(subjlist_freq_location1-subjlist_freq_location2)
(mean(subjlist_freq_location2)+mean(subjlist_freq_location1))/2

%% 3 location 
cd('/Users/jiangyong/attention_result/result_summary/3location/3location_cue_exp')

subjlist = {'hehuixia';'jiaxiamin';'sundongbiao';'zhangpeng';'dawei';...
'wangyajian';'zhangmengyu';'wangxinle';'lanmengying';'songyunjie';'wangyidan';'sujingjing';
};

leath=length(subjlist);
subjlist_freq_location1=zeros(leath,1);
subjlist_freq_location2=zeros(leath,1);
subjlist_freq_location3=zeros(leath,1);
maxfreq=zeros(leath,1);
location2=2;location3=3;location1=1;
for k=1:leath
[a b]=cal_acc_timecourse_RT_50smooth(subjlist{k});
cue1=zscore(b);


xcue1=zeros(4,3);
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


hanningcue1=cue1.*[hanning(77),hanning(77),hanning(77)];
fftlpcue=fft(hanningcue1,padding);
absfftlpcue=abs(fftlpcue);
f=[0:padding-1]*(padding-1)/padding;
%
num=find(f>1&f<5);

 [amp1,freq1]=max(absfftlpcue(num',1));
  [amp2,freq2]=max(absfftlpcue(num',2));
  [amp3,freq3]=max(absfftlpcue(num',3));
point_position1=num(freq1);
frequence1=f(point_position1);
maxfreq(k)=frequence1;
point_position2=num(freq2);
frequence2=f(point_position2);
maxfreq(k)=frequence2;
point_position3=num(freq3);
frequence3=f(point_position3);
maxfreq(k)=frequence3;
subjlist_freq_location1(k,1)=frequence1;
subjlist_freq_location2(k,1)=frequence2;
subjlist_freq_location3(k,1)=frequence3;
end
[a1,b1,c,d]=ttest(subjlist_freq_location1-subjlist_freq_location2)
[a2,b2,c,d]=ttest(subjlist_freq_location1-subjlist_freq_location3)
[a3,b3,c,d]=ttest(subjlist_freq_location2-subjlist_freq_location3)
(mean(subjlist_freq_location3)+mean(subjlist_freq_location2)+mean(subjlist_freq_location1))/3

%% 4 location
cd('/Users/jiangyong/attention_result/result_summary/4location/expdata')
subjlist = {'daiwei';'huanglei';'fukangwei';'xunyihao';'yangxiulong';'linweiru'...
    ;'wangsu';'wangjin';'lixueying';'duyuxin';'hehuixia';
    'wangziwei';'zhangxiaoying';'liuyanchun';'lizhen';'chengman';'yuguimei'};
leath=length(subjlist);
subjlist_freq_location1=zeros(leath,1);
subjlist_freq_location2=zeros(leath,1);
subjlist_freq_location3=zeros(leath,1);
subjlist_freq_location4=zeros(leath,1);
maxfreq=zeros(leath,1);
location2=2;location3=3;location1=1;location4=4;
for k=1:leath
[a b]=cal_acc_timecourse_RT_50smooth_4location_heng(subjlist{k});
cue1=detrend(b);

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


hanningcue1=cue1.*[hanning(77),hanning(77),hanning(77),hanning(77)];
fftlpcue=fft(hanningcue1,padding);
absfftlpcue=abs(fftlpcue);
f=[0:padding-1]*(padding-1)/padding;
%
num=find(f>1&f<5);
 [amp1,freq1]=max(absfftlpcue(num',1));
  [amp2,freq2]=max(absfftlpcue(num',2));
  [amp3,freq3]=max(absfftlpcue(num',3));
    [amp4,freq4]=max(absfftlpcue(num',4));
point_position1=num(freq1);
frequence1=f(point_position1);
maxfreq(k)=frequence1;
point_position2=num(freq2);
frequence2=f(point_position2);
maxfreq(k)=frequence2;
point_position3=num(freq3);
frequence3=f(point_position3);
maxfreq(k)=frequence3;
point_position4=num(freq4);
frequence4=f(point_position4);
maxfreq(k)=frequence4;
subjlist_freq_location1(k,1)=frequence1;
subjlist_freq_location2(k,1)=frequence2;
subjlist_freq_location3(k,1)=frequence3;
subjlist_freq_location4(k,1)=frequence4;
end

[a1,b1,c,d]=ttest(subjlist_freq_location1-subjlist_freq_location2)
[a2,b2,c,d]=ttest(subjlist_freq_location1-subjlist_freq_location3)
[a3,b3,c,d]=ttest(subjlist_freq_location1-subjlist_freq_location4)
[a4,b4,c,d]=ttest(subjlist_freq_location2-subjlist_freq_location3)
[a5,b5,c,d]=ttest(subjlist_freq_location2-subjlist_freq_location4)
[a6,b6,c,d]=ttest(subjlist_freq_location3-subjlist_freq_location4)
(mean(subjlist_freq_location4)+mean(subjlist_freq_location3)+mean(subjlist_freq_location2)+mean(subjlist_freq_location1))/4
