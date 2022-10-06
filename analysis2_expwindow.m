padding=100;
w=hanning(77).*exp_window(77,10,0);
w=w/max(w);
%% 2 location
cd('/Users/jiangyong/attention_result/result_summary/2location/exp_data')

subjlist = {'caihailan';'lindapeng';'hehuixia';'jiaxiamin';'lanmengying';...
 'xunyihao';'yinshanshan';'daiwei';...
 'maxueting';'wangyidan';'zhangmengyu';'zhangmingyue';'zhanghuanyu';'zhangna';'zhaobo';'fengxue';'yangyiqing'
 };
leath=length(subjlist);
subjlist_angle_location1=zeros(leath,1);
subjlist_angle_location2=zeros(leath,1);


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


hanningcue1=cue1.*[w,w];
fftlpcue=fft(hanningcue1,padding);
absfftlpcue=abs(fftlpcue);
f=[0:padding-1]*(100)/padding;
 num=find(f>4&f<7);

% [amp,freq]=max(0.7*absfftlpcue(num',1)+0.3*absfftlpcue(num',2));
  [amp,freq]=max(absfftlpcue(num',1));
point_position=num(freq);
frequence=f(point_position);
maxfreq(k)=frequence;
ang=angle(fftlpcue);
subjlist_angle_location1(k,1)=ang(point_position,location1);
subjlist_angle_location2(k,1)=ang(point_position,location2);
subjlist_freq_location2(k,1)=frequence;
end
a=subjlist_angle_location1-subjlist_angle_location2;
[~,~]=phase_vector_cacular(a)
%% 3 location 
padding=100;
w=hanning(77).*exp_window(77,10,0);
w=w/max(w);
cd('/Users/jiangyong/attention_result/result_summary/3location/3location_cue_exp')


subjlist = {'hehuixia';'jiaxiamin';'sundongbiao';'zhangpeng';'dawei';...
'wangyajian';'zhangmengyu';'wangxinle';'lanmengying2';'songyunjie';'wangyidan';'sujingjing';
};

leath=length(subjlist);
subjlist_angle_location1=zeros(leath,1);
subjlist_angle_location2=zeros(leath,1);
subjlist_angle_location3=zeros(leath,1);

subjlist_freq_location2=zeros(leath,1);
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


hanningcue1=cue1.*[w,w,w];
fftlpcue=fft(hanningcue1,padding);
absfftlpcue=abs(fftlpcue);
f=[0:padding-1]*100/padding;
%
num=find(f>1.97&f<4);
[amp,freq]=max(absfftlpcue(num',1)+absfftlpcue(num',2)+absfftlpcue(num',3));
%[amp,freq]=max(absfftlpcue(num',1));
point_position=num(freq);
frequence=f(point_position);
maxfreq(k)=frequence;
ang=angle(fftlpcue);
subjlist_angle_location1(k,1)=ang(point_position,location1);
subjlist_angle_location2(k,1)=ang(point_position,location2);
subjlist_angle_location3(k,1)=ang(point_position,location3);

subjlist_freq_location2(k,1)=frequence;
end
a=subjlist_angle_location1-subjlist_angle_location3;
[~,~]=phase_vector_cacular(a);
a=subjlist_angle_location1-subjlist_angle_location2;
[~,~]=phase_vector_cacular(a);
%% 4 location
cd('/Users/jiangyong/attention_result/result_summary/4location/expdata')

  subjlist = {'daiwei2';'huanglei';'fukangwei';'xunyihao';'yangxiulong';'linweiru'...
     ;'wangsu';'wangjin';'lixueying';'duyuxin';'hehuixia';
     'liuyanchun2';'lizhen';'chengman';'yuguimei';'wangziwei2';'jiaxiamin';};

leath=length(subjlist);
subjlist_angle_location1=zeros(leath,1);
subjlist_angle_location2=zeros(leath,1);
subjlist_angle_location3=zeros(leath,1);
subjlist_angle_location4=zeros(leath,1);
subjlist_freq_location2=zeros(leath,1);
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


hanningcue1=cue1.*[w,w,w,w];
fftlpcue=fft(hanningcue1,padding);
absfftlpcue=abs(fftlpcue);
f=[0:padding-1]*100/padding;
%
num=find(f>1.97&f<4);
%[amp,freq]=max(absfftlpcue(num',1)+absfftlpcue(num',2)+absfftlpcue(num',3)+absfftlpcue(num',4));
[amp,freq]=max(absfftlpcue(num',1));
point_position=num(freq);
frequence=f(point_position);
maxfreq(k)=frequence;
ang=angle(fftlpcue);
subjlist_angle_location1(k,1)=ang(point_position,location1);
subjlist_angle_location2(k,1)=ang(point_position,location2);
subjlist_angle_location3(k,1)=ang(point_position,location3);
subjlist_angle_location4(k,1)=ang(point_position,location4);
subjlist_freq_location2(k,1)=frequence;
end

a=subjlist_angle_location1-subjlist_angle_location2;
[~,~]=phase_vector_cacular(a);
a=subjlist_angle_location1-subjlist_angle_location3;
[~,~]=phase_vector_cacular(a);
a=subjlist_angle_location1-subjlist_angle_location4;
[~,~]=phase_vector_cacular(a);
