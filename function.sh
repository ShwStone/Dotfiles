## Function
function mk() {
        mkdir -p $1
        cp ~/.dotfiles/default.cpp $1/$1.cpp
        touch $1/$1.in
}
function dos2linux() {
	iconv -f GBK -t UTF-8 -o $1 $1
	convmv -f GBK -t UTF-8 --notest --nosmart $1
}
function compile() {
	g++ $FILE.cpp -o $FILE -std=c++14 -Wall $*
	if [ $RUN ]; then
		./$FILE
	fi
}
function rbackup() {
	if [ ! -e $1 ]; then
		echo "$1 does not exist."
		return -1
	fi
	sudo mount $1 /mnt && sudo rsync -aAXHvxr --delete --delete-excluded --exclude='/dev/*' --exclude='/proc/*' --exclude='/sys/*' --exclude='/tmp/*' --exclude='/run/*' --exclude='/mnt/*' --exclude='/media/*' --exclude='/lost+found/' --exclude="$HOME/[^.]*" / /mnt
	sudo umount /mnt
}
function dbackup() {
	if [ ! -e $1 ]; then
		echo "$1 does not exist."
		return -1
	fi
	sudo mount $1 /mnt && sudo rsync -avxr --delete --delete-excluded --exclude='/.*' $HOME /mnt/dbackup
	sudo umount /mnt
}
function zhihu() {
	sed 's/\$/\$\$/g' $1 > $1.zhihu.md
	sed -i 's/\$\$\$\$/\$\$/g' $1.zhihu.md
}
