toupper(){
    echo "$@" | tr abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ
}

name=lib$1
ucname=$(toupper ${name})
file=$2

gitver="$(git describe --tags --match 'v*' | sed -e 's/.*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/')"

eval $(awk "/#define ${ucname}_VERSION_M/ { print \$2 \"=\" \$3 }" "$file")
eval ${ucname}_VERSION=\$${ucname}_VERSION_MAJOR.\$${ucname}_VERSION_MINOR.\$${ucname}_VERSION_MICRO
eval echo "${name}_VERSION=\${${ucname}_VERSION}-sophon-${gitver}"
eval echo "${name}_VERSION_MAJOR=\$${ucname}_VERSION_MAJOR"
eval echo "${name}_VERSION_MINOR=\${${ucname}_VERSION_MINOR}-sophon-${gitver}"
