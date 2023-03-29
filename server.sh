server_folder_name=$(date +%s)
url='https://piston-data.mojang.com/v1/objects/8f3112a1049751cc472ec13e397eade5336ca7ae/server.jar'
screen_name='MC_SERVER_'$server_folder_name

path_download='tmp'
server_path='servers/'$server_folder_name
jar_filename='server1.jar'
jar_xmx='4G'
jar_xms='1G'

server_start_script_name='start_server.sh'
jar_file_path=$path_download'/'$jar_filename
jar_server_path=$server_path'/'$jar_filename

echo $jar_server_path
java_command='java -Xmx'$jar_xmx' -Xms'$jar_xms' -jar '$jar_filename' nogui'

echo 'Server Folder: '$server_folder_name 

mkdir -p $path_download
mkdir -p $server_path
cd $path_download
wget $url
mv * ./$jar_filename
echo $path_download/$jar_filename
echo $server_path/$jar_filename
cd ..
cp $path_download/$jar_filename $server_path/$jar_filename
echo $java_command > $server_path/$server_start_script_name
echo '\neula=true' > $server_path/eula.txt
cd $server_path
sh $server_start_script_name
