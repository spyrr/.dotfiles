function workon() {
	BASE=~/.py/;
	if [ ${#} -eq 0 ]; then
		echo "Usage: workon [virtualenv dir]";
		return;
	fi
	[ -d ${BASE}${1} ] && source ${BASE}${1}/bin/activate || echo "There is no virtual environment, '${1}'"
}

function get_exploit() {
	TARGET=".";
	BASE="/usr/share/exploitdb/"
	if [ ${#} -eq 0 ]; then
		echo "Usage: get_exploit [/usr/share/exploitdb/<subpath>] [to]";
		return;
	elif [ ${#} -eq 2 ]; then
		TARGET=${2};
	fi

	[ -f ${BASE}${1} ] && echo "copy ${BASE}${1} to ${2}" && cp ${BASE}${1} ${2} || echo "There is no ${BASE}${1}";
}
export TIME_ZONE='Asia/Seoul'
export POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

alias lspy='ls -l ~/.py'
