R = QQ[t1,t2,t3,t4,t5,t6,t7,p01,p02,p03,p04,p12,p13,p14,p23,p24,p34];

id4 = matrix {{1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1}};

K4 = matrix {{p01+p12+p13+p14, -p12, -p13, -p14},
            {-p12, p02+p12+p23+p24, -p23, -p24},
            {-p13, -p23, p03+p13+p23+p34, -p34},
            {-p14, -p24, -p34, p04+p14+p24+p34}};

---- vertex regular coloring (example 4.2) ------------------------------
-- original tree: binary tree with 4 leaves
binarytree4 = matrix {{t1, t5, t7, t7},
                      {t5, t2, t7, t7},
                      {t7, t7, t3, t6},
                      {t7, t7, t6, t4}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,binarytree4*K4-id4))
netList(I_*)
-- ideal: p14*p23 - p13*p24, p04*p23 - p03*p24, p02*p14 - p01*p24, p04*p13 - p03*p14, p02*p13 - p01*p23

-- vertices 1 and 4 sharing colors 
bt4_vertexcoloring14 = matrix {{t1, t5, t7, t7},
                               {t5, t2, t7, t7},
                               {t7, t7, t3, t6},
                               {t7, t7, t6, t1}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,bt4_vertexcoloring14*K4-id4))
netList(I_*)
-- see sage code for verification of non-toric after any linear change of coordinates

-- vertices 1 and 2 sharing colors
bt4_vertexcoloring12 = matrix {{t1, t5, t7, t7},
                               {t5, t1, t7, t7},
                               {t7, t7, t3, t6},
                               {t7, t7, t6, t4}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,bt4_vertexcoloring12*K4-id4))
netList(I_*)
-- ideal: p14 - p24, p13 - p23, p01 - p02, p04*p23 - p03*p24

-- vertices 1 and 2, 3 and 4 sharing colors
bt4_vertexcoloring1234 = matrix {{t1, t5, t7, t7},
                                  {t5, t1, t7, t7},
                                  {t7, t7, t3, t6},
                                  {t7, t7, t6, t3}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,bt4_vertexcoloring1234*K4-id4))
netList(I_*)
-- ideal: p23 - p24, p14 - p24, p13 - p24, p03 - p04, p01 - p02


---- non-toric ideal after non-vetex regular coloring (remark 4.9) ------------------------------
-- vertices 1 and 4 sharing colors 
bt4_vertexcoloring14 = matrix {{t1, t5, t7, t7},
                               {t5, t2, t7, t7},
                               {t7, t7, t3, t6},
                               {t7, t7, t6, t1}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,bt4_vertexcoloring14*K4-id4))
netList(I_*)
-- see sage code for verification of non-toric after any linear change of coordinates

---- block-deleted and non-block deleted graphs (example 6.2) ------------------------------
bmt_complete = matrix {{t1, t5, t6, t7},
                       {t5, t2, t6, t7},
                       {t6, t6, t3, t7},
                       {t7, t7, t7, t4}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,bmt_complete*K4-id4))
netList(I_*)
-- ideal: p03*p24 - p02*p34, p14*p23 - p13*p24, p03*p14 - p01*p34, p02*p14 - p01*p24, p02*p13 - p01*p23

star_laplacian = matrix {{p01-p12-p13, +p12, +p13, -p14},
                         {+p12, p02-p12-p23, +p23, -p24},
                         {+p13, +p23, p03-p13-p23, -p34},
                         {-p14, -p24, -p34, p04}}

bmt_blockdeleted = matrix {{t1, 0, 0, t7},
                            {0, t2, 0, t7},
                            {0, 0, t3, t7},
                            {t7, t7, t7, t1}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,bmt_blockdeleted*star_laplacian-id4))
netList(I_*)
-- ideal: p01 - p04, p13*p24 - p12*p34, p03*p24 - p02*p34, p14*p23 - p12*p34, p04*p23 - p24*p34, p03*p14 - p04*p34,
-- p02*p14 - p04*p24, p04*p13 - p14*p34, p03*p13 - p34^2, p02*p13 - p24*p34, p04*p12 - p14*p24, p03*p12 - p24*p34,
-- p02*p12 - p24^2

bmt_nonblockdeleted = matrix {{t1, 0, t6, t7},
                              {0, t2, t6, t7},
                              {t6, t6, t3, t7},
                              {t7, t7, t7, t4}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,bmt_nonblockdeleted*K4-id4))
-- see sage code for verification of non-toric after any linear change of coordinates

---- non block-deleted graph with toric structure (remark 6.12) ------------------------------
bmt_nonblockdeleted = matrix {{t1, 0, t7, t7},
                              {0, t2, t7, t7},
                              {t7, t7, t3, t7},
                              {t7, t7, t7, t4}}
I = eliminate({t1,t2,t3,t4,t5,t6,t7},minors(1,bmt_nonblockdeleted*K4-id4))
-- see sage code for verification of toric after a linear change of coordinates
