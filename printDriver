if [[ $# -eq 0 ]] ; then
    echo 'please specify a .jar file to read from...'
    kill -INT $$
fi
#jar tf can be used instead of unzip -l
a=$(unzip -l $1 | grep -i Driver)
b="${a//\//.}"  
echo "${b//.class/}"
