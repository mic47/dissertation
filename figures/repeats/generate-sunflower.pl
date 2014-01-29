#! /usr/bin/perl -w

use strict;


print '
\documentclass[11pt]{article}
\input shared.texm
\startfile
\begin{pspicture}(-4.3,-4.9)(4.6,4.3)
\def\MNODE(#1,#2)#3#4{%
\cnode(#1,#2){0.31}{#3}\rput(#1,#2){#4}}%
';

my $N = 9;
my  $PI = 4 * atan2(1, 1);
my $ALPHA = -2*$PI/$N;
my $AL1 = -$PI/2;
my $AL2 = -$PI/$N;
my $RS = 4.3;
my $RI = 3.1;
my $RM = 2.6;
my $RD1 = 1.9;
my $RD2 = 1.2;

for(my $i=0; $i<$N; $i++) {
    my $a = $AL1+$i*$ALPHA;
    printf '\MNODE(%f,%f){m%d}{$M_{%d}$}%s', 
        $RM*cos($a), $RM*sin($a), $i, $i, "\n"; 

    printf '\MNODE(%f,%f){i%d}{$I_{%d}$}%s', 
        $RI*cos($a+$AL2), $RI*sin($a+$AL2), $i, $i, "\n";

    if($i>0) {
	printf '\MNODE(%f,%f){d%d}{$D_{%d}$}%s', 
	$RD1*cos($a), $RD1*sin($a), $i, $i, "\n";
    }

    if($i<$N-1) {
	printf '\MNODE(%f,%f){dd%d}{$D\'_{%d}$}%s', 
	$RD2*cos($a), $RD2*sin($a), $i, $i, "\n"; 
    }

    printf '\pnode(%f,%f){s%d}%s', $RS*cos($a+$AL2), $RS*sin($a+$AL2), $i, "\n";

}

printf '\MNODE(-0.6,-4.5){s}{$s$}%s', "\n";
printf '\MNODE(0.6,-4.5){e}{$e$}%s', "\n";

printf '\psset{arrows=->,linecolor=darkgray}%s',"\n";

printf '\ncline{s}{m0}%s', "\n";
printf '\ncline{s}{e}%s', "\n";
printf '\ncarc[arcangle=-40]{s}{dd0}%s', "\n";
printf '\ncarc[arcangle=-30]{d%d}{e}%s', $N-1, "\n";
printf '\ncarc[arcangle=-45]{m%d}{e}%s', $N-1, "\n";

for(my $i=0; $i<$N; $i++) {
    printf '\ncline{m%d}{m%d}%s', $i, $i+1, "\n";
    printf '\ncline{m%d}{i%d}%s', $i, $i, "\n";
    printf '\ncline{m%d}{d%d}%s', $i, $i+1, "\n";

    printf '\ncline{d%d}{d%d}%s', $i, $i+1, "\n";
    printf '\ncline{d%d}{i%d}%s', $i, $i, "\n";
    printf '\ncline{d%d}{m%d}%s', $i, $i+1, "\n";

    printf '\ncline{dd%d}{dd%d}%s', $i, $i+1, "\n";
    printf '\ncline{dd%d}{i%d}%s', $i, $i, "\n";
    printf '\ncline{dd%d}{m%d}%s', $i, $i+1, "\n";

    printf '\ncline{i%d}{m%d}%s', $i, $i+1, "\n";
    printf '\ncline{i%d}{d%d}%s', $i, $i+1, "\n";

    my $a = ($AL1+$i*$ALPHA+$AL2-$PI/2)*180/$PI;
    #printf '\nccircle[angle=%f,nodesep=-1pt]{i%d}{0.5}%s',
    #$a, $i, "\n";
    printf '\ncarc[arcangleA=30,arcangleB=60,ncurv=1,arrows=-]{i%d}{s%d}%s',
    $i, $i, "\n";
    printf '\ncarc[arcangleA=-30,arcangleB=-90,ncurv=1,arrows=<-]{i%d}{s%d}%s',
    $i, $i, "\n";

}


printf '\ncline{m%d}{m%d}%s', $N-1, 0, "\n";
printf '\ncline{m%d}{dd%d}%s', $N-1, 0, "\n";

printf '\ncline{d%d}{dd%d}%s', $N-1, 0, "\n";
printf '\ncline{d%d}{m%d}%s', $N-1, 0, "\n";

printf '\ncline{i%d}{m%d}%s', $N-1, 0, "\n";
printf '\ncline{i%d}{d%d}%s', $N-1, 0, "\n";


print '
\end{pspicture}
\endfile
';
