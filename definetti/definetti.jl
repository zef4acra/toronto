srand()
## these are the probabilities of E1, E2, E3
r1=rand(3)
r2=[1,1,1]-r1
## initializing arrays
myn=[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
om=[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
p=[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,]
## defining atomic events w_1=E1 and E2 and E3 ... w_8=not-E1 and not-E2 and not-E3
for i1 in 0:7
    b1=bin(i1,3)
## note that b1[1] is a character, not a string, therefore '0' in comparison, not "0" -- string(b1[1]) turns a character into a string, parse(Float64,string(b1[1])) turns it into a float
    if b1[1]=='0'
        a1=r2[1]
    else
        a1=r1[1]
        end
    if b1[2]=='0'
        a2=r2[2]
    else
        a2=r1[2]
        end
    if b1[3]=='0'
        a3=r2[3]
    else
        a3=r1[3]
    end
    i2=i1+1
## the probability of w_1, for example, has to be lower than the minimum of P(E1), P(E2), and P(E3)
    myn[i2]=min(a1,a2,a3)
    end
    x=2
    while x>1
        for i3 in 1:8
            om[i3]=rand()*myn[i3]
        end
## making sure that the probabilities of the atomic events add up to one
        pop!(om)
        push!(om,0.0)
        x=sum(om)
    end
    y=1-x
    pop!(om)
    push!(om,y)
    ## println(string(om[1]," ",om[2]," ",om[3]," ",om[4]," ",om[5]," ",om[6]," ",om[7]," ",om[8]))
    for i4 in 0:255
        b2=bin(i4,8)
        i5=i4+1
## p lists the probabilities of the propositional algebra, for example the binary number 10010011 corresponds to the event w_1 or w_4 or w_7 or w_8
## you can check that p[2]+p[3]+p[5]+p[9]+p[17]+p[33]+p[65]+p[129]=1 and that the first element is always 0, the last is always 1
        p[i5]=parse(Float64,string(b2[1]))*om[1]+parse(Float64,string(b2[2]))*om[2]+parse(Float64,string(b2[3]))*om[3]+parse(Float64,string(b2[4]))*om[4]+parse(Float64,string(b2[5]))*om[5]+parse(Float64,string(b2[6]))*om[6]+parse(Float64,string(b2[7]))*om[7]+parse(Float64,string(b2[8]))*om[8]
    end
## P is just a convenient way to represent the 256 probabilities of p in matrix form
    P=[0.01*round(100*p[1]) 0.01*round(100*p[2]) 0.01*round(100*p[3]) 0.01*round(100*p[4]) 0.01*round(100*p[5]) 0.01*round(100*p[6]) 0.01*round(100*p[7]) 0.01*round(100*p[8]) 0.01*round(100*p[9]) 0.01*round(100*p[10]) 0.01*round(100*p[11]) 0.01*round(100*p[12]) 0.01*round(100*p[13]) 0.01*round(100*p[14]) 0.01*round(100*p[15]) 0.01*round(100*p[16]);0.01*round(100*p[17]) 0.01*round(100*p[18]) 0.01*round(100*p[19]) 0.01*round(100*p[20]) 0.01*round(100*p[21]) 0.01*round(100*p[22]) 0.01*round(100*p[23]) 0.01*round(100*p[24]) 0.01*round(100*p[25]) 0.01*round(100*p[26]) 0.01*round(100*p[27]) 0.01*round(100*p[28]) 0.01*round(100*p[29]) 0.01*round(100*p[30]) 0.01*round(100*p[31]) 0.01*round(100*p[32]);0.01*round(100*p[33]) 0.01*round(100*p[34]) 0.01*round(100*p[35]) 0.01*round(100*p[36]) 0.01*round(100*p[37]) 0.01*round(100*p[38]) 0.01*round(100*p[39]) 0.01*round(100*p[40]) 0.01*round(100*p[41]) 0.01*round(100*p[42]) 0.01*round(100*p[43]) 0.01*round(100*p[44]) 0.01*round(100*p[45]) 0.01*round(100*p[46]) 0.01*round(100*p[47]) 0.01*round(100*p[48]);0.01*round(100*p[49]) 0.01*round(100*p[50]) 0.01*round(100*p[51]) 0.01*round(100*p[52]) 0.01*round(100*p[53]) 0.01*round(100*p[54]) 0.01*round(100*p[55]) 0.01*round(100*p[56]) 0.01*round(100*p[57]) 0.01*round(100*p[58]) 0.01*round(100*p[59]) 0.01*round(100*p[60]) 0.01*round(100*p[61]) 0.01*round(100*p[62]) 0.01*round(100*p[63]) 0.01*round(100*p[64]);0.01*round(100*p[65]) 0.01*round(100*p[66]) 0.01*round(100*p[67]) 0.01*round(100*p[68]) 0.01*round(100*p[69]) 0.01*round(100*p[70]) 0.01*round(100*p[71]) 0.01*round(100*p[72]) 0.01*round(100*p[73]) 0.01*round(100*p[74]) 0.01*round(100*p[75]) 0.01*round(100*p[76]) 0.01*round(100*p[77]) 0.01*round(100*p[78]) 0.01*round(100*p[79]) 0.01*round(100*p[80]);0.01*round(100*p[81]) 0.01*round(100*p[82]) 0.01*round(100*p[83]) 0.01*round(100*p[84]) 0.01*round(100*p[85]) 0.01*round(100*p[86]) 0.01*round(100*p[87]) 0.01*round(100*p[88]) 0.01*round(100*p[89]) 0.01*round(100*p[90]) 0.01*round(100*p[91]) 0.01*round(100*p[92]) 0.01*round(100*p[93]) 0.01*round(100*p[94]) 0.01*round(100*p[95]) 0.01*round(100*p[96]);0.01*round(100*p[97]) 0.01*round(100*p[98]) 0.01*round(100*p[99]) 0.01*round(100*p[100]) 0.01*round(100*p[101]) 0.01*round(100*p[102]) 0.01*round(100*p[103]) 0.01*round(100*p[104]) 0.01*round(100*p[105]) 0.01*round(100*p[106]) 0.01*round(100*p[107]) 0.01*round(100*p[108]) 0.01*round(100*p[109]) 0.01*round(100*p[110]) 0.01*round(100*p[111]) 0.01*round(100*p[112]);0.01*round(100*p[113]) 0.01*round(100*p[114]) 0.01*round(100*p[115]) 0.01*round(100*p[116]) 0.01*round(100*p[117]) 0.01*round(100*p[118]) 0.01*round(100*p[119]) 0.01*round(100*p[120]) 0.01*round(100*p[121]) 0.01*round(100*p[122]) 0.01*round(100*p[123]) 0.01*round(100*p[124]) 0.01*round(100*p[125]) 0.01*round(100*p[126]) 0.01*round(100*p[127]) 0.01*round(100*p[128]);0.01*round(100*p[129]) 0.01*round(100*p[130]) 0.01*round(100*p[131]) 0.01*round(100*p[132]) 0.01*round(100*p[133]) 0.01*round(100*p[134]) 0.01*round(100*p[135]) 0.01*round(100*p[136]) 0.01*round(100*p[137]) 0.01*round(100*p[138]) 0.01*round(100*p[139]) 0.01*round(100*p[140]) 0.01*round(100*p[141]) 0.01*round(100*p[142]) 0.01*round(100*p[143]) 0.01*round(100*p[144]);0.01*round(100*p[145]) 0.01*round(100*p[146]) 0.01*round(100*p[147]) 0.01*round(100*p[148]) 0.01*round(100*p[149]) 0.01*round(100*p[150]) 0.01*round(100*p[151]) 0.01*round(100*p[152]) 0.01*round(100*p[153]) 0.01*round(100*p[154]) 0.01*round(100*p[155]) 0.01*round(100*p[156]) 0.01*round(100*p[157]) 0.01*round(100*p[158]) 0.01*round(100*p[159]) 0.01*round(100*p[160]);0.01*round(100*p[161]) 0.01*round(100*p[162]) 0.01*round(100*p[163]) 0.01*round(100*p[164]) 0.01*round(100*p[165]) 0.01*round(100*p[166]) 0.01*round(100*p[167]) 0.01*round(100*p[168]) 0.01*round(100*p[169]) 0.01*round(100*p[170]) 0.01*round(100*p[171]) 0.01*round(100*p[172]) 0.01*round(100*p[173]) 0.01*round(100*p[174]) 0.01*round(100*p[175]) 0.01*round(100*p[176]);0.01*round(100*p[177]) 0.01*round(100*p[178]) 0.01*round(100*p[179]) 0.01*round(100*p[180]) 0.01*round(100*p[181]) 0.01*round(100*p[182]) 0.01*round(100*p[183]) 0.01*round(100*p[184]) 0.01*round(100*p[185]) 0.01*round(100*p[186]) 0.01*round(100*p[187]) 0.01*round(100*p[188]) 0.01*round(100*p[189]) 0.01*round(100*p[190]) 0.01*round(100*p[191]) 0.01*round(100*p[192]);0.01*round(100*p[193]) 0.01*round(100*p[194]) 0.01*round(100*p[195]) 0.01*round(100*p[196]) 0.01*round(100*p[197]) 0.01*round(100*p[198]) 0.01*round(100*p[199]) 0.01*round(100*p[200]) 0.01*round(100*p[201]) 0.01*round(100*p[202]) 0.01*round(100*p[203]) 0.01*round(100*p[204]) 0.01*round(100*p[205]) 0.01*round(100*p[206]) 0.01*round(100*p[207]) 0.01*round(100*p[208]);0.01*round(100*p[209]) 0.01*round(100*p[210]) 0.01*round(100*p[211]) 0.01*round(100*p[212]) 0.01*round(100*p[213]) 0.01*round(100*p[214]) 0.01*round(100*p[215]) 0.01*round(100*p[216]) 0.01*round(100*p[217]) 0.01*round(100*p[218]) 0.01*round(100*p[219]) 0.01*round(100*p[220]) 0.01*round(100*p[221]) 0.01*round(100*p[222]) 0.01*round(100*p[223]) 0.01*round(100*p[224]);0.01*round(100*p[225]) 0.01*round(100*p[226]) 0.01*round(100*p[227]) 0.01*round(100*p[228]) 0.01*round(100*p[229]) 0.01*round(100*p[230]) 0.01*round(100*p[231]) 0.01*round(100*p[232]) 0.01*round(100*p[233]) 0.01*round(100*p[234]) 0.01*round(100*p[235]) 0.01*round(100*p[236]) 0.01*round(100*p[237]) 0.01*round(100*p[238]) 0.01*round(100*p[239]) 0.01*round(100*p[240]);0.01*round(100*p[241]) 0.01*round(100*p[242]) 0.01*round(100*p[243]) 0.01*round(100*p[244]) 0.01*round(100*p[245]) 0.01*round(100*p[246]) 0.01*round(100*p[247]) 0.01*round(100*p[248]) 0.01*round(100*p[249]) 0.01*round(100*p[250]) 0.01*round(100*p[251]) 0.01*round(100*p[252]) 0.01*round(100*p[253]) 0.01*round(100*p[254]) 0.01*round(100*p[255]) 0.01*round(100*p[256])]
