#!/bin/bash
opcompile(){
        starttime=$(date +'%Y-%m-%d %H:%M:%S')
            # 开始
            cd lede
            make V=s -j$CORE
	    HOW=$(echo $?)
	    # 结束
        endtime=$(date +'%Y-%m-%d %H:%M:%S')
	
	start_seconds=$(date --date="$starttime" +%s)
	end_seconds=$(date --date="$endtime" +%s)
	
        if [ $HOW -eq 0 ];then
	    echo "编译完成，开始时间：$starttime；结束时间：$endtime；总耗时：$((end_seconds-start_seconds))秒。"
	else
            echo "编译失败，请将线程设为1，并查看具体原因，环境问题请提交issue。"
	fi

}

opcore(){
        
        flag=true
        read -p "设置线程数（必须大于或等于“1”）：   " CORE
        
        while $flag
        do
                expr $CORE + 0 &>/dev/null
                [ $? -eq 0 ] && flag=false  ||  read -p "请输入大于或等于1的整数！：" CORE
        done

}

opcore
opcompile
