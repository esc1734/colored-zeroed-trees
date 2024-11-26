R = QQ[t1,t2,t3,t4,t5,t6,t7,p01,p02,p03,p04,p12,p13,p14,p23,p24,p34];

id4 = matrix {{1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1}};

K4 = matrix {{p01+p12+p13+p14, -p12, -p13, -p14},
            {-p12, p02+p12+p23+p24, -p23, -p24},
            {-p13, -p23, p03+p13+p23+p34, -p34},
            {-p14, -p24, -p34, p04+p14+p24+p34}};

nochange = matrix{{p01, p12, p13,p14},
                  {p12, p02, p23,p24},
                  {p13, p23, p03,p34},
                    {p14, p24, p34,p04}};

---- figure 1 ------------------------------    
example1coordinates = matrix {{p01+p12-p13,-p12,+p13,-p14},
                              {-p12,p02+p12-p23,+p23,-p24},
                              {+p13,+p23,p03-p13-p23,-p34},
                              {-p14,-p24,-p34,p04}};

example1 = matrix{{t1, t4, 0, t5},
                  {t4, t1, 0, t5},
                  {0, 0, t2, t5},
                  {t5, t5, t5, t3}};

I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,example1*example1coordinates - id4))
netList(I_*)

---- figure 2 ------------------------------
example2 = matrix{{t1, t5, t7, t7},
                  {t5, t2, t7, t7},
                  {t7, t7, t3, t6},
                  {t7, t7, t6, t4}};

I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,example2*K4-id4))
netList(I_*)

---- vertex regular coloring (example 4.1) ------------------------------
-- original tree: binary tree with 4 leaves
binarytree4 = matrix {{t1, t5, t7, t7},
                      {t5, t2, t7, t7},
                      {t7, t7, t3, t6},
                      {t7, t7, t6, t4}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,binarytree4*K4-id4))
netList(I_*)
-- ideal: p14*p23 - p13*p24, p04*p23 - p03*p24, p02*p14 - p01*p24, p04*p13 - p03*p14, p02*p13 - p01*p23

-- vertices 1 and 2 sharing colors
G1 = matrix {{t1, t5, t7, t7},
             {t5, t1, t7, t7},
             {t7, t7, t3, t6},
             {t7, t7, t6, t4}};

I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,G1*K4-id4))
netList(I_*)

-- vertices 1 and 2, 3 and 4 sharing colors
G2 = matrix {{t1, t5, t7, t7},
             {t5, t1, t7, t7},
             {t7, t7, t3, t6},
             {t7, t7, t6, t3}};

I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,G2*K4-id4))
netList(I_*)

-- vertices 1 and 4 sharing colors 
G3 = matrix {{t1, t5, t7, t7},
             {t5, t2, t7, t7},
             {t7, t7, t3, t6},
             {t7, t7, t6, t1}};

I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,G3*K4-id4))
netList(I_*)
-- see sage code for verification of non-toric after any linear change of coordinates


---- coloring adjacent edges (example 4.8) ------------------------------
adjacent_edges = matrix {{t1, t5, t7, t7},
                         {t5, t2, t7, t7},
                         {t7, t7, t3, t7},
                         {t7, t7, t7, t4}};

I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,adjacent_edges*K4-id4))
netList(I_*)

---- coloring non-adjacent edges (example 4.10) ------------------------------
nonadjacent_edges = matrix {{t1, t5, t7, t7},
                            {t5, t2, t7, t7},
                            {t7, t7, t3, t5},
                            {t7, t7, t5, t4}};

I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,nonadjacent_edges*K4-id4))
netList(I_*)
-- see sage code for verification of non-toric after any linear change of coordinates

---- block-deleted and non-block deleted graphs (example 5.1) ------------------------------
G1 = matrix {{t1, t5, t6, t7},
             {t5, t2, t6, t7},
             {t6, t6, t3, t7},
             {t7, t7, t7, t4}};
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,G1*K4-id4))
netList(I_*)

derived_laplacian = matrix {{p01-p12-p13, +p12, +p13, -p14},
                            {+p12, p02-p12-p23, +p23, -p24},
                            {+p13, +p23, p03-p13-p23, -p34},
                            {-p14, -p24, -p34, p04}};

G2 = matrix {{t1, t5, 0, t6},
             {t5, t2, 0, t6},
             {0, 0, t3, t6},
             {t6, t6, t6, t4}};

I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,G2*derived_laplacian-id4))
netList(I_*)


G3 = matrix {{t1, 0, t7, t7},
             {0, t2, t7, t7},
             {t7, t7, t3, t7},
             {t7, t7, t7, t4}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,G3*K4-id4))
-- see sage code for verification of non-toric after any linear change of coordinates


---- block-deleted with toric structure (example 5.8) ------------------------------
g58 = matrix {{t1, 0, t4},
               {0, t2, t5},
               {t4, t5, t3}}

g_laplacian = matrix{{p01-p12, +p12, -p13},
                      {+p12, p02-p12, -p23},
                      {-p13, -p23, p03}};

id3 = matrix {{1,0,0},{0,1,0},{0,0,1}};

I = eliminate({t1,t2,t3,t4,t5},minors(1,g58*g_laplacian-id3))

---- non block-deleted graph with toric structure (remark 5.10) ------------------------------
bmt_nonblockdeleted = matrix {{t1, 0, t7, t7},
                              {0, t2, t7, t7},
                              {t7, t7, t3, t6},
                              {t7, t7, t6, t4}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,bmt_nonblockdeleted*K4-id4))
tex I
-- see sage code for verification of toric after a linear change of coordinates
