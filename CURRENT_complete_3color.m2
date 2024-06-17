-- example from BMT paper (original version)
R = QQ[t1,t2,t3,t4,t5,t6,t7,p01,p02,p03,p04,p12,p13,p14,p23,p24,p34];

-- maps

K3 = matrix {{p01+p12+p13, -p12, -p13},
            {-p12, p02+p12+p23, -p23},
            {-p13, -p23, p03+p13+p23}};

K4 = matrix {{p01+p12+p13+p14, -p12, -p13, -p14},
            {-p12, p02+p12+p23+p24, -p23, -p24},
            {-p13, -p23, p03+p13+p23+p34, -p34},
            {-p14, -p24, -p34, p04+p14+p24+p34}};

nochange3 = matrix{{p01, p12, p13},
                   {p12, p02, p23},
                   {p13, p23, p03}}

nochange4 = matrix{{p01, p12, p13, p14},
                   {p12, p02, p23, p24},
                   {p13, p23, p03, p34},
                   {p14, p24, p34, p04}}

-- methods
id3 = matrix {{1,0,0},{0,1,0},{0,0,1}};
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,S*K3-id3))

id4 = matrix {{1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1}};
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,S*K4-id4))

-- n=3
C31 = matrix {{t1, t2, t3},
             {t2, t1, t2},
             {t3, t2, t1}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,C31*nochange3-id3))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,C31*K3-id3))

C32 = matrix {{t1, t3, t3},
             {t3, t1, t3},
             {t3, t3, t2}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,C31*nochange3-id3))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,C31*K3-id3))

-- n=4
C41 = matrix {{t1, t2, t3, t3},
             {t2, t1, t3, t3},
             {t3, t3, t1, t2},
             {t3, t3, t2, t1}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,C41*nochange4-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,C41*K4-id4))

C42 = matrix {{t1, t2, t3, t3},
             {t2, t1, t3, t3},
             {t3, t3, t1, t2},
             {t3, t3, t2, t1}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,C42*nochange4-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,C42*K4-id4))

C43 = matrix{{t1, t2, t2, t3},
             {t2, t1, t3, t3},
             {t2, t3, t1, t3},
             {t3, t3, t3, t1}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,C43*nochange4-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,C43*K4-id4))

C44 = matrix{{t1, t2, t2, t3},
             {t2, t1, t3, t3},
             {t2, t3, t1, t2},
             {t3, t3, t2, t1}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,C44*nochange4-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,C44*K4-id4))

C45 = matrix{{t1, t2, t2, t2},
             {t2, t1, t3, t3},
             {t2, t3, t1, t3},
             {t2, t3, t3, t1}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,C45*nochange4-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,C45*K4-id4))

C46 = matrix{{t1, t3, t3, t3},
             {t3, t1, t3, t3},
             {t3, t3, t1, t3},
             {t3, t3, t3, t2}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,C46*nochange4-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,C46*K4-id4))

C47 = matrix{{t1, t3, t3, t3},
             {t3, t1, t3, t3},
             {t3, t3, t2, t3},
             {t3, t3, t3, t2}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,C47*nochange4-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,C47*K4-id4))