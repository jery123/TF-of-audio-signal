clc;
[a, Fs]=audioread('matlab.mp3');

%time domaine
t = linspace(0, length(a)/Fs,length(a));
epaisseur=2.35-0.75;
subplot(4,3,1);
plot(t,a,'r');
title('Signal initial');
xlabel('time'); ylabel('amplitude');

%plot rect
subplot(4, 3, 2);
rect=rectpuls(t-(0.75+epaisseur/2),epaisseur);
plot(t, rect, 'b');
title('Rectangulaire');
xlabel('time'); ylabel('amplitude');



%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         %
%   RETIRONS LES BRUITS   %
%                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4,3,3);
te=1/Fs;
T_sec=2.4;
N=round(T_sec/te);
X=a(1:length(a),1);

s_tronc=(rect').*X;

plot(t,s_tronc,'b');
title('Signal sans bruits');
xlabel('time'); ylabel('amplitude');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       ÉCOUTONS "Grande-mère est malade sans les bruits"    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%sound(a,Fs);
%pause(T_sec+1);
%sound(s_tronc,Fs);
%------------------------------------------------------------%
%                             END                            %
%------------------------------------------------------------%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                 %
%   EXTRACTION DE "Grande-mère"   %
%                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4,3,4);
epaisseur_gm=1.4-0.75;
rect_gm=rectpuls(t-(0.75+epaisseur_gm/2),epaisseur_gm);

s_gm=(rect_gm').*X;

plot(t,s_gm,'b');
title('Signal "Grand mère"');
xlabel('time'); ylabel('amplitude');

subplot(4,3,5);
plot(t,abs(fftshift(fft(s_gm))),'b');
title('Signal "TF(Grand mère)"');
xlabel('time'); ylabel('amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     ÉCOUTONS "Grande-mère"                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sound(s_gm,Fs);
pause(T_sec+1);
sound(abs(fftshift(fft(s_gm))),Fs);
%------------------------------------------------------------%
%                             END                            %
%------------------------------------------------------------%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                 %
%       EXTRACTION DE "est"       %
%                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4,3,7);
epaisseur_est=1.6-1.45;
rect_est=rectpuls(t-(1.45+epaisseur_est/2),epaisseur_est);

s_est=(rect_est').*X;

plot(t,s_est,'b');
title('Signal "est"');
xlabel('time'); ylabel('amplitude');
TF_est=abs(fftshift(fft(s_est)));
subplot(4,3,8);
plot(t,TF_est,'b');
title('Signal "TF(est)"');
xlabel('time'); ylabel('amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        ÉCOUTONS "est"                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pause(T_sec+1);
sound(s_est,Fs);
pause(T_sec+1);
sound(TF_est,Fs);
%------------------------------------------------------------%
%                             END                            %
%------------------------------------------------------------%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                 %
%     EXTRACTION DE "malade"      %
%                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4,3,10);
epaisseur_mld=2.35-1.6;
rect_mld=rectpuls(t-(1.6+epaisseur_mld/2),epaisseur_mld);

s_mld=(rect_mld').*X;

plot(t,s_mld,'b');
title('Signal malade"');
xlabel('time'); ylabel('amplitude');
TF_mld=abs(fftshift(fft(s_mld)));
subplot(4,3,11);
plot(t,TF_mld,'b');
title('Signal "TF(est)"');
xlabel('time'); ylabel('amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      ÉCOUTONS "malade"                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pause(T_sec+1);
sound(s_mld,Fs);
pause(T_sec+1);
sound(TF_mld,Fs);
%------------------------------------------------------------%
%                             END                            %
%------------------------------------------------------------%
























