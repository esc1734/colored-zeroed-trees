R = QQ[t1,t2,t3,t4,t5,t6,t7,p01,p02,p03,p04,p12,p13,p14,p23,p24,p34];

-- elim
id4 = matrix {{1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1}};
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,S*K-id4))

-- MAPS
nochange4 = matrix{{p01, p12, p13, p14},
                   {p12, p02, p23, p24},
                   {p13, p23, p03, p34},
                   {p14, p24, p34, p04}}

K4 = matrix {{p01+p12+p13+p14, -p12, -p13, -p14},
            {-p12, p02+p12+p23+p24, -p23, -p24},
            {-p13, -p23, p03+p13+p23+p34, -p34},
            {-p14, -p24, -p34, p04+p14+p24+p34}};

Kneg = matrix {{p01-p12, +p12, -p13, -p14},
            {+p12, p02-p12, -p23, -p24},
            {-p13, -p23, +p03, -p34},
            {-p14, -p24, -p34, +p04}};

Kmodified = matrix {{p01-p12, +p12, -p13, -p14},
            {+p12, p02-p12, -p23, -p24},
            {-p13, -p23, p03-p34, +p34},
            {-p14, -p24, +p34, p04-p34}};

-- GRAPHS
-- BMT paper example (binary tree) with t5 = 0
Tree = matrix {{t1,t5,t7,t7},
               {t5,t2,t7,t7},
               {t7,t7,t3,t6},
               {t7,t7,t6,t4}};
-- K4 and Kmodified give same toric ideal
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Tree*K4-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Tree*Kmodified-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Tree*Kneg-id4))

-- BMT paper example (binary tree) with t5 = 0
Tree5 = matrix {{t1,0,t7,t7},
                {0,t2,t7,t7},
                {t7,t7,t3,t6},
                {t7,t7,t6,t4}};
-- Kmodified two generators with 3 monomials, Kneg four generators with 4 monomials
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Tree5*nochange4-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Tree5*Kmodified-id4))
-- I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Tree5*Kneg-id4))
ideal(mingens(I))

-- binary tree with t7 = 0
Tree7 = matrix {{t1,t5,0,0},
                {t5,t2,0,0},
                {0,0,t3,t6},
                {0,0,t6,t4}};

-- K4, Kmodified, and Kneg give same ideal generated by four degree 1 monomials (toric??)
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Tree7*K4-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Tree7*Kmodified-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Tree7*Kneg-id4))

-- clade all values
Clade = matrix {{t1,t5,t6,t7},
                {t5,t2,t6,t7},
                {t6,t6,t3,t7},
                {t7,t7,t7,t4}};
-- Kmodified and Kneg both don't give toric ideal, K4 does
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Clade*K4-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Clade*Kmodified-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Clade*Kneg-id4))

-- clade with t5 = 0
Clade5 = matrix {{t1,0,t6,t7},
                 {0,t2,t6,t7},
                 {t6,t6,t3,t7},
                 {t7,t7,t7,t4}};
-- no toric, all are pretty bad :/
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Clade5*K4-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Clade5*Kmodified-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Clade5*Kneg-id4))

-- clade with t6 = 0
Clade6 = matrix {{t1,t5,0,t7},
                 {t5,t2,0,t7},
                 {0,0,t3,t7},
                 {t7,t7,t7,t4}};
-- no toric, K4 and Kneg give two generators with 5 monomials, Kmodified has two generators with 6
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Clade6*K4-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Clade6*Kmodified-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Clade6*Kneg-id4))

-- clade with t7 = 0
Clade7 = matrix {{t1,t5,t6,0},
                 {t5,t2,t6,0},
                 {t6,t6,t3,0},
                 {0,0,0,t4}};
-- K4, Kmodified, and Kneg all give same ideal (three degree 1 monomial generators plus one difference of degree 2 monomials generator term)
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Clade7*K4-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Clade7*Kmodified-id4))
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,Clade7*Kneg-id4))