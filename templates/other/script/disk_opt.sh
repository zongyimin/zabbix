cat >disk.xml << EOF 
<?xml version="1.0" encoding="UTF-8"?>
<zabbix_export>
    <version>2.0</version>
    <date>2013-03-22T02:34:22Z</date>
    <screens>
        <screen>
            <name>opt</name>
            <hsize>3</hsize>
            <vsize>30</vsize>
            <screen_items>
EOF
IPARGV=($(for i in $(seq 116 181);do echo 10.10.10.$i;done))
#IPARGV=($(grep -v "#" ip.txt))
for num in $(seq 0 $(((${#IPARGV[@]}+1)/3-1)))
do
         cat >>disk.xml << EOF
                <screen_item>
                    <resourcetype>0</resourcetype>
                    <width>400</width>
                    <height>100</height>
                    <x>0</x>
                    <y>$num</y>
                    <colspan>1</colspan>
                    <rowspan>1</rowspan>
                    <elements>0</elements>
                    <valign>0</valign>
                    <halign>1</halign>
                    <style>0</style>
                    <url/>
                    <dynamic>0</dynamic>
                    <sort_triggers>0</sort_triggers>
                    <resource>
                        <name>Disk space usage /opt</name>
                        <host>$(echo ${IPARGV[$(echo $(($num*3+0)))]})</host>
                    </resource>
                </screen_item>
                <screen_item>
                    <resourcetype>0</resourcetype>
                    <width>400</width>
                    <height>100</height>
                    <x>1</x>
                    <y>$num</y>
                    <colspan>1</colspan>
                    <rowspan>1</rowspan>
                    <elements>0</elements>
                    <valign>0</valign>
                    <halign>1</halign>
                    <style>0</style>
                    <url/>
                    <dynamic>0</dynamic>
                    <sort_triggers>0</sort_triggers>
                    <resource>
                        <name>Disk space usage /opt</name>
                        <host>$(echo ${IPARGV[$(echo $(($num*3+1)))]})</host>
                    </resource>
                </screen_item>
                <screen_item>
                    <resourcetype>0</resourcetype>
                    <width>400</width>
                    <height>100</height>
                    <x>2</x>
                    <y>$num</y>
                    <colspan>1</colspan>
                    <rowspan>1</rowspan>
                    <elements>0</elements>
                    <valign>0</valign>
                    <halign>1</halign>
                    <style>0</style>
                    <url/>
                    <dynamic>0</dynamic>
                    <sort_triggers>0</sort_triggers>
                    <resource>
                        <name>Disk space usage /opt</name>
                        <host>$(echo ${IPARGV[$(echo $(($num*3+2)))]})</host>
                    </resource>
                </screen_item>
EOF
    done
cat >>disk.xml <<EOF
            </screen_items>
        </screen>
    </screens>
</zabbix_export>
EOF
