R = QQ[t1,t2,t3,t4,t5,t6,t7,p01,p02,p03,p04,p12,p13,p14,p23,p24,p34,p05,p15,p25,p35,p45];


-- n=3
id3 = matrix {{1,0,0},{0,1,0},{0,0,1}};

nochange3 = matrix{{p01, p12, p13},
                   {p12, p02, p23},
                   {p13, p23, p03}}

K3 = matrix{{p01+p12+p13, -p12, -p13},
            {-p12, p02+p12+p23, -p23},
            {-p13, -p23, p03+p13+p23}};

workingmap = matrix{{p01-p12, +p12, -p13},
                    {+p12, p02-p12, -p23},
                    {-p13, -p23, p03}};

deleted3A = matrix{{t1, 0, t5},
                   {0, t2, t5},
                   {t5, t5, t3}};

I = eliminate({t1,t2,t3,t4,t5},minors(1,deleted3A*workingmap-id3))

deleted3B = matrix{{t1, t4, 0},
                   {t4, t2, 0},
                   {0, 0, t3}}

I = eliminate({t1,t2,t3,t4,t5},minors(1,deleted3B*nochange3-id3))

-- n=4
id4 = matrix {{1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1}};

nochange4 = matrix{{p01, p12, p13, p14},
                   {p12, p02, p23, p24},
                   {p13, p23, p03, p34},
                   {p14, p24, p34, p04}}

K4 = matrix {{p01+p12+p13+p14, -p12, -p13, -p14},
            {-p12, p02+p12+p23+p24, -p23, -p24},
            {-p13, -p23, p03+p13+p23+p34, -p34},
            {-p14, -p24, -p34, p04+p14+p24+p34}};

deleted4A = matrix{{t1, t5, t6, 0},
                   {t5, t2, t6, 0},
                   {t6, t6, t3, 0},
                   {0, 0, 0, t4}};
I = eliminate({t1,t2,t3,t4,t5,t6},minors(1,deleted4A*nochange4-id4))   
I = eliminate({t1,t2,t3,t4,t5,t6},minors(1,deleted4A*K4-id4))      

deleted4B = matrix {{t1, t5, 0, t7},
                    {t5, t2, 0, t7},
                    {0, 0, t3, t7},
                    {t7, t7, t7, t4}};
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,deleted4B*nochange4-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,deleted4B*K4-id4))
K4B = matrix {{p01+p12-p13, -p12,+p13, -p14},
            {-p12, p02+p12-p23, +p23, -p24},
            {+p13, +p23, p03-p13-p23, -p34},
            {-p14, -p24, -p34, p04}};
I4B = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,deleted4B*K4B-id4))
isPrime(I4B)

deleted4Bp = matrix {{t1, t5, t6, t7},
                     {t5, t2, 0, t7},
                     {t6, 0, t3, t7},
                     {t7, t7, t7, t4}};
K4Bp = matrix {{p01+p13, -p12, -p13, -p14},
               {-p12, p02-p23, +p23, -p24},
               {-p13, +p23, p03-p23, -p34},
               {-p14, -p24, -p34, p04}};
I4Bp = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,deleted4Bp*K4Bp-id4))


deleted4C = matrix {{t1, 0,0, t7},
                    {0, t2,0, t7},
                    {0, 0, t3, t7},
                    {t7, t7, t7, t4}};
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,deleted4C*nochange4-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,deleted4C*K4-id4))
K4C = matrix {{p01-p12-p13, +p12, +p13, -p14},
              {+p12, p02-p12-p23, +p23, -p24},
              {+p13, +p23, p03-p13-p23, -p34},
              {-p14, -p24, -p34, p04}};
I4C = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,deleted4C*K4C-id4))
isPrime(I4C)

deleted4D = matrix{{t1, t5, 0, 0},
                   {t5, t2, 0, 0},
                   {0, 0, t3, 0},
                   {0, 0, 0, t4}};
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,deleted4D*nochange4-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,deleted4D*K4-id4))


deleted4E = matrix{{t1, t5, 0, 0},
                   {t5, t2, 0, 0},
                   {0, 0, t3, t6},
                   {0, 0, t6, t4}};
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,deleted4E*nochange4-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,deleted4E*K4-id4))

deleted4F = matrix {{t1, 0, t6, t7},
                    {0, t2, t6, t7},
                    {t6, t6, t3, t7},
                    {t7, t7, t7, t4}};
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,deleted4E*nochange4-id4))

deleted4G = matrix {{t1, 0, t7, t7},
                    {0, t2, t7, t7},
                    {t7, t7, t3, 0},
                    {t7, t7, 0, t4}};

id5 = matrix {{1,0,0,0,0},{0,1,0,0,0},{0,0,1,0,0},{0,0,0,1,0},{0,0,0,0,1}};
deleted5A = matrix{{t1, t6, 0, 0, t7},
                   {t6, t2, 0, 0, t7},
                   {0, 0, t3, 0, t7},
                   {0, 0, 0, t4, t7},
                   {t7, t7, t7, t7, t5}};
m5A = matrix {{p01+p12-p13-p14,-p12,+p13,+p14,-p15},
              {-p12,p02+p12-p23-p24,+p23,+p24,-p25},
              {+p13,+p23,p03-p13-p23-p34,+p34,-p35},
              {+p14,+p24,+p34,p04-p14-p24-p34,-p45},
              {-p15,-p25,-p35,-p45,p05}};
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,deleted5A*m5A-id5))
isPrime(I)