#!/usr/bin/awk -f 
BEGIN{
    count_P=0
    count_S=0
    rewrite=0
    }
{if($1=="#")
    {
        flag_write=1
        writeinfo=$0
        count_S=0
        count_P=0
        }
else{
    if($4=="P" || $4=="p"){count_P=count_P+1}
    if($4=="S" || $4=="s"){count_S=count_S+1}
    $3=sqrt($3*$3)
    if(count_S>=1 || count_P>=1 ) 
    {   if(rewrite==0){
        if (flag_write==1){
        print writeinfo #> "new_phase.dat"
        flag_write=0}
        else{
        if (flag_write==1){
        print writeinfo    #>> "new_phase.dat"
        flag_write=0}
            }
        }
        print $1,$2,$3,$4 }#>> "new_phase.dat"
    }
}
END{

    }
