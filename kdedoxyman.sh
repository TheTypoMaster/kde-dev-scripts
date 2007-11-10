#! /bin/sh
#
# kdedoxyman.sh
# Copyright 2007 by Allen Winter <winter@kde.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
#

# A program to generate API man pages for KDE modules using doxygen.

# Program options:
#  -d <dir>: install the generated man pages to this directory
#

usage="`basename $0` -d <dir>"

install_dir="";
while getopts ":d:" options; do
  case $options in
    d ) install_dir=$OPTARG;;
    h ) echo $usage;;
    \? ) echo $usage
         exit 1;;
    * ) echo $usage
          exit 1;;

  esac
done

# compute the default output directory, if necessary
if ( test "$install_dir" = "" ) then
  echo "must specify the installation directory with the -d option. Exiting..."
  exit 1
fi

( cat <<EOF ) | doxygen -
#---------------------------------------------------------------------------
# Project related configuration options
#---------------------------------------------------------------------------
PROJECT_NAME           = KDE
PROJECT_NUMBER         = 4.0
OUTPUT_DIRECTORY       = $install_dir
CREATE_SUBDIRS         = NO
OUTPUT_LANGUAGE        = English
USE_WINDOWS_ENCODING   = NO
BRIEF_MEMBER_DESC      = YES
REPEAT_BRIEF           = YES
ABBREVIATE_BRIEF       = "The \$name class" \
                         "The \$name widget" \
                         "The \$name file" \
                         is \
                         provides \
                         specifies \
                         contains \
                         represents \
                         a \
                         an \
                         the
ALWAYS_DETAILED_SEC    = NO
INLINE_INHERITED_MEMB  = NO
FULL_PATH_NAMES        = NO
STRIP_FROM_PATH        = 
STRIP_FROM_INC_PATH    = 
SHORT_NAMES            = NO
JAVADOC_AUTOBRIEF      = NO
MULTILINE_CPP_IS_BRIEF = NO
DETAILS_AT_TOP         = NO
INHERIT_DOCS           = YES
SEPARATE_MEMBER_PAGES  = NO
TAB_SIZE               = 8
OPTIMIZE_OUTPUT_FOR_C  = NO
OPTIMIZE_OUTPUT_JAVA   = NO
BUILTIN_STL_SUPPORT    = NO
DISTRIBUTE_GROUP_DOC   = NO
SUBGROUPING            = YES
#---------------------------------------------------------------------------
# Build related configuration options
#---------------------------------------------------------------------------
EXTRACT_ALL            = NO
EXTRACT_PRIVATE        = YES
EXTRACT_STATIC         = YES
EXTRACT_LOCAL_CLASSES  = YES
EXTRACT_LOCAL_METHODS  = NO
HIDE_UNDOC_MEMBERS     = NO
HIDE_UNDOC_CLASSES     = NO
HIDE_FRIEND_COMPOUNDS  = NO
HIDE_IN_BODY_DOCS      = NO
INTERNAL_DOCS          = NO
CASE_SENSE_NAMES       = YES
HIDE_SCOPE_NAMES       = NO
SHOW_INCLUDE_FILES     = YES
INLINE_INFO            = YES
SORT_MEMBER_DOCS       = YES
SORT_BRIEF_DOCS        = NO
SORT_BY_SCOPE_NAME     = NO
GENERATE_TODOLIST      = YES
GENERATE_TESTLIST      = YES
GENERATE_BUGLIST       = YES
GENERATE_DEPRECATEDLIST = YES
ENABLED_SECTIONS       = 
MAX_INITIALIZER_LINES  = 30
SHOW_USED_FILES        = YES
SHOW_DIRECTORIES       = NO
FILE_VERSION_FILTER    = 
#---------------------------------------------------------------------------
# configuration options related to warning and progress messages
#---------------------------------------------------------------------------
QUIET                  = NO
WARNINGS               = YES
WARN_IF_UNDOCUMENTED   = YES
WARN_IF_DOC_ERROR      = YES
WARN_NO_PARAMDOC       = YES
WARN_FORMAT            = "\$file:\$line: \$text"
WARN_LOGFILE           =
#---------------------------------------------------------------------------
# configuration options related to the input files
#---------------------------------------------------------------------------
INPUT                  = .
FILE_PATTERNS          = *.cpp \
                         *.cc \
                         *.cxx \
                         *.h \
                         *.hh \
                         *.hxx \
                         *.hpp
RECURSIVE              = YES
EXCLUDE                = 
EXCLUDE_SYMLINKS       = NO
EXCLUDE_PATTERNS       = *.ui *.svn *.dir CMakeFiles
EXAMPLE_PATH           = 
EXAMPLE_PATTERNS       = *
EXAMPLE_RECURSIVE      = NO
IMAGE_PATH             = 
INPUT_FILTER           = 
FILTER_PATTERNS        = 
FILTER_SOURCE_FILES    = NO
#---------------------------------------------------------------------------
# configuration options related to the alphabetical class index
#---------------------------------------------------------------------------
ALPHABETICAL_INDEX     = NO
COLS_IN_ALPHA_INDEX    = 5
IGNORE_PREFIX          = 
#---------------------------------------------------------------------------
# do NOT generate any formats other than man
#---------------------------------------------------------------------------
SOURCE_BROWSER         = NO
GENERATE_HTML          = NO
GENERATE_LATEX         = NO
GENERATE_RTF           = NO
GENERATE_XML           = NO
GENERATE_AUTOGEN_DEF   = NO
GENERATE_PERLMOD       = NO
DISABLE_INDEX          = YES
#---------------------------------------------------------------------------
# configuration options related to the man page output
#---------------------------------------------------------------------------
GENERATE_MAN           = YES
MAN_OUTPUT             = man
MAN_EXTENSION          = .3
MAN_LINKS              = YES
#---------------------------------------------------------------------------
# Configuration options related to the preprocessor   
#---------------------------------------------------------------------------
ENABLE_PREPROCESSING   = YES
MACRO_EXPANSION        = NO
EXPAND_ONLY_PREDEF     = NO
SEARCH_INCLUDES        = YES
INCLUDE_PATH           = 
INCLUDE_FILE_PATTERNS  = 
PREDEFINED             = 
EXPAND_AS_DEFINED      = 
SKIP_FUNCTION_MACROS   = YES
#---------------------------------------------------------------------------
# Configuration::additions related to external references   
#---------------------------------------------------------------------------
ALLEXTERNALS           = NO
EXTERNAL_GROUPS        = YES
PERL_PATH              = /usr/bin/perl
#---------------------------------------------------------------------------
# Configuration options related to the dot tool   
#---------------------------------------------------------------------------
CLASS_DIAGRAMS         = NO
HIDE_UNDOC_RELATIONS   = YES
HAVE_DOT               = NO
CLASS_GRAPH            = NO
COLLABORATION_GRAPH    = NO
GROUP_GRAPHS           = NO
UML_LOOK               = NO
TEMPLATE_RELATIONS     = NO
INCLUDE_GRAPH          = NO
INCLUDED_BY_GRAPH      = YES
CALL_GRAPH             = NO
CALLER_GRAPH           = NO
GRAPHICAL_HIERARCHY    = NO
DIRECTORY_GRAPH        = NO
GENERATE_LEGEND        = NO
#---------------------------------------------------------------------------
# Configuration::additions related to the search engine   
#---------------------------------------------------------------------------
SEARCHENGINE           = NO


### KDE Settings
ALIASES = \
	"intern=\par<b>Internal use only.</b>" \
	"reimp=\par<b>Reimplemented from superclass.</b>" \
	"obsolete=@deprecated" \
	"feature=\xrefitem features \"Feature(s)\" \"Features\"" \
	"maintainer=\xrefitem maintainers \"Maintainer(s)\" \"Maintainers\"" \
	"unmaintained=\xrefitem unmaintained \"Unmaintained\" \"Unmaintained\"" \
	"requirement=\xrefitem requirements \"Requirement(s)\" \"Requirements\"" \
	"faq=\xrefitem FAQ \"F.A.Q.\" \"F.A.Q.\"" \
	"authors=\xrefitem authors \"Author(s)\" \"Authors\"" \
	"maintainers=\xrefitem maintainers \"Maintainer(s)\" \"Maintainers\"" \
	"port4=\xrefitem port4 \"KDE 4 Porting Guide\" \"KDE 4 Porting Guide\"" \
	"glossary=\xrefitem glossary \"KDE 4 Glossary\" \"KDE 4 Glossary\"" \
        "acronym=\b "\
	"licenses=\xrefitem licenses \"License(s)\" \"Licenses\"" \
	"short=@brief "\
	"FIXME=\xrefitem fixme \"Fixme\" \"Fixme\"" \
	"bc=\xrefitem bc \"Binary Compatible\" \"Binary Compatible\"" \
	"artistic=<a href=\"http://www.opensource.org/licenses/artistic-license.php\">Artistic</a>" \
	"bsd=<a href=\"http://www.xfree86.org/3.3.6/COPYRIGHT2.html#5\">BSD</a>" \
	"x11=<a href=\"http://www.xfree86.org/3.3.6/COPYRIGHT2.html#3\">X11</a>" \
	"gpl=<a href=\"http://www.fsf.org/licensing/licenses/gpl.html#SEC1\">GPL</a>" \
	"lgpl=<a href=\"http://www.fsf.org/licensing/licenses/lgpl.html#SEC1\">LGPL</a>" \
	"qpl=<a href=\"http://www.trolltech.com/products/qt/licenses\">QPL</a>"
EOF
