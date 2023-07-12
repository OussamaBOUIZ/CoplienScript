#!/bin/sh

FILENAME=$1
CLASSNAME=$(echo $1 | cut -d'.' -f 1)
CPPFILENAME="${CLASSNAME}.cpp"
GUARDSSTYLE="_${CLASSNAME}_H__"
CANON="#ifndef ${GUARDSSTYLE}\\n# define ${GUARDSSTYLE}\\n\\n
class ${CLASSNAME} {\\n
        \\tpublic:\\n
        \\t\\t${CLASSNAME} ( void );\\n
        \\t\\t~${CLASSNAME} ( void );\\n
        \\t\\t${CLASSNAME} ( const ${CLASSNAME} & );\\n
        \\t\\tconst ${CLASSNAME} &operator= ( const ${CLASSNAME} & );\\n
};\\n\\n#endif"

CIMP="
#include \"${FILENAME}\"\\n\\n${CLASSNAME}::${CLASSNAME} ( void ) {\\n\\n}\\n\\n\
${CLASSNAME}::~${CLASSNAME} ( void ) {\\n\\n}\\n\\n\
${CLASSNAME}::${CLASSNAME} ( const ${CLASSNAME} &obj ) {\\n\\n}\\n\\n\
const ${CLASSNAME} &${CLASSNAME}::operator= ( const ${CLASSNAME} &obj ) {\\n\\n}\\n\\n"

echo $CANON > $FILENAME
echo $CIMP > $CPPFILENAME