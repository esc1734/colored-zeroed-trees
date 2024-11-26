# colored-graphs

In [paper_examples.m2](paper_examples.m2), we provide Macaulay2 code to compute the vanishing ideals for all examples in our paper. 

To determine whether an ideal is toric under any linear change of coordinates, we use Sage code developed by Thomas Kahle and Julian Vill provided at [https://github.com/villjulian/isToric](https://github.com/villjulian/isToric). As an example implementation, the following code determines that the vanishing ideal given in Example 5.10 of our paper is toric after a linear change of coordinates:

```sage
# initialize polynomial ring
R.<p01,p02,p03,p04,p12,p13,p14,p23,p24,p34> = QQ['p01','p02','p03','p04','p12','p13','p14','p23','p24','p34']
# define ideal
I = R.ideal(p14*p23 - p13*p24, p04*p23 - p03*p24, p02*p14 - p01*p24, p04*p13 - p03*p14, p02*p13- p01*p23, p04*p12 + p12*p14 + p12*p24 + p13*p24 + p14*p24, p03*p12 + p12*p13 + p12*p23 +p13*p23 + p13*p24)
# check toric (using function from isToric.sage)
ideal_is_toric(I)
```
