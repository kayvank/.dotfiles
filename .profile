set +e
for i in `ls ~/.profile.d/*.sh`; do 
. $i
done
