#!/bin/bash

# cat $1 && echo ""

declare -A dict_max
declare -A dict_min

read var_name var_idx var_name_last var_idx_last <<< $(echo 0 0 0 0)

var_dir=false        # Judge direction           --- [3:0] or [0:3]
var_count=0          # Judge if only one element --- b[2]
var_continuous=true  # Judge if continuous       --- a[0] a[2] a[3] => a[0] a[2:3]

for vector in `cat $1`; do
    var_name=$(echo $vector | grep -P '[a-zA-Z_]+(_*[a-zA-Z0-9_]){0,}' -o)
    var_idx=$(echo $vector | grep -P '\[\d+\]' -o | grep -P '\d+' -o)

    # Continuous judgement
    if [ $var_name = $var_name_last ] && [ $var_idx_last -eq $(($var_idx + 1)) -o $var_idx_last -eq $(($var_idx - 1)) ]; then
        var_continuous=true            
    else
        var_continuous=false
    fi

    # Segment judgement
    if [ $var_name_last != 0 -a $var_continuous = false ]; then
        # Only one element
        if [ $var_count -eq 0 ]; then
            echo "$var_name_last[${dict_min[$var_name_last]}]"
        else
            if [ $var_dir = true ]; then
                echo "$var_name_last[${dict_max[$var_name_last]}:${dict_min[$var_name_last]}]"
            else
                echo "$var_name_last[${dict_min[$var_name_last]}:${dict_max[$var_name_last]}]"
            fi
        fi
        # Refresh the count
        var_count=0
        # Same index but not continuous
        if [ $var_name = $var_name_last ]; then
            dict_max[$var_name]=''
            dict_min[$var_name]=''
        fi
    fi

    # Direction judgement && increment count
    if [ $var_idx_last -gt $var_idx ]; then
        var_dir=true   # Like [3:0]
    else
        var_dir=false  # Like [0:3]
    fi

    # Increment counter
    if [ $var_name = $var_name_last ] && [ $var_idx != $var_idx_last ] && [ $var_continuous = true ]; then
        var_count=$(($var_count + 1))
    fi

    # Max
    if [ -z ${dict_max[$var_name]} ]; then
        dict_max[$var_name]=$var_idx
    else
        if [ $var_idx -gt ${dict_max[$var_name]} ]; then
            dict_max[$var_name]=$var_idx
        fi
    fi

    # Min
    if [ -z ${dict_min[$var_name]} ]; then
        dict_min[$var_name]=$var_idx
    else
        if [ $var_idx -lt ${dict_min[$var_name]} ]; then
            dict_min[$var_name]=$var_idx
        fi
    fi

    var_name_last=$var_name
    var_idx_last=$var_idx
    var_dir_last=$var_dir

done


# The last one
if [ $var_count -eq 0 ]; then
    # Only one element
    echo "$var_name_last[${dict_min[$var_name_last]}]"
else
    if [ $var_dir = true ]; then
        echo "$var_name_last[${dict_max[$var_name_last]}:${dict_min[$var_name_last]}]"
    else
        echo "$var_name_last[${dict_min[$var_name_last]}:${dict_max[$var_name_last]}]"
    fi
fi

